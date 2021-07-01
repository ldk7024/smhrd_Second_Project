package kr.smhrd.frontcontroller;

import java.util.HashMap;

import kr.smhrd.web.AjaxBoardContentController;
import kr.smhrd.web.AjaxBoardDeleteController;
import kr.smhrd.web.AjaxBoardListController;
import kr.smhrd.web.AjaxBoardRegisterController;
import kr.smhrd.web.AjaxBoardUpdateController;
import kr.smhrd.web.AjaxBookListController;
import kr.smhrd.web.AjaxLoginController;
import kr.smhrd.web.AjaxLogoutController;
import kr.smhrd.web.AjaxjoinMemberController;

import kr.smhrd.web.Controller;
import kr.smhrd.web.memberupdateConroller;
import kr.smhrd.web.pasing;

public class HandlerMapping {
	private HashMap<String, Controller> mappings;
	
	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();
		
		
	
		mappings.put("/ajaxlist.do", new AjaxBoardListController());
		
		mappings.put("/ajaxregister.do", new AjaxBoardRegisterController());
	
		mappings.put("/ajaxupdate.do", new AjaxBoardUpdateController());
		
		mappings.put("/ajaxcontent.do", new AjaxBoardContentController());
		
		mappings.put("/ajaxdelete.do", new AjaxBoardDeleteController());
		
		mappings.put("/ajaxlogin.do", new AjaxLoginController());
		mappings.put("/ajaxlogout.do", new AjaxLogoutController());
		
		mappings.put("/ajaxjoinmember.do", new AjaxjoinMemberController());
		mappings.put("/memberupdate.do", new memberupdateConroller());
		
		
		mappings.put("/pasion.do", new pasing());
		
		mappings.put("/ajaxbooklist.do", new AjaxBookListController());
		
		mappings.put("/boardCount.do", new boardCountController());
		
		
		
		
	}
	public Controller getController(String command) {
		return mappings.get(command);
	}
}	
	
//	if (command.equals("/list.do")) {
//		controller = new BoardListController();			
//				
//	} else if (command.equals("/register.do")) {
//		controller = new BoardRegisterController();
//								
//	} else if (command.equals("/registerForm.do")) {
//		controller = new BoardRegisterFormController();
//					
//	} else if (command.equals("/update.do")) {
//		controller = new BoardUpdateController();
//								
//	} else if (command.equals("/content.do")) {
//		controller = new BoardContentController();
//							
//	} else if (command.equals("/delete.do")) {
//		controller = new BoardDeleteController();
//					
//	}
	

