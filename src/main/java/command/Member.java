package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.member.MemberLogin;
import command.member.MemberLogout;
import command.member.MemberSave;
import common.CommonExecute;

/**
 * Servlet implementation class Member
 */
@WebServlet("/Member")
public class Member extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Member() {
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
         gubun = "login";
      }
      
      //여기서부터 페이지로 보내는 용도
      //로그인
      if(gubun.equals("login")) {

         view = "member/member_login.jsp";
      }//로그인 시도
      else if(gubun.equals("memberLogin")) {
    	  CommonExecute mem = new MemberLogin();
    	  mem.execute(request);
          view = "common_alert.jsp";
      }else if(gubun.equals("memberLogout")){
    	  CommonExecute mem = new MemberLogout();
    	  mem.execute(request);
    	  view = "common_alert.jsp";
		}
      
      
      else if(gubun.equals("password")) {

         view = "member/member_password.jsp";
      }else if(gubun.equals("join")) {
    	  
         view = "member/member_join.jsp";
      
      //회원등록
      }else if(gubun.equals("save")){
    	  CommonExecute member = new MemberSave();
    	  member.execute(request);
 			
    	  view="common_alert.jsp";
    
      }else if(gubun.equals("myinfo")) {

         view = "member/member_myinfo.jsp";
      }else if(gubun.equals("myyoyaku")) {

         view = "member/member_myyoyaku_list.jsp";
       }
      
      request.setAttribute("sidemenu_active", gubun);
      
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
