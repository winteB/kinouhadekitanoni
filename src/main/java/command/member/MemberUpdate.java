package command.member;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.MemberDao;
import dto.MemberDto;

public class MemberUpdate implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MemberDao dao = new MemberDao();
		
		String id = request.getParameter("t_id");
		String name = request.getParameter("t_name");
		String password = request.getParameter("t_password"); 
		String age = request.getParameter("t_age"); 
		String address = request.getParameter("t_address");
		
		String mobile1 = request.getParameter("t_mobile_1");
		String mobile2 = request.getParameter("t_mobile_2");
		String mobile3 = request.getParameter("t_mobile_3");
		
		String email1 = request.getParameter("t_email_1");
		String email2 = request.getParameter("t_email_2");
		String gender = request.getParameter("t_gender");
		
		// [수정 포인트]
		// 1. age는 String으로 받아왔으므로 Integer.parseInt(age)로 변환 (DTO가 int인 경우)
		// 2. MemberDto 생성자가 바뀌었으므로, 마지막에 reg_date, update_date 자리에 빈 값 "" 추가
		MemberDto dto = new MemberDto(
				id, 
				name, 
				password, 
				age,
				address, 
				mobile1, mobile2, mobile3, 
				email1, email2, 
				gender,
				"", // reg_date (수정시 필요없음)
				""  // update_date (DAO 쿼리에서 sysdate로 처리됨)
		);
		
		int result = dao.updateMember(dto);
		
		String msg = "수정되었습니다.";
		if(result != 1) {
			msg = "수정 실패했습니다.";
		}
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Member?t_gubun=myinfo");
	}
}