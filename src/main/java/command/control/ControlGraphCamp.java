package command.control;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.ControlSalesDAO;
import dto.ControlSalesDTO;

public class ControlGraphCamp implements CommonExecute {

    @Override
    public void execute(HttpServletRequest request) {
        ControlSalesDAO dao = new ControlSalesDAO();
        
        String gubun = request.getParameter("t_gubun"); 
        
        boolean isTotal = false; // [1] 통합(캠핑+낚시) 여부 체크 플래그

        // gubun이 "desh"면 -> 통합 모드 켜고(true), 주간 모드("mca")로 설정
        if(gubun == null || gubun.equals("desh")) {
            gubun = "mca"; 
            isTotal = true; // ★ 대시보드는 통합 매출이어야 함
        }

        String dbKind = "ca";
        boolean isYearly = true; 

        if(gubun.equals("yfi") || gubun.equals("mfi")) {
            dbKind = "fi";
        }
        
        if(gubun.equals("mca") || gubun.equals("mfi")) {
            isYearly = false; // 주간
        }

        // [2] 기본 데이터 가져오기 (보통 캠핑)
        List<ControlSalesDTO> list = dao.getCampGraph(dbKind);
        
        // [3] ★ 통합 모드일 경우, 낚시 데이터도 추가로 가져오기
        List<ControlSalesDTO> listFish = null;
        if(isTotal) {
            listFish = dao.getCampGraph("fi");
        }
        
        long[] graphArray;
        String[] graphLabels; 

        if (isYearly) {
            // [4] 년간 매출 (1~12월)
            graphArray = new long[12];
            graphLabels = new String[12];
            for(int i=0; i<12; i++) graphLabels[i] = (i+1) + "월"; 

            for(ControlSalesDTO dto : list) {
                if(dto.getPaydate() == null) continue;
                int month = Integer.parseInt(dto.getPaydate().substring(5, 7));
                graphArray[month - 1] += dto.getPrice();
            }

        } else {
            // [5] 주간 매출 (최근 7일)
            graphArray = new long[7];
            graphLabels = new String[7];
            
            LocalDate today = LocalDate.now(); 
            // today = LocalDate.of(2026, 1, 19); // 테스트용 날짜

            for (int i = 0; i < 7; i++) {
                LocalDate targetDate = today.minusDays(6 - i);
                
                graphLabels[i] = targetDate.format(DateTimeFormatter.ofPattern("MM-dd"));
                String targetDateStr = targetDate.toString(); 

                long sum = 0;
                
                // 1) 기본 리스트 합산 (캠핑)
                for (ControlSalesDTO dto : list) {
                    if (dto.getPaydate() != null && dto.getPaydate().startsWith(targetDateStr)) {
                        sum += dto.getPrice();
                    }
                }
                
                // 2) ★ 통합 모드면 낚시 리스트도 합산
                if(isTotal && listFish != null) {
                    for (ControlSalesDTO dto : listFish) {
                        if (dto.getPaydate() != null && dto.getPaydate().startsWith(targetDateStr)) {
                            sum += dto.getPrice();
                        }
                    }
                }
                
                graphArray[i] = sum;
            }
        }

        request.setAttribute("graphArray", graphArray);
        request.setAttribute("graphLabels", graphLabels); 
        request.setAttribute("r_gubun", gubun);
    }
}