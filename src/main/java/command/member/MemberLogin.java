package command.member;

import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import dao.MemberDao;

public class MemberLogin implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MemberDao dao = new MemberDao();
		
		HttpSession session = request.getSession(false);
	    if (session != null) {
	        session.invalidate(); 
	    }
	    session = request.getSession(true);
	    
		String id = request.getParameter("t_id");
		String password = request.getParameter("t_password");
		
		try {
			password = dao.encryptSHA256(password);
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		String name = dao.memberLogin(id, password);
		String msg = "";
		String url = "";
		if(name.equals("")) {
			msg = "ID 및 비밀번호가 잘못되었습니다.";
			url = "Member";
		}else {
			msg = name+"님 로그인 되었습니다.";
			url = "Index";
			
			session = request.getSession();
			
			session.setAttribute("sessionId", id);
			session.setAttribute("sessionName", name);
			
			if(id.equals("manager")) {
				session.setAttribute("sessionLevel", "top");
			}

			session.setMaxInactiveInterval(60*60*24);
		}
		System.out.println(msg+url);
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", url);
		
		
	}

}
