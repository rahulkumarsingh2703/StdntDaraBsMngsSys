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

public class StudentInsert extends HttpServlet {

	private static final long serialVersionUID = 1L;
	RequestDispatcher rd;
	String name;
	String dob;
	String gender;
	String usn;
	String roll;
	String stdcontact;
	String branch;
	String sem;
	String sec;
	String parentname;
	String parentcontact;
	String occupation;
	String addd;
	Statement stmt;
	String query;
	
	public StudentInsert() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			PrintWriter out = response.getWriter();
			
			name = request.getParameter("name");
			dob = request.getParameter("dob");
			gender = request.getParameter("gender");
			usn = request.getParameter("usn");
			roll = request.getParameter("roll");
			stdcontact = request.getParameter("stdcontact");
			branch = request.getParameter("branch");
			sem = request.getParameter("sem");
			sec = request.getParameter("sec");
			parentname = request.getParameter("parentname");
			parentcontact = request.getParameter("parentcontact");
			occupation = request.getParameter("occupation");
			addd = request.getParameter("addd");
			query = "INSERT INTO studentdata " +
	                "VALUES ('"+name+"','"+dob+"','"+gender+"','"+usn+"','"+roll+"','"+stdcontact+"','"+branch+"','"+sem+"','"+sec+"','"+parentname+"','"+parentcontact+"','"+occupation+"','"+addd+"')";
			
			
			try{
				Connection con; 
				con=DataBaseMgr.getDataBaseMgr().getConnection();
				/*out.println("Data Entered Successfully"+name);*/
				stmt = con.createStatement();
			
				stmt.executeUpdate(query);
				if (con != null) {
					request.setAttribute("succMsg","* Successfull Submition of Form");
					rd = request.getRequestDispatcher("Enroll.jsp");	
					rd.forward(request, response);
					
					System.out.println("Successfullly connected to Oracle DB");}
				
			
			
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
				request.setAttribute("errMsg","* Unsuccessfull (Fill Mendatory and Try Again)");
				rd = request.getRequestDispatcher("Enroll.jsp");	
				rd.forward(request, response);
				out.println("error");
				
				
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

