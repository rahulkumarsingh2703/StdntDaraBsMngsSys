package com.project;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.db.DataBaseMgr;

public class FacultyLoginController extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	RequestDispatcher rd;
	String username;
	String password;
	ResultSet rst;
	Boolean flag = false;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		rd = null;
		flag = false;
		
		
		try{
			DataBaseMgr db = DataBaseMgr.getDataBaseMgr();
		
		rst = db.getResultSet("select * from loginrecord");
		
			
		while(rst.next()){
		if(rst.getString(1).equalsIgnoreCase(request.getParameter("username"))&&rst.getString(2).equalsIgnoreCase(request.getParameter("password"))){
			flag = true;
			break;
		 
		}
		}
		
		if(flag == true){
			rd = request.getRequestDispatcher("welcome.jsp");
			request.setAttribute("User",request.getParameter("username"));
			HttpSession session=request.getSession();  
			session.setAttribute("loginsuccess", "true"); 
			
			rd.forward(request, response);
			
		}
		else{
			request.setAttribute("errMsg","Username or Password is wrong");
			rd = request.getRequestDispatcher("login.jsp");	
			rd.forward(request, response);
		}
			/*response.sendRedirect("index.jsp");*/
		
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			
		}
	}

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request,response);
	
	}

}

