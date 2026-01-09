package command.member;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.CommonUtil;
import dao.MemberDao;
import dto.MemberDto;

public class MemberMyInfo implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MemberDao dao = new MemberDao();
		
		// 1. 세션에서 ID 가져오기
		String id = CommonUtil.getSessionInfo(request);
		System.out.println("MemberMyInfo 실행 - 세션ID: [" + id + "]");
		
		// 2. 로그인이 되어 있다면 DB 조회
		if(id != null && !id.equals("")) {
			MemberDto dto = dao.getMemberView(id);
			
			// 3. 조회 결과를 request에 담기
			if(dto != null) {
				request.setAttribute("dto", dto);
				System.out.println("MemberMyInfo - DTO 조회 성공");
			} else {
				System.out.println("MemberMyInfo - DTO가 NULL입니다. (DB 조회 실패)");
			}
		} else {
			System.out.println("MemberMyInfo - 로그인이 되어있지 않습니다.");
		}
	}
}