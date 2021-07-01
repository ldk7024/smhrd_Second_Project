package kr.smhrd.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.smhrd.model.BoardDAOMybatis;
import kr.smhrd.model.MemberVO;


public class memberupdateConroller implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String user_id = request.getParameter("user_id");
		String user_name = request.getParameter("user_name");
		String password = request.getParameter("password");
		String birth_date = request.getParameter("birth_date");
		String address = request.getParameter("address");

		MemberVO vo = new MemberVO();
		
//		vo.setUser_id(user_id);
//		vo.setUser_name(user_name);
//		vo.setPassword(password);
//		vo.setAddress(address);
//		vo.setBirth_date(birth_date);
		
		System.out.println(user_id);
		System.out.println(user_name);
		System.out.println(password);
		System.out.println(address);
		System.out.println(birth_date);
		
		String view = null;
		
		BoardDAOMybatis dao = new BoardDAOMybatis();
	

		int cnt = dao.memberupdate(vo);
		PrintWriter out = response.getWriter();
		out.println(cnt); // $.ajax() -> 형식적으로 응답 : success

		return null;
	}
}
