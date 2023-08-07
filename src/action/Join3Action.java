package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Join3Action implements FCSeoul {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		
		request.setAttribute("name", name);
		request.setAttribute("phone", phone);
		
		RequestDispatcher rd = request.getRequestDispatcher("join3.jsp");
		rd.forward(request, response);

	}

}
