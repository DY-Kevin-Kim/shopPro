package controller;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ControllerPathMethod
 */
public class Action extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Action() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void processPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String com = request.getRequestURI();
    	System.out.println("1:"+com);
    	if(com.indexOf(request.getContextPath())==0) {
    		com = com.substring(request.getContextPath().length());
    		com = com.substring(com.lastIndexOf("/")+1);
    	}
    	System.out.println("2:"+com);
    	
    	String viewPage = null;
    	
    	Class[] cParam = {HttpServletRequest.class, HttpServletResponse.class};
    	
    	try {
    		
    		Method m = this.getClass().getMethod(com, cParam);
    		
    		System.out.println(m.getName()+"     method");
    		viewPage = (String) m
        			.invoke(this, request, response);
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	    	
    	if(viewPage!=null) {
    		RequestDispatcher dis = request.getRequestDispatcher(viewPage);
    		dis.forward(request, response);
    	}else {
    		throw new ServletException("no exists "+this.getClass().getName()+"."+com+"() method");
    	}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processPro(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processPro(request, response);
	}

}
