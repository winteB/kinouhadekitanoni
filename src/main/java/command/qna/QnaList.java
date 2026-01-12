package command.qna;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.CommonUtil;
import dao.QnaDao;
import dto.QnaDto;

public class QnaList implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		QnaDao dao = new QnaDao();
		
		String select = request.getParameter("t_select");
		String search = request.getParameter("t_search");
		if(select == null){
			select = "title";
			search = "";
		}
		
		/* paging 설정 start*/
		int totalCount = dao.getTotalCount(select,search);
		
		int list_setup_count = 5;  //한페이지당 출력 행수 
		int pageNumber_count = 3;  //한페이지당 출력 페이지 갯수
		
		String nowPage = request.getParameter("t_nowPage");
		int current_page = 0; // 현재페이지 번호
		int total_page = 0;    // 전체 페이지 수
		
		if(nowPage == null || nowPage.equals("")) current_page = 1; 
		else current_page = Integer.parseInt(nowPage);
		
		total_page = totalCount / list_setup_count;  // 몫 : 2
		int rest = 	totalCount % list_setup_count;   // 나머지:1
		if(rest !=0) total_page = total_page + 1;     // 3
		
		int start = (current_page -1) * list_setup_count + 1;
		int end   = current_page * list_setup_count;
		/* paging 설정 end*/
		
		//N001이 아닌 실제 번호로 바꾸기 메소드 
//	 	int order = totalCount - (current_page - 1) * list_setup_count;
		int order = totalCount - (start - 1);
		
		List<QnaDto> list = dao.getQnaList(select, search, start, end);
		
		String pageDisplay = CommonUtil.getPageSetting(current_page, total_page, pageNumber_count);
		
		request.setAttribute("list", list);
		request.setAttribute("order", order);
		request.setAttribute("select", select);
		request.setAttribute("search", search);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("pageDisplay", pageDisplay);
	}

}
