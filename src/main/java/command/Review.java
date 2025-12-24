package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Review
 */
@WebServlet("/Review")
public class Review extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Review() {
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
      if(gubun.equals("")) {
         gubun = "list";
      }
      
      //여기서부터 페이지로 보내는 용도
      if(gubun.equals("list")) {

         view = "review/review_list.jsp";;
      }
      else if(gubun.equals("view")) {

         view = "review/review_view.jsp";
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
