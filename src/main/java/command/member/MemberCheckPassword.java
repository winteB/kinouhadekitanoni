package command.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;

/**
 * Servlet implementation class MemberCheckPassword
 */
@WebServlet("/MemberCheckPassword")
public class MemberCheckPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberCheckPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		MemberDao dao = new MemberDao();
		String gubun = request.getParameter("pw_gubun");
		
		if(gubun.equals("Myinfo")) {
			String password = request.getParameter("t_password");
	
			try {
			password = dao.encryptSHA256(password);
			}catch(NoSuchAlgorithmException e) {
				e.printStackTrace();
				System.out.println("MemberCheckId 에러");
			}
			out.print(password);
		}
		
		else if(gubun.equals("PasswordUpdate")) {
			String password = request.getParameter("t_password");
			String id = request.getParameter("t_id");
	
			try {
			password = dao.encryptSHA256(password);
			}catch(NoSuchAlgorithmException e) {
				e.printStackTrace();
				System.out.println("MemberCheckId 에러");
			}
			
			int count = dao.checkMemberPassword(id,password);
			if(count==1) {
				out.print("yes");
			}else {
				out.print("no");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
