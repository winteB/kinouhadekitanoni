package command.yoyaku;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.YoyakuDao;
import dto.FishingDto;

public class FishingtoDetail implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		
		//선택한 강 지역 + 메인서 진입
		String river = request.getParameter("selected_area");
		//여기선 좌대 크기
		String selected_area = "S";
		String selected_date = "";
		String checkout_date = "";
		int nights = 1;
		

		YoyakuDao dao = new YoyakuDao();
		List<FishingDto> flist = null;
		if(river==null) {
			//디테일에서 새 선택
			selected_area = request.getParameter("r_spot");
			river = request.getParameter("r_river");
			selected_date = request.getParameter("r_checkin_date");
			checkout_date = request.getParameter("r_checkout_date");
			LocalDate checkin = LocalDate.parse(selected_date);     // yyyy-MM-dd
			LocalDate checkout = LocalDate.parse(checkout_date);   // yyyy-MM-dd
			nights = (int)ChronoUnit.DAYS.between(checkin, checkout);
			flist = dao.getFishingSiteList(selected_date,checkout_date);

		}else {
			//메인서 진입 > 
			selected_date = request.getParameter("selected_date");
			DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate date = LocalDate.parse(selected_date, df);
			LocalDate tomorrow = date.plusDays(1);
			checkout_date = tomorrow.format(df);
			//현재 예약 없는 좌대 중 첫번쨰 것
			flist = dao.getFishingSiteList(selected_date,checkout_date);
			selected_area = flist.get(0).getNo();
		}
		
		System.out.println(checkout_date);
		
		//리스트 . 좌대정보 및 예약정보와 조인해서 해당 기간동안 예약되지 않은 날짜만.
		
		//선택한 좌대 가격
		String size=dao.getFishSize(selected_area);
		int price = (dao.getCampingPrice(size)*nights);
		
		

		
		
		request.setAttribute("river", river);
		request.setAttribute("selected_area", selected_area);
		request.setAttribute("selected_date", selected_date);
		request.setAttribute("checkout_date", checkout_date);
		request.setAttribute("flist", flist);
		request.setAttribute("price", price);

	}

}
