package command.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.ControlDAO;
import dto.ControlDTO;

public class ControlUser implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		ControlDAO dao=new ControlDAO();
		
		List<ControlDTO> list=dao.getUserList();

	}

}
