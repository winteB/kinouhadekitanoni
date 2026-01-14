package command.member;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import dao.YoyakuDao;
import dto.YoyakuDto;

public class MemberMyYoyaku implements CommonExecute {

    @Override
    public void execute(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("sessionId");
        
        // 로그인 체크
        if(userId != null && !userId.equals("")) {
            YoyakuDao dao = new YoyakuDao();
            List<YoyakuDto> list = dao.getMemberYoyakuList(userId);
            
            request.setAttribute("yoyakuList", list);
            request.setAttribute("listCount", list.size());
        }
    }
}