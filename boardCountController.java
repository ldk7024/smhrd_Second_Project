package kr.smhrd.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.smhrd.model.BoardDAOMybatis;
import kr.smhrd.model.BoardVO;

public class boardCountController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int board_idx = Integer.parseInt(request.getParameter("board_idx"));
		int board_count = Integer.parseInt(request.getParameter("board_count"));
		
		BoardVO vo = new BoardVO(); 
		
		vo.setBoard_idx(board_idx);
		vo.setBoard_count(board_count);
		
		String view = null;
		BoardDAOMybatis dao = new BoardDAOMybatis();
		int cnt = dao.boardUpdate(vo);
		PrintWriter out = response.getWriter();
		out.println(cnt); // $.ajax() -> 형식적으로 응답 : success
		
		
		return null;
	}

}
