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
		String user_name    = (String)request.getSession().getAttribute("sessionName");
		String kind       = request.getParameter("t_kind"); 
		String spot       = request.getParameter("r_spot"); 
		String river      = request.getParameter("r_river"); 
		String pay_date   = CommonUtil.getTodayTime();
		String price      = request.getParameter("r_price"); 
		String start_date = request.getParameter("r_checkin_date"); 
		String end_date   = request.getParameter("r_checkout_date"); 
		String paymant    = "N"; 
		String party      = request.getParameter("r_party"); 
		
		YoyakuDto dto = new YoyakuDto(no, user_id, kind, spot, river, pay_date, price, start_date, end_date, paymant, party);

/*		System.out.println(dto.getNo());
		System.out.println(dto.getKind());
		System.out.println(dto.getPay_date());
		System.out.println(dto.getPaymant());
		System.out.println(dto.getPrice());
		System.out.println(dto.getUser_id());
		System.out.println(dto.getStart_date());
		System.out.println(dto.getEnd_date());
		System.out.println(dto.getSpot());
		System.out.println(dto.getRiver());
		System.out.println(dto.getNo());
		
		
		System.out.println(user_name);
*/		
		int result = dao.savePreYoyaku(dto);
		String gubun = result==1?"true":"false";
		
		request.setAttribute("t_gubun", gubun);
		request.setAttribute("orderNo", no);
		request.setAttribute("price", price);
		request.setAttribute("orderName", "좌대 예약");
		request.setAttribute("customerName", user_name);
		request.setAttribute("successUrl", CommonUtil.getBaseUrl(request)+"/PaymantSuccessServlet");
		request.setAttribute("failUrl", CommonUtil.getBaseUrl(request)+"/PaymantFailServlet");

	}

}
