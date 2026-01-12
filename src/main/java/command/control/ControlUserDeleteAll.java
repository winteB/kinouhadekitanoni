package command.control;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.ControlDAO;

public class ControlUserDeleteAll implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		String[] idd         = request.getParameterValues("memcheck");
		for(String mid : idd) {
			System.out.println("아이디값: "+mid);
		}
		ControlDAO dao = new ControlDAO();
		int result = dao.deleteUserAll(idd);
		
		String msg= result==idd.length? "회원정보 삭제 성공":"회원정보 삭제 실패";
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Control");
		request.setAttribute("t_gubun", "user");
	}

}
