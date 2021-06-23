<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<jsp:scriptlet>
    String email=(String)session.getAttribute("session_email");
    
    
</jsp:scriptlet>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<title>Insert title here</title>
</head>
<body>

		<header class="header row">
		
      <ul class="main-nav">
	         <li> <a href="index.jsp"> Home </a> </li>
	         
                    <jsp:scriptlet>
                        if (email == null ? email == null : email.trim().equals("null")) {
                    </jsp:scriptlet>
                    
                    <jsp:scriptlet>
                    } else {
                    </jsp:scriptlet>
                    <li> <a href="my-applied-jobs.jsp"> My Applied Jobs </a> </li>
                    <jsp:scriptlet>
                        }
                    </jsp:scriptlet>
	         
			<li> <a href="#"> About Us </a> </li>
			<li > <a href="contact-us.jsp"> Contact Us </a> </li>
	        <li > <a href="simple-job-search.jsp"> Search Jobs </a> </li>
			
	         
      </ul>
	</header> 
	
	
	
</body>
</html>