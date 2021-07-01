package kr.smhrd.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.fabric.xmlrpc.base.Member;

import kr.smhrd.model.BoardDAOMybatis;

import kr.smhrd.model.MemberVO;


public class AjaxjoinMemberController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String member_id = request.getParameter("member_id");
		String member_pw = request.getParameter("member_pw");
		String member_name = request.getParameter("member_name");
		String member_birth = request.getParameter("member_birth");
		String member_class = request.getParameter("member_class");
		
		MemberVO vo = new MemberVO(); // 객체 만들기

		vo.setMember_id(member_id);
		vo.setMember_pw(member_pw);
		vo.setMember_name(member_name);
		vo.setMember_birth(member_birth);
		vo.setMember_class(member_class);
		
		System.out.println(vo.getMember_id());
		System.out.println(vo.getMember_pw());
		System.out.println(member_id+member_pw+member_name+member_birth+member_class+"되");
		String view = null;

		BoardDAOMybatis dao = new BoardDAOMybatis();

		int cnt=0;
		 
	      try {
	    	  cnt = dao.joinMember(vo);

	      } catch (Exception e) {
	         e.printStackTrace();
	      } 
		
		PrintWriter out = response.getWriter();
		out.println(cnt);
		return null;
	}

}
