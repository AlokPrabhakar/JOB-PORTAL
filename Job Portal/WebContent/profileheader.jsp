<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:scriptlet>
	String name = (String) session.getAttribute("session_name");
	String gender = (String) session.getAttribute("session_gender");
</jsp:scriptlet>
<jsp:scriptlet>
	if(name==null ||name==""){
		response.sendRedirect("login.jsp");

	}
</jsp:scriptlet>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="/your-path-to-fontawesome/css/fontawesome.css"
	rel="stylesheet">
<title>Welcome : <jsp:expression>name</jsp:expression></title>
</head>
<body>
	<div class="row header_bg">
		<div class="col-md-4">
			<img src="images/profilepic.png" height="50" /> <span
				class="logo_text_design"> Job1 Portal </span>
		</div>
		<div class="col-md-6 login">
			<span class="text-warning"> Welcome : <a href="profile.jsp">
					<span class="text-danger font-weight-bold text-capitalize text-truncate" ><jsp:expression>name</jsp:expression></span>
			</a>
			</span>
		</div>
		<div class="col-md-2">
			<a href="LogOut" class="hyperlinks_design"> Logout </a>
		</div>
	</div>


</body>
</html>