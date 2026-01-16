package command.control;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.ControlDAO;

public class ControlUserDelete implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		String id         = request.getParameter("t_no");
		
		ControlDAO dao = new ControlDAO();
		int result = dao.deleteUser(id);
		
		String msg= result==1? "회원정보 삭제 성공":"회원정보 삭제 실패";
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Control");
		request.setAttribute("t_gubun", "user");
	}

}
