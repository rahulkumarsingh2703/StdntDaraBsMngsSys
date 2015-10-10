<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/MeStyle.css">
<!-- <link rel="stylesheet" href="css/animate.css"> --> 
<title>Login</title>
</head>

<body>
<div class="header">Student Database Management System</div>
<div class="title animated bounceInUp">Faculty Login</div>
<section class="container">
 	<div class="login">
 	
  		
 		
      <form method="post" action="verify">
       <p style="text-align: center;color: red"><%
        		if(request.getAttribute("errMsg") != null){
        		out.println((String)request.getAttribute("errMsg"));
        		request.setAttribute("errMsg",null);
        		}
        		%></p>
  		<p><input type="text" name="name" value=""  placeholder="Username or Email"></p>
  		<p><input type="password" name="aadhar" value=""  placeholder="Password"></p>
  		<p class="remember_me">
        <label><input type="checkbox" name="remember_me" id="remember_me">Remember me on this computer</label>
        </p>
        <p class="submit"><input type="submit" name="commit" value="Login"></p>
      </form>
     
    </div>
</section>
<div class="footer"></div>

</body>


</html>