<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.RequestDispatcher"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
if(!("true".equals((String)session.getAttribute("loginsuccess")))){
	response.sendRedirect("login.jsp");
}

%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/styleW.css">
<!-- <link rel="stylesheet" href="css/animate.css"> -->
<title>Welcome</title>

</head>

<body>
<div class="header">Student Database Management System</div>
<div class="title animated bounceInUp">Welcome <%=(String)request.getAttribute("User")!=null ? (String)request.getAttribute("User"):"" %></div>
<div class="container">
<a href="Enroll.jsp" class="button1" ><input type="button" name="commit" value="Enrollment"></a>
<a href="Attendence.jsp" class="button2"><input type="button" name="commit" value="Attendance"></a>
<a href="Search.jsp" class="button3"><input type="button" name="commit" value="Search"></a>
<a href="Logout.jsp" class="button4"><input type="button" name="commit" value="Logout"></a>
</div>

<div class="footer"></div>
</body>

<script type="text/javascript">
window.history.forward(1);
function noBack(){
window.history.forward();
}
</script>
</html>