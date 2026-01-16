package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonUtil;

/**
 * Servlet implementation class Paymant
 */
@WebServlet("/Paymant")
public class Paymant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Paymant() {
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
		//gubun 값으로 낚시 예약페이지에서 온 건지 캠핑 예약 페이지에서 온 건지 구분
		//gubun 값 null/공백 처리
		if(gubun == null) {
			gubun = "";
		}
		if(gubun.equals("")) {
			gubun = "main";
		}
		
		//여기서부터 페이지로 보내는 용도
		//잘못 넘어온 거면 커버 페이지로 보냄
		if(gubun.equals("main")) {

			view = "cover.jsp";
		}
		else if(gubun.equals("camping")) {
			//예약하러 보내기
			String kind       = request.getParameter("t_kind"); 
			
			String no         = request.getParameter("order_no"); 
			String user_id    = CommonUtil.getSessionInfo(request); 
			String user_name  = (String)request.getSession().getAttribute("sessionName");
			
			String price      = request.getParameter("r_price"); 
			String party      = request.getParameter("r_party"); 
			
			
			request.setAttribute("orderNo", no);
			request.setAttribute("price", price);
			if(kind.equals("fi")) {
				request.setAttribute("orderName", "좌대 예약");
			}else {
				request.setAttribute("orderName", request.getParameter("r_site")+" 예약");				
			}
			request.setAttribute("customerName", user_name);
			request.setAttribute("successUrl", CommonUtil.getBaseUrl(request)+"/PaymantSuccessServlet");
			request.setAttribute("failUrl", CommonUtil.getBaseUrl(request)+"/PaymantFailServlet");

			view = "PaymantSuccessServlet";
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
