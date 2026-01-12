package command.control;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import common.CommonExecute;
import common.CommonUtil;
import dao.ControlSalesDAO;
import dto.ControlSalesDTO;

public class ControlTotalSales implements CommonExecute {

    @Override
    public void execute(HttpServletRequest request) {
        ControlSalesDAO dao = new ControlSalesDAO();
        List<ControlSalesDTO> list = dao.getTotalSales();
        
        long campMonth = 0; 
        long fishMonth = 0;
        long campYear = 0;
        long fishYear = 0;
        
        // 오늘 날짜 가져오기 (예: 2026-01-09)
        String today = CommonUtil.getTodayTime(); 
        String thisYear = today.substring(0, 4);  // "2026"
        String thisMonth = today.substring(5, 7); // "01" (하이픈 위치 고려)

        for(ControlSalesDTO dto : list) {
            if(dto.getPaydate() == null) continue;
            
            String payDate = dto.getPaydate();
            String dataYear = payDate.substring(0, 4);
            String dataMonth = payDate.substring(5, 7);
            
            // [핵심 수정] 캠핑 여부를 boolean으로 확실하게 판단
            // "ca"가 맞으면 true, 아니면 false(낚시)
            boolean isCamp = "ca".equals(dto.getKind());
            
            // 1. 올해 데이터인지 확인
            if(dataYear.equals(thisYear)) {
                // 년간 매출 더하기
                if(isCamp) {
                    campYear += dto.getPrice();
                } else {
                    fishYear += dto.getPrice();
                }
                
                // 2. 이번 달 데이터인지 확인
                if(dataMonth.equals(thisMonth)) {
                    // 월간 매출 더하기
                    if(isCamp) {
                        campMonth += dto.getPrice();
                    } else {
                        fishMonth += dto.getPrice();
                    }
                }
                
                
                
            }
        }
        
        request.setAttribute("campMonth", campMonth);
        request.setAttribute("fishMonth", fishMonth);
        request.setAttribute("campYear", campYear);
        request.setAttribute("fishYear", fishYear);
        request.setAttribute("list", list);
    }
}