package kr.smhrd.frontcontroller;

public class ViewResolver {
	public static String makeUrl(String view) {
		return "/WEB-INF/"+view+".jsp";
	}
}




