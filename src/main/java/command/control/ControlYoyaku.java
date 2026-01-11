package command.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.CommonUtil;
import dao.YoyakuDao;
import dto.MemberDto;
import dto.YoyakuDto;

public class ControlYoyaku implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		
		YoyakuDao dao = new YoyakuDao();
		
		String select = request.getParameter("t_select");
		String search = request.getParameter("t_search");
		String pay = request.getParameter("t_pay");
		String kind = request.getParameter("t_kind");
		String orderStart =	request.getParameter("t_order_start");
		String orderEnd   =	request.getParameter("t_order_end");
		
		if(select==null){
			select="all";
			search="";
			pay="all";
			kind="all";
			orderStart = "";
			orderEnd = "";
		}
		search=CommonUtil.escapeHtml(search);
		
		/* paging 설정 start*/
		int totalCount = dao.getManagerListTotalCount(select,search,kind,pay,orderStart,orderEnd);
		System.out.println(totalCount);
		int list_setup_count = 10;  //한페이지당 출력 행수 
		int pageNumber_count = 5;  //한페이지당 출력 페이지 갯수
		
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
		/* order 설정 */
		int orderNo = totalCount - start +1;
		
		List<YoyakuDto> list = dao.getManagerYoyakuList(select,search,kind,pay,start,end,orderStart,orderEnd);
		String pageDisplay = CommonUtil.getManagerPageSetting(current_page, total_page, pageNumber_count);
		
		request.setAttribute("ylist", list);
		request.setAttribute("order", orderNo);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("nowpage", current_page);
		request.setAttribute("total_page", total_page);
		request.setAttribute("pageDisplay", pageDisplay);
		request.setAttribute("select", select);
		request.setAttribute("search", search);
		request.setAttribute("pay", pay);
		request.setAttribute("kind", kind);
		request.setAttribute("orderStart", orderStart);
		request.setAttribute("orderEnd", orderEnd);
	}

}
