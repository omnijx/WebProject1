package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDAO;
import dto.NoticeDTO;
import dto.PhotoDTO;

public class NoticeDetailAction implements FCSeoul {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int bno = Integer.parseInt(request.getParameter("bno"));
		int pageNum;
		try{
			pageNum = Integer.parseInt(request.getParameter("page"));
			if(pageNum == 0){
				pageNum = 1;
			} 
		} catch(NumberFormatException e){
			pageNum = 1;
		}
		int endNum = pageNum * 10;
		int startNum = endNum - 9;
		NoticeDAO nDao = new NoticeDAO();
		ArrayList<NoticeDTO> noticeList = nDao.noticeSelect(startNum, endNum);
		NoticeDTO nDetail = nDao.noticeDetail(bno);
		NoticeDTO nCount = nDao.noticeCount();
		int count = nCount.getCount();
		
		request.setAttribute("noticeList", noticeList);	
		request.setAttribute("title", nDetail.getTitle());
		request.setAttribute("content", nDetail.getContent());
		request.setAttribute("w_date", nDetail.getW_date());
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("bno", bno);
		
		RequestDispatcher rd = request.getRequestDispatcher("NoticeDetail.jsp");
		rd.forward(request, response);
	}

}
