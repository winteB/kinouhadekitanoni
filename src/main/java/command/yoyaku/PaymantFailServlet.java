package command.yoyaku;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PaymantDao;

/**
 * Servlet implementation class PaymantFailServlet
 */
@WebServlet("/PaymantFailServlet")
public class PaymantFailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymantFailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String paymentKey = request.getParameter("paymentKey");
		String orderId    = request.getParameter("orderId");
		String amount     = request.getParameter("amount");

		
		PaymantDao dao = new PaymantDao();
		int result = dao.deletPreYoyaky(orderId);
		String msg = result==1?"결제 실패":"오류 발생";
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "index");
		
		RequestDispatcher rd = request.getRequestDispatcher("common_alert.jsp");
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
