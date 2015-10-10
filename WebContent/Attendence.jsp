<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%
if(!("true".equals((String)session.getAttribute("loginsuccess")))){
	response.sendRedirect("login.jsp");
}

%>



<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/StyleA.css">
<!-- <link rel="stylesheet" href="css/animate.css"> -->
<title>Attendence Updation</title>
</head>
<body>
<div class="header">Student Database Management System</div>
<div class="title animated bounceInUp">Student Attendence Form</div>

<div class="container" >
<form action="update" method="post" class="register" align="center">

 <p style="text-align: center;color: red; font-size: large"><%
        		if(request.getAttribute("errMsg") != null){
        		out.println((String)request.getAttribute("errMsg"));
        		request.setAttribute("errMsg",null);
        		}
 
        		else{
            		out.println((String)request.getAttribute("succMsg"));
            		request.setAttribute("succMsg",null);
            		}
        		
        		%></p>


<fieldset class="row1">
<legend>Student Details</legend>
<p><label>Name *</label><input type="text" name="name"  placeholder="Student Name">
<label>Student ID *</label><input type="text" name="usn"  placeholder="USN">
<label>Roll No. *</label><input type="text" name="roll"  placeholder="Roll Number"><label></label></p>
<p><label>Branch *</label><input type="text" list="branches" name="branch" placeholder="Branch">
<datalist id="branches">
  <option value="Computer Science">
  <option value="Electronics & Communication">
  <option value="Information Science">
  <option value="Electrical & Electronics">
  <option value="Telecommunication">
  <option value="Industrial Engineering and Management">
  <option value="Civil">
  <option value="Electronics & Instrumentation">
</datalist>

<label>Semester *</label><input type="text" list="sem" name="sem" placeholder="Semester">
<datalist id="sem">
  <option value="1st Semester">
  <option value="2nd Semester">
  <option value="3rd Semester">
  <option value="4th Semester">
  <option value="5th Semester">
  <option value="6th Semester">
  <option value="7th Semester">
  <option value="8th Semester">
</datalist>

<label>Section</label><input type="text" list="sec" name="sec" placeholder="Section">
<datalist id="sec">
<option value="A">A</option>
<option value="B">B</option>
<option value="C">C</option>
<option value="D">D</option>
</datalist><label></label></p>

<P><label>Date *</label><input type="text" name="dob"  placeholder="dd/mm/yyyy">
<label>Attendance *</label><input type="radio" name="attendence" value="present"><label1>Present</label1>
<input type="radio" name="attendence" value="absent"><label1>Absent</label1></P>

<p><label class="obinfo" style="float: right">* obligatory fields</label></p>
</fieldset>
<div class="submit" style="bottom: 5px " >
<a href="welcome.jsp" class="button2"><input type="button" name="commit" value="Back"></a>
<a href="Attendence.jsp" class="button1" ><input type="submit" name="commit" value="Update"></a>
<a href="Logout.jsp" class="button2"><input type="button" name="commit" value="Logout"></a>
 </div>
</form>
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