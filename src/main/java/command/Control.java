package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.control.ControlGraphCamp;
import command.control.ControlGraphFish;
import command.control.ControlTotalSales;
import command.control.ControlUser;
import common.CommonExecute;
import common.CommonUtil;


/**
 * Servlet implementation class Control
 */
@WebServlet("/Control")
public class Control extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Control() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String view = "";
		String gubun = request.getParameter("t_gubun");
		
		
		
		//gubun 값 null/공백 처리
		if(gubun == null) {
			gubun = "";
		}
		if(gubun.equals("")){
			gubun="desh";
		}
		
		//여기서부터 페이지로 보내는 용도

		if(gubun.equals("desh")) {
			CommonExecute control=new ControlTotalSales();
			control.execute(request);
			control=new ControlGraphCamp();
			control.execute(request);
			view="/control/Administration_main.jsp";
		}
		//여기서부터 페이지로 보내는 용도
		if(gubun.equals("user")) {
			CommonExecute control=new ControlUser();
			control.execute(request);
			view="/control/Administration_Membership.jsp";
		}
		else if(gubun.equals("sell")) {
			CommonExecute control=new ControlTotalSales();
			control.execute(request);
			CommonExecute control1=new ControlGraphCamp();
			control1.execute(request);
			view="/control/Administration_sales.jsp";
		}
		else if(gubun.equals("reservation")) {
			
			view="/control/Administration_reservations.jsp";
		}else if(gubun.equals("yca")) {
			CommonExecute control=new ControlTotalSales();
			control.execute(request);
			control=new ControlGraphFish();
			control.execute(request);
			view="/control/Administration_sales.jsp";
		}else if(gubun.equals("yfi")) {
			CommonExecute control=new ControlTotalSales();
			control.execute(request);
			control=new ControlGraphFish();
			control.execute(request);
			view="/control/Administration_sales.jsp";
		}else if(gubun.equals("mca")) {
			CommonExecute control=new ControlTotalSales();
			control.execute(request);
			control=new ControlGraphCamp();
			control.execute(request);
			view="/control/Administration_sales.jsp";
		}else if(gubun.equals("mfi")) {
			CommonExecute control=new ControlTotalSales();
			control.execute(request);
			control=new ControlGraphCamp();
			control.execute(request);
			view="/control/Administration_sales.jsp";
		}
		
		System.out.println("view = " + view);
		if(CommonUtil.getSessionInfo(request)==null) {
	    	view = "common_alert.jsp";
			request.setAttribute("t_url", "Member");
			request.setAttribute("t_msg", "관리자 페이지입니다.");
		}else if(CommonUtil.getSessionInfo(request).equals("")){
	    	view = "common_alert.jsp";
			request.setAttribute("t_url", "Member");
			request.setAttribute("t_msg", "관리자 페이지입니다.");
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
