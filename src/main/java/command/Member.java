package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.member.MemberDelete;
import command.member.MemberLogin;
import command.member.MemberLogout;
import command.member.MemberMyInfo;
import command.member.MemberSave;
import command.member.MemberUpdate;
import common.CommonExecute;
import common.CommonUtil;

/**
 * Servlet implementation class Member
 */
@WebServlet("/Member")
public class Member extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Member() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String view = "";
		String gubun = request.getParameter("t_gubun");
		
		if(gubun == null) {
			gubun = "";
		}
		if(gubun.equals("")) {
			gubun = "login";
		}
		
		// --- [로그인 화면 이동] ---
		if(gubun.equals("login")) {
			view = "member/member_login.jsp";
			// 이미 로그인 된 상태라면 내 정보 페이지로 튕겨내기
			if(CommonUtil.getSessionInfo(request) != null && !CommonUtil.getSessionInfo(request).equals("")){
				view = "member/member_myinfo.jsp"; // 혹은 바로 Member?t_gubun=myinfo 로 리다이렉트
			}
		} 
		// --- [로그인 처리] ---
		else if(gubun.equals("memberLogin")) {
			CommonExecute mem = new MemberLogin();
			mem.execute(request);
			view = "common_alert.jsp";
		} 
		// --- [로그아웃 처리] ---
		else if(gubun.equals("memberLogout")){
			CommonExecute mem = new MemberLogout();
			mem.execute(request);
			view = "common_alert.jsp";
		}
		// --- [비밀번호 찾기 등] ---
		else if(gubun.equals("password")) {
			view = "member/member_password.jsp";
		} 
		// --- [회원가입 화면] ---
		else if(gubun.equals("join")) {
			view = "member/member_join.jsp";
		} 
		// --- [회원가입 저장] ---
		else if(gubun.equals("save")){
			CommonExecute member = new MemberSave();
			member.execute(request);
			view="common_alert.jsp";
		} 
		
		// ==========================================================
		//  [내 정보 보기 (상세 조회)]
		// ==========================================================
		else if(gubun.equals("myinfo")) {
			CommonExecute mem = new MemberMyInfo();
			mem.execute(request);
			view = "member/member_myinfo.jsp";
		} 
		
		// ==========================================================
		//  [내 정보 수정 (Update)]
		// ==========================================================
		else if(gubun.equals("update")) {
			CommonExecute mem = new MemberUpdate();
			mem.execute(request);
			view = "common_alert.jsp";
		}
		
		// ==========================================================
		//  [회원 탈퇴 (Delete)]
		// ==========================================================
		else if(gubun.equals("delete")) {
			CommonExecute mem = new MemberDelete();
			mem.execute(request);
			view = "common_alert.jsp";
		}
		
		else if(gubun.equals("myyoyaku")) {
			view = "member/member_myyoyaku_list.jsp";
		}
		
		request.setAttribute("sidemenu_active", gubun);
		
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}