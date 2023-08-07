package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.UserDAO;
import user.UserDTO;

public class MyPageAction implements FCSeoul {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		UserDAO dao = new UserDAO();
		UserDTO dto = dao.select(id);
		
		request.setAttribute("name", dto.getName());
		request.setAttribute("nick_name", dto.getNick_name());
		request.setAttribute("number_of_login", dto.getNumber_of_login());
		
		
		if(id != null) {
			request.getRequestDispatcher("MyPage.jsp").forward(request , response);
		} else {
			request.setAttribute("LoginMsg", "<script>alert('로그인 후 이용해주세요.')</script>");
			request.getRequestDispatcher("Servlet?command=login").forward(request , response);
		}

	}
}
