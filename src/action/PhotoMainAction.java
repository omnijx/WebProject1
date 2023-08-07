package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PhotoDAO;
import dto.PhotoDTO;

public class PhotoMainAction implements FCSeoul{

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
		String category ="";
		String searchValue = "";
		String searchType = "";
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
		int endNum = pageNum * 15;
		int startNum = endNum - 14;

		PhotoDAO photoDao = new PhotoDAO();
		
		ArrayList<PhotoDTO> photoList = photoDao.photoSelect(category, searchValue, startNum, endNum);
		PhotoDTO photoCount = photoDao.photoCount(category, searchValue);
		int count = photoCount.getCount();
		
		request.setAttribute("photoList", photoList);
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("category", category);
		request.setAttribute("searchValue", searchValue);
		
		RequestDispatcher rd = request.getRequestDispatcher("Photo.jsp");
		rd.forward(request, response);
	}

}
