package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PhotoDAO;
import dto.PhotoDTO;

public class PhotoDetailAction implements FCSeoul {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int bno = Integer.parseInt(request.getParameter("bno"));
		int pageNum = 0;
		try{
			pageNum = Integer.parseInt(request.getParameter("page"));
			if(pageNum == 0){
				pageNum = 1;
			}
		} catch(NumberFormatException e){
			pageNum = 1;
		}
		String category ="";
		String searchValue = "";
		String searchType = "";
		int endNum = pageNum * 15;
		int startNum = endNum - 14;
		try{
			category = request.getParameter("category");
			searchValue = request.getParameter("searchValue");
			searchType = request.getParameter("searchType");
			if(category == null){
				category = "all";
			} 
		} catch(Exception e){
			e.printStackTrace();
		}
		PhotoDAO pDao = new PhotoDAO();
		ArrayList<PhotoDTO> photoList = pDao.photoSelect(category, searchValue, startNum, endNum);
		PhotoDTO pCount = pDao.photoCount(category, searchValue);
		PhotoDTO pDetail = pDao.PhotoDetail(bno, startNum, endNum);
		int count = pCount.getCount();
		
		request.setAttribute("photoList", photoList);
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("category", category);
		request.setAttribute("searchValue", searchValue);
		request.setAttribute("title", pDetail.getTitle());
		request.setAttribute("r_date", pDetail.getR_date());
		request.setAttribute("image", pDetail.getImage());
		request.setAttribute("bno", pDetail.getBno());
		
		
		RequestDispatcher rd = request.getRequestDispatcher("PhotoDetail.jsp");
		rd.forward(request, response);
	}

}
