package command.notice;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.CommonExecute;
import common.CommonUtil;
import dao.NoticeDao;
import dto.NoticeDto;

public class NoticeSave implements CommonExecute{
	@Override
	public void execute(HttpServletRequest request) {
		NoticeDao dao = new NoticeDao();
		MultipartRequest mpr = null;
		String attachDir = CommonUtil.getNoticeDir(request);
		int maxSize = 1024 * 1024 * 10;
		
		try {
			mpr = new MultipartRequest(request,
									   attachDir,
									   maxSize,
									   "utf-8",
									   new DefaultFileRenamePolicy());
		}catch(IOException e) {
			e.printStackTrace();
		}
		String no = dao.getNoticeNo();
		String title = mpr.getParameter("t_title");
		title = CommonUtil.escapeHtml(title);
		
		String content = mpr.getParameter("t_content");
		content = CommonUtil.escapeHtml(content);
		
		String important = mpr.getParameter("t_important");
		
		String attach = mpr.getFilesystemName("t_attach");
		if(attach == null) attach = "";
		
		String reg_id = CommonUtil.getSessionInfo(request);
		
		String reg_date = CommonUtil.getTodayTime();
		
		NoticeDto dto = new NoticeDto(no, title, content, important, attach,
										reg_id, reg_id, reg_date, maxSize);
		int result = dao.noticeSave(dto);
		String msg = result == 1 ? "등록되었습니다~":"등록 실패!";
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Notice");
		
	}
}
