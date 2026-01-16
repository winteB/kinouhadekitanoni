package command.member;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.CommonUtil;
import dao.MemberDao;

public class MemberDelete implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MemberDao dao = new MemberDao();
		
		// 1. 삭제할 ID 가져오기 (세션 또는 파라미터)
		String id = request.getParameter("t_id");
		
		// 2. DAO Delete 호출
		int result = dao.deleteMember(id);
		
		String msg = "탈퇴 처리되었습니다.";
		String url = "Index"; // 메인 페이지로 이동
		
		if(result == 1) {
			// 3. 성공 시 세션 로그아웃 처리
			HttpSession session = request.getSession();
			session.invalidate(); 
		} else {
			msg = "탈퇴 실패했습니다.";
			url = "Member?t_gubun=myinfo";
		}
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", url);
	}
}