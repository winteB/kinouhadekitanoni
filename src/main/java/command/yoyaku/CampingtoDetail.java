package command.yoyaku;

import java.text.DateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.YoyakuDao;
import dto.CampingDto;

public class CampingtoDetail implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		String selected_area = request.getParameter("selected_area");
		String selected_date = "";
		String checkout_date = "";
		int nights = 1;
		
		if(selected_area==null) {
			selected_area = request.getParameter("r_site");
			selected_date = request.getParameter("r_checkin_date");
			checkout_date = request.getParameter("r_checkout_date");
			DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate checkin = LocalDate.parse(selected_date);     // yyyy-MM-dd
			LocalDate checkout = LocalDate.parse(checkout_date);   // yyyy-MM-dd
			nights = (int)ChronoUnit.DAYS.between(checkin, checkout);

		}else {
			selected_date = request.getParameter("selected_date");
			DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate date = LocalDate.parse(selected_date, df);
			LocalDate tomorrow = date.plusDays(1);
			checkout_date = tomorrow.format(df);
		}
		
		System.out.println(checkout_date);
		

		
		YoyakuDao dao = new YoyakuDao();
		//리스트 . 캠핑카 리스트 및 예약정보와 조인해서 해당 기간동안 예약되지 않은 날짜만.
		List<CampingDto> clist = dao.getCampingSiteList(selected_area,selected_date,checkout_date);
		int price = (dao.getCampingPrice(selected_area)*nights);
		
		
		
		request.setAttribute("selected_area", selected_area);
		request.setAttribute("selected_date", selected_date);
		request.setAttribute("checkout_date", checkout_date);
		request.setAttribute("clist", clist);
		request.setAttribute("price", price);
	}

}
