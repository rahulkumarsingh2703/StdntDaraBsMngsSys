package com.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.db.DataBaseMgr;

public class AttendenceUpdate extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	RequestDispatcher rd;
	String name;
	String usn;
	String roll;
	String branch;
	String sem;
	String sec;
	String dob;
	String attendence;
	Statement stmt;
	String query;
	
	public AttendenceUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			PrintWriter out = response.getWriter();
			
			name = request.getParameter("name");
			usn = request.getParameter("usn");
			roll = request.getParameter("roll");
			branch = request.getParameter("branch");
			sem = request.getParameter("sem");
			sec = request.getParameter("sec");
			dob = request.getParameter("dob");
			attendence = request.getParameter("attendence");
			
			query = "INSERT INTO attendence " +
	                "VALUES ('"+name+"','"+usn+"','"+roll+"','"+branch+"','"+sem+"','"+sec+"','"+dob+"','"+attendence+"')";
			
			
			try{
				Connection con; 
				con=DataBaseMgr.getDataBaseMgr().getConnection();
				out.println("Data Entered Successfully"+name);
				stmt = con.createStatement();
			
				stmt.executeUpdate(query);
				if (con != null) {
					
					request.setAttribute("succMsg","* Successfull Submition of Form");
					rd = request.getRequestDispatcher("Attendence.jsp");	
					rd.forward(request, response);
					
					System.out.println("nSuccessfullly connected to Oracle DB");}
				
			
			
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
				request.setAttribute("errMsg","* Unsuccessfull (Fill Mendatory and Try Again)");
				rd = request.getRequestDispatcher("Attendence.jsp");	
				rd.forward(request, response);
				out.println("errror");
				
				
			}
		}

		/**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			doGet(request, response);
		}

	}
	

