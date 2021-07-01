package kr.smhrd.web;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class pasing implements Controller{

	 private static String getTagValue(String tag, Element eElement) {
	      NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	      Node nValue = (Node)nlList.item(0);
	      if(nValue==null)
	         return null;
	      return nValue.getNodeValue();            
	   }
	
	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		try {
//			String url = "http://data4library.kr/api/loanItemSrchByLib";
//			String serviceKey = "318e50933ed226a17c0181b02c4aabf9c59a92825ebc6b0305e564625c5cd945";
//			String decodeServiceKey = URLDecoder.decode(serviceKey, "UTF-8");
//			String regioncode = "11"; //지역번호
//			String regionloccode = "11110"; //지역세부번호
//			
//			Document documentInfo = DocumentBuilderFactory.newInstance()
//					.newDocumentBuilder()
//					.parse(url+"?authKey="+decodeServiceKey+"&region="+regioncode+"&dtl_region="+regionloccode);
//			
//			//root tag
//			documentInfo.getDocumentElement().normalize();
//			NodeList nList = documentInfo.getElementsByTagName("doc");
//			
//			for(int i = 0; i < nList.getLength(); i++) {
//				Node nNode = nList.item(i);
//				if(nNode.getNodeType() == Node.ELEMENT_NODE) {
//					
//					Element eElement = (Element) nNode;
//					//System.out.println("************************");
//					System.out.println(getTagValue("bookname", eElement)); //태그 속성 "bookname"
//					
//				}
//				
//				
//			}
	
		
			
		
			 
			 
			
		System.out.println("여기까지");	
	         String url = "http://data4library.kr/api/itemSrch?type=ALL&libCode=";
	         String serviceKey = "318e50933ed226a17c0181b02c4aabf9c59a92825ebc6b0305e564625c5cd945";
	         String decodeServiceKey = URLDecoder.decode(serviceKey, "UTF-8");
	         String libCode = "144041"; //도서관 코드
	         String isbn13 = request.getParameter("data1"); //도서 번호
	         
	         Document documentInfo = DocumentBuilderFactory.newInstance()
	               .newDocumentBuilder()
	               .parse(url+"?authKey="+decodeServiceKey+"&libCode="+libCode+"&isbn13="+isbn13);
	         System.out.println();request.getParameter("data1");
	         //root tag
	         documentInfo.getDocumentElement().normalize();
	         NodeList nList = documentInfo.getElementsByTagName("doc");
	         
	         for(int i = 0; i < nList.getLength(); i++) {
	            Node nNode = nList.item(i);
	            if(nNode.getNodeType() == Node.ELEMENT_NODE) {
	               
	               Element eElement = (Element) nNode;
	               //System.out.println("************************");
	               System.out.println(getTagValue("bookname", eElement)); //태그 속성 "bookname"
	               
	            }
	            
	            
	         }
	         
	      }catch (Exception e){
	         e.printStackTrace();
	      }
		return null;

	}
	
	
}
