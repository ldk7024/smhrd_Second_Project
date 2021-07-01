package kr.smhrd.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.smhrd.model.BoardDAOMybatis;
import kr.smhrd.model.MemberVO;


public class AjaxLoginController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String member_id = request.getParameter("member_id");
		String member_pw = request.getParameter("member_pw");
		
		MemberVO vo = new MemberVO();
		vo.setMember_id(member_id);
		vo.setMember_pw(member_pw);
		
		BoardDAOMybatis dao = new BoardDAOMybatis();
		MemberVO memberVO = dao.loginMember(vo);
		
		PrintWriter out = response.getWriter();
		System.out.println("로그인");
		System.out.println("로그인");
		if (memberVO != null) {
			out.print("YES"); // 인증에 성공(1)
			// 객체바인딩 : 로그인에 성공했다는 사실을 모든 웹페이지가 공유할 수 있도록 해야한다. => 세션바인딩
			// HttpServletRequest, HttpSession
			
			HttpSession session = request.getSession();
			session.setAttribute("memberVO", memberVO); // -> ${userVO}
		} else {
			out.print("NO"); // 인증에 실패(0)
		}

		return null;

	}

}
