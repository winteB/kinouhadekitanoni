package command.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.CommonUtil;
import dao.ControlSalesDAO;
import dto.ControlSalesDTO;

public class ControlGraphFish implements CommonExecute {

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
	        
	        graphArray = new long[12];
	        
	        	

	        // 2. 데이터(List)는 딱 한 번만 훑습니다.
	        for(ControlSalesDTO dto : list) {
	            if(dto.getPaydate() == null) continue;

	            String dYear = dto.getPaydate().substring(0, 4);
	            String dMonth = dto.getPaydate().substring(5, 7); // 월 (01~12)

	            // 올해 데이터만 잡아서
	            if(dYear.equals(thisYear)) {
	                
	                // [자동 분류]
	                // 월을 숫자로 바꾼 뒤, 제자리(index)를 찾아줍니다.
	                // 1월 -> 0번 칸, 2월 -> 1번 칸 ... 12월 -> 11번 칸
	                int idx = Integer.parseInt(dMonth) - 1; 
	                
	                // 해당 칸에 금액 누적
	                graphArray[idx] += dto.getPrice();
	            }
	        }
	        	
	        	
	     // 3. 결과 전송 (JSP에게 12개 꽉 찬 바구니를 줍니다)
	        request.setAttribute("graphArray", graphArray);
	        request.setAttribute("r_gubun", gubun);
	        
	        	


}
}
