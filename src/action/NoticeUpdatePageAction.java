package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDAO;
import dto.NoticeDTO;

public class NoticeUpdatePageAction implements FCSeoul {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		NoticeDAO nDao = new NoticeDAO();
		NoticeDTO nDto = nDao.noticeUpdatePage(bno);
		String title = nDto.getTitle();
		String content = nDto.getContent();
		
		request.setAttribute("title", title);
		request.setAttribute("content", content);
		request.setAttribute("bno", bno);
		
		RequestDispatcher rd = request.getRequestDispatcher("NoticeUpdate.jsp");
		rd.forward(request, response);

	}

}
