package kr.smhrd.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.smhrd.model.BoardDAOMybatis;
import kr.smhrd.model.BoardVO;

public class AjaxBoardUpdateController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");
		int board_idx = Integer.parseInt(request.getParameter("board_idx"));
				
		BoardVO vo = new BoardVO(); 
				
		vo.setBoard_title(board_title);
		vo.setBoard_content(board_content);
		vo.setBoard_idx(board_idx);
		
		String view = null;
		BoardDAOMybatis dao = new BoardDAOMybatis();
		int cnt = dao.boardUpdate(vo);
		PrintWriter out = response.getWriter();
		out.println(cnt); // $.ajax() -> 형식적으로 응답 : success
		
		return null;
	}

}
