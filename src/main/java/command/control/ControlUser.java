package command.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.CommonUtil;
import dao.ControlDAO;
import dto.MemberDto;

public class ControlUser implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		ControlDAO dao=new ControlDAO();
		
		String select = request.getParameter("t_select");
		String colum = request.getParameter("t_colum");
		String search = request.getParameter("t_search");

		if(select==null){
			select="all";
			colum="id";
			search="";
		}
		search=CommonUtil.escapeHtml(search);
		
		/* paging 설정 start*/
		int totalCount = dao.getTotalCount(select,colum,search);
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
		
		List<MemberDto> list = dao.getUserList(select,colum,search,start,end);
		String pageDisplay = CommonUtil.getManagerPageSetting(current_page, total_page, pageNumber_count);
		
		request.setAttribute("mlist", list);
		request.setAttribute("order", orderNo);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("nowpage", current_page);
		request.setAttribute("pageDisplay", pageDisplay);
		request.setAttribute("select", select);
		request.setAttribute("search", search);
	}

}
