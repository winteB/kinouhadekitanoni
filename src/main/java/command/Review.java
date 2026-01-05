package command;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.CommonUtil;
import dao.ReviewDao;
import dto.ReviewCommentDto;
import dto.ReviewDto;

@WebServlet("/Review")
public class Review extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Review() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String session_id = (String)session.getAttribute("session_id");

		String view = "";
		String gubun = request.getParameter("t_gubun");
		if(gubun == null || gubun.equals("")) gubun = "list";
		
		ReviewDao dao = new ReviewDao();
		
		// 1. 목록 조회
		if(gubun.equals("list")) {
			List<ReviewDto> list = dao.getReviewList();
			request.setAttribute("t_list", list);
			view = "/review/review_list.jsp";
		}
		
		// 2. 작성 폼
		else if(gubun.equals("write")) {
//			if(session_id == null) {
//				request.setAttribute("t_msg", "로그인 후 이용해주세요.");
//				request.setAttribute("t_url", "Member?t_gubun=login");
//				view = "/common_alert.jsp";
//			} else {
				view = "/review/review_write.jsp";
//			}
		}
		
		// 3. 리뷰 저장
		else if(gubun.equals("save")) {
			
//			String dir = request.getServletContext().getRealPath("/file_room");
			String dir = CommonUtil.getFileSaveDir(request, "review");
			File folder = new File(dir);
			if(!folder.exists()) {
				folder.mkdirs();
			}
			
			int max = 10 * 1024 * 1024; // 10MB
			
			MultipartRequest m = null;
			try {
				m = new MultipartRequest(request, dir, max, "utf-8", new DefaultFileRenamePolicy());
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			if(m != null) {
				String target_id = m.getParameter("t_target_id");
				String title     = m.getParameter("t_title");
				
				
				
				String ratingStr = m.getParameter("t_rating");
				String content   = m.getParameter("t_content");
				String attach    = m.getFilesystemName("t_attach");
				
				String user_id = (String)session.getAttribute("session_id");
				if(user_id == null) user_id = "Guest"; 
				
				int rating = 5;
				if(ratingStr != null && !ratingStr.equals("")) {
					rating = Integer.parseInt(ratingStr);
				}
				
				ReviewDto dto = new ReviewDto(title, user_id, target_id, attach, rating, content);
				int result = dao.insertReview(dto);
				
				if(result == 1) {
					request.setAttribute("t_msg", "리뷰가 등록되었습니다.");
					request.setAttribute("t_url", "Review?t_gubun=list");
				} else {
					request.setAttribute("t_msg", "등록 실패!");
					request.setAttribute("t_url", "Review?t_gubun=write");
				}
				view = "/common_alert.jsp";
			} else {
				request.setAttribute("t_msg", "파일 업로드 오류 발생");
				request.setAttribute("t_url", "Review?t_gubun=write");
				view = "/common_alert.jsp";
			}
		}
		
		// 4. 상세 보기
		else if(gubun.equals("view")) {
			String no = request.getParameter("t_no");
			
			// 조회수 증가
			dao.updateHit(no); 
			
			// 상세 내용 조회
			ReviewDto dto = dao.getReviewView(no);
			
			// 댓글 목록 조회
			List<ReviewCommentDto> commentList = dao.getCommentList(no);
			
			request.setAttribute("t_dto", dto);
			request.setAttribute("t_comment_list", commentList);
			
			view = "/review/review_view.jsp";
		}
		
		// 5. 댓글 저장
		else if(gubun.equals("save_comment")) {
			String no = request.getParameter("t_no");
			String content = request.getParameter("t_comment_content");
			
			if(session_id == null) {
				request.setAttribute("t_msg", "세션이 만료되었습니다. 다시 로그인해주세요.");
				request.setAttribute("t_url", "Member?t_gubun=login");
				view = "/common_alert.jsp";
			} else {
				int result = dao.insertComment(no, session_id, content);
				if(result == 1) {
					// 댓글 등록 성공 시 상세보기 페이지로 바로 리다이렉트
					response.sendRedirect("Review?t_gubun=view&t_no=" + no);
					return;
				} else {
					request.setAttribute("t_msg", "댓글 등록 실패");
					request.setAttribute("t_url", "Review?t_gubun=view&t_no=" + no);
					view = "/common_alert.jsp";
				}
			}
		}
		
		// 6. 댓글 삭제
		else if(gubun.equals("delete_comment")) {
			String c_no = request.getParameter("t_c_no");
			String no = request.getParameter("t_no"); // 돌아갈 글 번호
			
			int result = dao.deleteComment(c_no);
			if(result == 1) {
				// 삭제 성공 시 바로 리다이렉트
				response.sendRedirect("Review?t_gubun=view&t_no=" + no);
				return;
			} else {
				request.setAttribute("t_msg", "삭제 실패");
				request.setAttribute("t_url", "Review?t_gubun=view&t_no=" + no);
				view = "/common_alert.jsp";
			}
		}
		
		// 7. 수정 폼
		else if(gubun.equals("update")) {
			String no = request.getParameter("t_no");
			ReviewDto dto = dao.getReviewView(no);
			request.setAttribute("t_dto", dto);
			view = "/review/review_update.jsp";
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}