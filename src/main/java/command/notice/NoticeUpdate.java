package command.notice;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.CommonExecute;
import common.CommonUtil;
import dao.NoticeDao;
import dto.NoticeDto;

public class NoticeUpdate implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		NoticeDao dao = new NoticeDao();
		MultipartRequest mpr = null;
		String attachDir = CommonUtil.getFileSaveDir(request,"notice");
		
		int maxSize = 1024 * 1024 * 10;

		try {
			mpr = new MultipartRequest(request,
									   attachDir,
									   maxSize,
									   "utf-8",
									   new DefaultFileRenamePolicy());
		} catch (IOException e) {
			e.printStackTrace();
		}
		String no = mpr.getParameter("t_no");
		String title = mpr.getParameter("t_title");
		title = CommonUtil.escapeHtml(title);
		
		String content = mpr.getParameter("t_content");
		content = CommonUtil.escapeHtml(content);
		
		String important = mpr.getParameter("t_important");
		String attach = mpr.getFilesystemName("t_attach");
		if(attach == null) attach = "";
		
		String dbAttachName = "";
		String deleteAttach = mpr.getParameter("t_delete_checkbox");
		String oriAttach = mpr.getParameter("t_ori_attach");
		
		//삭제 checkbox
		if(deleteAttach != null) {
			File file = new File(attachDir, deleteAttach);
			boolean tf = file.delete();
			if(!tf) System.out.println("공지사항 첫번째 첨부 삭제 오류!");
		}else {
			dbAttachName = oriAttach;
		}
		
		//새로운 첨부파일 등록
		if(!attach.equals("")) {
			if(!oriAttach.equals("")) {
				File file = new File(attachDir, oriAttach);
				boolean tf = file.delete();
				if(!tf) System.out.println("공지사항 두번째 첨부 삭제 오류!");
			}
			dbAttachName = attach;
		}
		
		NoticeDto dto = new NoticeDto(no, title, content, important,
				dbAttachName, "reg_id", "reg_name", "reg_date", 0);
		int result = dao.noticeUpdate(dto);
		System.out.println(dbAttachName);
		String msg = result == 1 ? "수정 되었습니다~":"수정 실패!";
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Notice");
		request.setAttribute("t_gubun", "view");
		request.setAttribute("t_no", no);		

	}

}
