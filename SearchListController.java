package kr.smhrd.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchListController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String query_ = request.getParameter("search");
		
		String query = "";
		if(query_ != null) {
			query = query_;
			
		}
		
		
		
		
		
		
		return null;
	}

}
