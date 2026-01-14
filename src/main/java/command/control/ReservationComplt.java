package command.control;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonExecute;
import dao.YoyakuDao;

public class ReservationComplt implements CommonExecute{

	public void execute(HttpServletRequest request) {
		String level = (String)request.getSession().getAttribute("sessionLevel");
		YoyakuDao dao = new YoyakuDao();
		if("top".equals(level)) {
			String orderNo = request.getParameter("t_yno");
			int result = dao.setYoyakuComplt(orderNo);
			
			String msg = result==1?"결제 상태로 변경되었습니다":"변경에 실패했습니다.";
			request.setAttribute("msg", msg);
			
		}

	}

}
