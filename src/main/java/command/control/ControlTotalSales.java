package command.control;

import java.util.*;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.CommonUtil;
import dao.ControlSalesDAO;
import dto.ControlSalesDTO;

public class ControlTotalSales implements CommonExecute {
	
	@Override
	public void execute(HttpServletRequest request) {
		ControlSalesDAO dao=new ControlSalesDAO();

		
		List<ControlSalesDTO> list=dao.getTotalSales();
		
		int campMonth=0;
		int fishMonth=0;
		int campYear=0;
		int fishYear=0;
		
		String thisYear = CommonUtil.getTodayTime();
		thisYear=thisYear.substring(0,4);
		String thisMonth = CommonUtil.getTodayTime();
		thisMonth=thisMonth.substring(4,7);
		
		String dataYear="";
		for(ControlSalesDTO dto:list) {
			if(dto.getPaydate() == null) continue;
			
			String yearFormat=dto.getPaydate().substring(0,4);
			String monthFormat=dto.getPaydate().substring(4,7);
			
			String isCamp="";
			String isFish="";
			String cf=dto.getKind();
			if(cf.equals("ca")) {
				isCamp="ca";
			}else {
				isFish="fi";
			}
			
			if(yearFormat.equals(thisYear)) {
				if(isCamp.equals("fi")) {
					fishYear+=dto.getPrice();
				}else {
					campYear+=dto.getPrice();
				}
			}
			
			if(yearFormat.equals(thisYear) && monthFormat.equals(thisMonth)) {
				if(isCamp.equals("")) {
					fishMonth+=dto.getPrice();
				}else {
					campMonth+=dto.getPrice();
				}
			}
			
			
		}
		request.setAttribute("campMonth", campMonth);
		request.setAttribute("fishMonth", fishMonth);
		request.setAttribute("campYear", campYear);
		request.setAttribute("fishYear", fishYear);
		request.setAttribute("list",list);
		
		
		

	}

}
