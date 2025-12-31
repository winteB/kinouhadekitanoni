package command.member;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.CommonUtil;
import dao.MemberDao;
import dto.MemberDto;

public class MemberSave implements CommonExecute{
@Override
	public void execute(HttpServletRequest request) {
		MemberDao dao = new MemberDao();
		
		String id              = request.getParameter("t_id");
		String name            = request.getParameter("t_name");
		String password        = request.getParameter("t_password");
		String password_length = Integer.toString(request.getParameter("t_password").length());
		try {
			password			=dao.encryptSHA256(password);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("비밀번호 암호화 에러");
		}
		
		String age             = request.getParameter("t_age");
		String address         = request.getParameter("t_address");
		String mobile_1        = request.getParameter("t_mobile_1");
		String mobile_2        = request.getParameter("t_mobile_2");
		String mobile_3        = request.getParameter("t_mobile_3");
		String email_1         = request.getParameter("t_email_1");
		String email_2         = request.getParameter("t_email_2");
		String gender          = request.getParameter("t_gender");
		String reg_date        = CommonUtil.getToday();
		String update_date     = "";
		String exit_date       = "";
		
		MemberDto dto = new MemberDto(id, name, password, password_length, age, address, mobile_1, mobile_2, mobile_3, email_1, email_2, gender, reg_date, update_date, exit_date);
		int result = dao.memberSave(dto);
		String msg = result==1? name+"님 회원가입 되었습니다.":"회원 가입 실패";
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Index");
		
		
	}
}
