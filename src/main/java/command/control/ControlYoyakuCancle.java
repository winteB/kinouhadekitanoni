package command.control;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonExecute;
import common.CommonUtil;
import dao.YoyakuDao;

public class ControlYoyakuCancle  implements CommonExecute{

	public void execute(HttpServletRequest request) {
		String level = (String)request.getSession().getAttribute("sessionLevel");
		YoyakuDao dao = new YoyakuDao();
		if("top".equals(level)) {
			String todayTime = CommonUtil.getTodayTime();
			int result = dao.setNotPayedDelete(todayTime);
			
			String msg = result==1?"예약 정보가 삭제되었습니다.":"삭제에 실패했습니다.";
			request.setAttribute("msg", msg);
		}
		
	}

}
