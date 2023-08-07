package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDAO;
import dto.NoticeDTO;

public class NoticeMainAction implements FCSeoul {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int pageNum = 0;
		try{
			pageNum = Integer.parseInt(request.getParameter("page"));
			if(pageNum == 0){
				pageNum = 1;
			}
		} catch(NumberFormatException e){
			pageNum = 1;
		}
		
		NoticeDAO nDao = new NoticeDAO();
		NoticeDTO nDto = nDao.noticeCount();
		int count = nDto.getCount();
		
		
		request.setAttribute("count", count);
		
		RequestDispatcher rd = request.getRequestDispatcher("Notice.jsp");
		rd.forward(request, response);
		
		
	}

}
