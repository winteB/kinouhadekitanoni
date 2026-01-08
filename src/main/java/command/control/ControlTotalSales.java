package command.control;

import java.util.*;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.ControlSalesDAO;
import dto.ControlSalesDTO;

public class ControlTotalSales implements CommonExecute {
	
	@Override
	public void execute(HttpServletRequest request) {
		ControlSalesDAO dao=new ControlSalesDAO();
		
		System.out.println("now=" + new Date());
		System.out.println("millis=" + System.currentTimeMillis());
		System.out.println("tz=" + TimeZone.getDefault());

		
		List<ControlSalesDTO> list=dao.getTotalSales();
		
		int campMonth=0;
		int fishMonth=0;
		int campYear=0;
		int fishYear=0;
		
		SimpleDateFormat yearFormat  = new SimpleDateFormat("yyyy");
		SimpleDateFormat monthFormat=new SimpleDateFormat("MM");
		
		String thisYear = yearFormat.format(new Date());
		String thisMonth = monthFormat.format(new Date());
		
		
		String dataYear="";
		for(ControlSalesDTO dto:list) {
			if(dto.getPaydate() == null) continue;
			
			dataYear=yearFormat.format(dto.getPaydate());
			String datamonth=monthFormat.format(dto.getPaydate());
			
			
			String isCamp="";
			String isFish="";
			String cf=dto.getKind();
			if(cf.equals("ca")) {
				isCamp="ca";
			}else {
				isFish="fi";
			}
			
			if(dataYear.equals(thisYear)) {
				if(isCamp.equals("")) {
					fishYear+=dto.getPrice();
				}else {
					campYear+=dto.getPrice();
				}
			}
			
			if(dataYear.equals(thisYear) && thisMonth.equals(datamonth)) {
				if(isCamp.equals("")) {
					fishMonth+=dto.getPrice();
				}else {
					campMonth+=dto.getPrice();
				}
			}
			
			
		}
		System.out.println("______+++++++"+dataYear);
		request.setAttribute("campMonth", campMonth);
		request.setAttribute("fishMonth", fishMonth);
		request.setAttribute("campYear", campYear);
		request.setAttribute("fishYear", fishYear);
		request.setAttribute("list",list);
		
		
		

	}

}
