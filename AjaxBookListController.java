package kr.smhrd.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.smhrd.model.BoardDAOMybatis;
import kr.smhrd.model.BoardVO;
import kr.smhrd.model.BookVO;



public class AjaxBookListController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String search = request.getParameter("search");
		
		BookVO vo = new BookVO();
		vo.setBook_name(search);
		
		
		BoardDAOMybatis dao = new BoardDAOMybatis();
		List<BookVO> list = dao.bookList(vo);
		
		
		// Gson API
		Gson g = new Gson();
		String bookList = g.toJson(list); // [{ }, { }, { }]
		// System.out.println(bList);
		response.setContentType("text/json;charset=euc-kr");
		PrintWriter out = response.getWriter();
		out.println(bookList);
		System.out.println("책책책리스트");
		
		return null;
	}

}
