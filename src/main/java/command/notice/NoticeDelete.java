package command.notice;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.CommonUtil;
import dao.NoticeDao;

public class NoticeDelete implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		NoticeDao dao = new NoticeDao();
		
		String no = request.getParameter("t_no");
		String attach = request.getParameter("t_attach");
		
		int result = dao.noticeDelete(no);
		if(result == 1 && !attach.equals("")) {
			File file = new File(CommonUtil.getFileSaveDir(request,"notice"), attach);
			boolean tf = file.delete();
			if(!tf) System.out.println("공지사항 삭제 첨부파일 삭제 오류!");
		}
		String msg = result == 1 ? "삭제 되었습니다.":"삭제 실패!";
		if(result == 1) {
			request.setAttribute("t_gubun", "list");
		}else {
			request.setAttribute("t_gubun", "view");
			request.setAttribute("t_no", no);
		}
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Notice");

	}

}
