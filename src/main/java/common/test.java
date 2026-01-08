
package common;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class test
 */
@WebServlet("/test")
public class test extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 공통 첨부파일 저장 경로 (개발/테스트용 - git 기준)
		String folderName = "name";

		    // 1. 현재 웹 프로젝트의 실제 경로 (git 프로젝트 기준)
		    String projectRoot = request
		            .getServletContext()
		            .getRealPath("/");

		    // 예:
		    // C:/Users/규원/git/kinouhadekitanoni/src/main/webapp/

		    // 2. attach 경로 구성
		    String savePath = projectRoot + "attach/" + folderName;
		    savePath = savePath.replace("/", File.separator);

		    System.out.println("📂 첨부파일 저장 경로: " + savePath);

		    // 3. 폴더 없으면 생성
		    File uploadDir = new File(savePath);
		    if (!uploadDir.exists()) {
		        uploadDir.mkdirs();
		    }

		    System.out.println(savePath);
		
		    CommonUtil.getFileSaveDir(request, "notice");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
