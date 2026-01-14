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
		
		// 세션값 가져오기 (sessionId)
		String session_id = (String)session.getAttribute("sessionId");

		String view = "";
		String gubun = request.getParameter("t_gubun");
		if(gubun == null || gubun.equals("")) gubun = "list";
		
		ReviewDao dao = new ReviewDao();
		
		// 1. 목록 조회 (검색 기능 + 페이징 포함)
		if(gubun.equals("list")) {
			String search = request.getParameter("t_search");
			if(search == null) search = "";
			
			/* ==========================================================
			 * [페이징 처리 로직 시작]
			 * ========================================================== */
			String nowPage = request.getParameter("t_nowPage");
			int current_page = 0;
			
			if(nowPage == null || nowPage.equals("")) current_page = 1;
			else current_page = Integer.parseInt(nowPage);
			
			int total_page = 0;
			int page_count = 6; // 한 페이지에 보여줄 게시물 수 (카드 형태이므로 8개 정도가 적당)
			int page_block = 5; // 페이지 번호 블록 개수 (1 2 3 4 5 ...)
			
			// 1. 전체 게시물 수 조회
			int total_count = dao.getTotalCount(search);
			
			// 2. 전체 페이지 수 계산
			total_page = (int)Math.ceil((double)total_count / page_count);
			
			// 3. DB 쿼리용 시작/끝 행 계산
			int start_row = (current_page - 1) * page_count + 1;
			int end_row = current_page * page_count;
			
			// 4. 페이징된 리스트 조회
			List<ReviewDto> list = dao.getReviewList(search, start_row, end_row);
			
			// 5. 페이징 HTML 생성 (CommonUtil 활용)
			String paging = CommonUtil.getPageSetting(current_page, total_page, page_block);
			
			/* ==========================================================
			 * [페이징 처리 로직 끝]
			 * ========================================================== */
			
			request.setAttribute("t_list", list);
			request.setAttribute("t_search", search);
			request.setAttribute("t_paging", paging);      // 페이징 HTML
			request.setAttribute("t_total_count", total_count); // 전체 개수 (필요시 사용)
			
			view = "/review/review_list.jsp";
		}
		
		// 2. 작성 폼
		else if(gubun.equals("write")) {
			view = "/review/review_write.jsp";
		}
		
		// 3. 리뷰 저장
		else if(gubun.equals("save")) {
			String dir = CommonUtil.getFileSaveDir(request, "review");
			File folder = new File(dir);
			if(!folder.exists()) folder.mkdirs();
			
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
				
				// [작성자 ID 결정]
				String user_id = session_id; 
				if(user_id == null || user_id.equals("")) {
					user_id = m.getParameter("t_user_id");
				}
				if(user_id == null || user_id.trim().equals("")) {
					user_id = "Guest";
				}
				
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
			dao.updateHit(no); 
			ReviewDto dto = dao.getReviewView(no);
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
				request.setAttribute("t_msg", "로그인이 필요합니다.");
				request.setAttribute("t_url", "Member?t_gubun=login");
				view = "/common_alert.jsp";
			} else {
				int result = dao.insertComment(no, session_id, content);
				if(result == 1) {
					request.setAttribute("t_msg", "댓글이 등록되었습니다.");
					request.setAttribute("t_url", "Review?t_gubun=view&t_no=" + no);
					view = "/common_alert.jsp";
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
			String no = request.getParameter("t_no");
			int result = dao.deleteComment(c_no);
			if(result == 1) {
				request.setAttribute("t_msg", "댓글이 삭제되었습니다.");
				request.setAttribute("t_url", "Review?t_gubun=view&t_no=" + no);
				view = "/common_alert.jsp";
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
		
		// 8. 수정 저장
		else if(gubun.equals("update_save")) {
			String dir = CommonUtil.getFileSaveDir(request, "review");
			File folder = new File(dir);
			if(!folder.exists()) folder.mkdirs();
			
			int max = 10 * 1024 * 1024;
			MultipartRequest m = null;
			try {
				m = new MultipartRequest(request, dir, max, "utf-8", new DefaultFileRenamePolicy());
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			if(m != null) {
				String no        = m.getParameter("t_no");
				String title     = m.getParameter("t_title");
				String target_id = m.getParameter("t_target_id");
				String content   = m.getParameter("t_content");
				String ratingStr = m.getParameter("t_rating");
				String attach     = m.getFilesystemName("t_attach");
				String old_attach = m.getParameter("t_old_attach");
				
				if(attach == null) attach = old_attach;
				else {
					if(old_attach != null && !old_attach.equals("")) {
						File delFile = new File(dir, old_attach);
						if(delFile.exists()) delFile.delete();
					}
				}
				
				int rating = Integer.parseInt(ratingStr);
				
				ReviewDto dto = new ReviewDto();
				dto.setNo(no);
				dto.setTitle(title);
				dto.setTarget_id(target_id);
				dto.setContent(content);
				dto.setRating(rating);
				dto.setAttach(attach);
				
				int result = dao.updateReview(dto);
				
				if(result == 1) {
					request.setAttribute("t_msg", "수정되었습니다.");
					request.setAttribute("t_url", "Review?t_gubun=view&t_no=" + no);
				} else {
					request.setAttribute("t_msg", "수정 실패!");
					request.setAttribute("t_url", "Review?t_gubun=update&t_no=" + no);
				}
				view = "/common_alert.jsp";
			} else {
				request.setAttribute("t_msg", "수정 중 오류 발생");
				request.setAttribute("t_url", "Review?t_gubun=list");
				view = "/common_alert.jsp";
			}
		}
		
		// 9. 삭제
		else if(gubun.equals("delete")) {
			String no = request.getParameter("t_no");
			int result = dao.deleteReview(no);
			
			if(result == 1) {
				request.setAttribute("t_msg", "삭제되었습니다.");
				request.setAttribute("t_url", "Review?t_gubun=list");
			} else {
				request.setAttribute("t_msg", "삭제 실패!");
				request.setAttribute("t_url", "Review?t_gubun=view&t_no=" + no);
			}
			view = "/common_alert.jsp";
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}