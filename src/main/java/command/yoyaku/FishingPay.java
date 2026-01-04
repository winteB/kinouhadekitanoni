package command.yoyaku;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.CommonUtil;
import dao.PaymantDao;
import dto.YoyakuDto;

public class FishingPay implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		PaymantDao dao = new PaymantDao();
		
		String no         = dao.getOrderNo();
		String user_id    = CommonUtil.getSessionInfo(request); 
		String kind       = request.getParameter("t_kind"); 
		String spot       = request.getParameter("r_spot"); 
		String river      = request.getParameter("r_river"); 
		String pay_date   = CommonUtil.getToday();
		String price      = request.getParameter("r_price"); 
		String start_date = request.getParameter("r_checkin_date"); 
		String end_date   = request.getParameter("r_checkout_date"); 
		String paymant    = "N"; 
		String party      = request.getParameter("r_party"); 
		
		YoyakuDto dto = new YoyakuDto(no, user_id, kind, spot, river, pay_date, price, start_date, end_date, paymant, party);

	}

}
