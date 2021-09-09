package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




public class ReviewController extends Action{
	
	
	public String reviewWritePro(HttpServletRequest request, HttpServletResponse response) throws Exception {
    
    	
    	return "/view/alert.jsp";
    }
	public String reviewInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
    
    	
    	return "/view/alert.jsp";
    }
	

    public String reviewWrite(HttpServletRequest request, HttpServletResponse response) throws Exception {
    
    	
    	return "/view/board/reviewWrite.jsp";
    }
	
	public String list(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    
		
		return "/view/board/reviewList.jsp";
    }


}
