package command.control;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.CommonUtil;
import dao.ControlSalesDAO;
import dto.ControlSalesDTO;

public class ControlGraphCamp implements CommonExecute {

    @Override
    public void execute(HttpServletRequest request) {
        ControlSalesDAO dao = new ControlSalesDAO();
        
        String gubun = request.getParameter("t_gubun"); 
        
        String dbKind = "ca";
        boolean isYearly = true;

        if(gubun.equals("yfi") || gubun.equals("mfi")) {
            dbKind = "fi";
        }
        if(gubun.equals("mca") || gubun.equals("mfi")) {
            isYearly = false;
        }

        List<ControlSalesDTO> list = dao.getCampGraph(dbKind);
        
        long[] graphArray = null;
        String[] graphArrayDay =null;
        String[] graphArraym =null;
        String today = CommonUtil.getTodayTime(); 
        String thisYear = today.substring(0, 4);
        String thisMonth = today.substring(5, 7);
        
        graphArray = new long[7];
        
        	
        	for(ControlSalesDTO dto:list) {
        		// 날짜 확인 및 요일 계산
        	    if(dto.getPaydate() == null) continue;
        	    LocalDate date = LocalDate.parse(dto.getPaydate().substring(0, 10));
        	    
        	    // [중요] 여기서 '요일 번호'가 매번 바뀝니다! 
        	    // 월요일이면 1, 수요일이면 3, 일요일이면 7...
        	    int dayNum = date.getDayOfWeek().getValue(); 
        	    
        	    // [3] ★여기가 핵심입니다★
        	    // 넣을 위치(idx)를 dayNum으로 결정해야 합니다.
        	    // 혹시 여기에 0이나 k를 넣지 않았나요?
        	    int idx = dayNum - 1; 
        	    
        	    // [4] 결정된 위치(idx)에 넣습니다.
        	    // idx가 0이면 월요일 칸, 2면 수요일 칸에 들어갑니다.
        	    graphArray[idx] = graphArray[idx] + dto.getPrice();
        	}
        	
        
        
        
        
        
        
        
        
        

        request.setAttribute("graphArray", graphArray);
        request.setAttribute("r_gubun", gubun);
        
        
    }
    
    
}