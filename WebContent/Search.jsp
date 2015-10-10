<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.IOException,java.io.PrintWriter,java.sql.Connection,java.sql.Statement,com.project.db.DataBaseMgr,java.sql.ResultSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
if(!("true".equals((String)session.getAttribute("loginsuccess")))){
	response.sendRedirect("login.jsp");
}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/Sstyle.css">
<style>

 #search{
  position: relative;
  text-align:center;
  
  width: 0px auto;
  height: 0px auto;
 margin-left: 5%;
 margin-right: 5%;
 
 }
 
 
table {
    width:100%;
    
}
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
    
}
th, td {
    padding: 5px;
    text-align: left;
     text-align: center;
}
table#t01 tr:nth-child(even) {
    background-color: #eee;
     
}
table#t01 tr:nth-child(odd) {
   background-color:#fff;
    
}
table#t01 th	{
    background-color: #13202c;
    color: white;
     text-align: center;
}
 
 
 
 


</style>
<!-- <link rel="stylesheet" href="css/animate.css"> -->
<title>Search Student</title>
</head>
<body>
<div class="header">Student Database Management System</div>
<div class="title animated bounceInUp">Search Student</div>

<div  >
<a href="welcome.jsp" class="button1"><input type="button" name="commit" value="Back"></a>
<a href="Logout.jsp" class="button2"><input type="button" name="commit" value="Logout"></a>
</div>


<section class="container">
<div class="login">
 	
 	<form method="post" action="Search.jsp">
 	<input type="hidden" name="search" value="true">
       <p><input type="text" name="sname" value=""  placeholder="Student Name"></p>
  		 		
        <p class="submit"><input type="submit" name="commit" value="Search"></p>
      </form>
     
    </div>








<div id="search">
<% if("true".equals(request.getParameter("search"))){
 		String sname = request.getParameter("sname");
 		
 		try{
			Connection con = DataBaseMgr.getDataBaseMgr().getConnection();
			Statement stmt = con.createStatement();
			ResultSet rset = stmt.executeQuery("select * from Studentdata where name='"+sname+"'");
			if (rset.next() ) {
			    
				
			
			%>
			 <div id="result">
			 <table id="t01">
			 <tr>
			 	    <th>Student Name</th>
    				<th>USN</th> 
   					<th>Semester</th>
   					<th>Branch</th>
 			 </tr>
			 <% do{ %>
         		 <tr>
				    <td><%= rset.getString(1) %> </td>
			 		<td><%= rset.getString(4) %></td>
			 		<td><%= rset.getString(8) %></td>
			 		<td><%= rset.getString(7) %></td>
 				</tr>
 			<%}while (rset.next()); %>
			  </table>
		</div>
			
			<%
			}else{
				out.println("No result found");
			}     
			}
		catch(Exception ex)
		{
			ex.printStackTrace();
			out.println("error");
		}
		//out.println("Search performed");
	}
	%>

   
 	
</div>
</section>


<div class="footer"></div>
</body>

<script type="text/javascript">
window.history.forward(1);
function noBack(){
window.history.forward();
}
</script>
</html>