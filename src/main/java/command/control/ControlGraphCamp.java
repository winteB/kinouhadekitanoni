package command.control;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
        
        // 1. "yca", "mfi" 같은 값을 받음
        String gubun = request.getParameter("t_gubun"); 
        
        // 2. [수정] DB에 들어가기 전에 변수 설정 (순서 변경!)
        String dbKind = "ca"; // DB 검색용 (기본값 ca)
        boolean isYearly = true; // 년간/월간 구분

        // 낚시인 경우
        if(gubun.equals("yfi") || gubun.equals("mfi")) {
            dbKind = "fi";
        }
        // 월간인 경우
        if(gubun.equals("mca") || gubun.equals("mfi")) {
            isYearly = false;
        }

        // 3. [수정] 변환된 dbKind("ca" 또는 "fi")로 DAO 호출
        List<ControlSalesDTO> list = dao.getCampGraph(dbKind);
        
        
        // 4. [수정] 리스트 데이터를 그래프용 배열에 옮겨 담기
        long[] graphArray = null;
        String[] graphArrayDay =null;
        String[] graphArraym =null;
        // 오늘 날짜 기준 잡기 (2026-01-XX)
        String today = CommonUtil.getTodayTime(); 
        String thisYear = today.substring(0, 4);
        String thisMonth = today.substring(5, 7);
        
        
        DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        LocalDate now = LocalDate.now();
        LocalDate monday = now.with(DayOfWeek.MONDAY);
        LocalDate sunday = now.with(DayOfWeek.SUNDAY);

        if(isYearly) {
            // [년간] 12칸 (0~11)
            graphArray = new long[12];
            
            for(ControlSalesDTO dto : list) {
                if(dto.getPaydate() == null) continue;
                String dYear = dto.getPaydate().substring(0, 4);
                String dMonth = dto.getPaydate().substring(5, 7);
                
                // 올해 데이터만 배열에 합산
                if(dYear.equals(thisYear)) {
                	int idx = Integer.parseInt(dMonth) - 1;
                	graphArray[idx] += dto.getPrice();
                }
            }
        } else {

				graphArray = new long[7]; // 0~6 = 월~일
				
				for (ControlSalesDTO dto : list) {
				    if (dto.getPaydate() == null) continue;
				
				    // "2026-01-09 ..." 에서 날짜만 자르기
				    String d = dto.getPaydate().substring(0, 10);
				    LocalDate pay = LocalDate.parse(d, df);
				
				    if (!pay.isBefore(monday) && !pay.isAfter(sunday)) {
				        int idx = pay.getDayOfWeek().getValue() - 1; // MON=1..SUN=7 -> 0..6
				        graphArray[idx] += dto.getPrice();
                }
            }
        }
        long max = 0;
        for (long v : graphArray) if (v > max) max = v;

        int[] graphPercent = new int[graphArray.length];
        for (int i = 0; i < graphArray.length; i++) {
            graphPercent[i] = (max == 0) ? 0 : (int)Math.round(graphArray[i] * 100.0 / max);
            if (graphPercent[i] < 2 && graphArray[i] > 0) graphPercent[i] = 2;
        }

        request.setAttribute("graphArray", graphArray);      // 금액(툴팁용)
        request.setAttribute("graphPercent", graphPercent);  // 높이(%)
        request.setAttribute("r_gubun", gubun);
        
        
    }
}