<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.Database.Connection.DbConnection"%>
<%@page import="java.sql.Connection"%>

<jsp:scriptlet>
    String email=(String)session.getAttribute("session_email");
</jsp:scriptlet>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	<!--Font Awsome Icon  -->
	<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <title>Job Portal</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    
  </head>
  <body>
   
	<div class="container-fluid">
		<jsp:scriptlet>
                if(email == null ? email == null : email.trim().equals("null"))
                {
			            </jsp:scriptlet>
			                <jsp:include page="header.jsp"></jsp:include>
			            <jsp:scriptlet>
			      }
                else
                {
			            </jsp:scriptlet>
			                    <jsp:include page="profileheader.jsp"></jsp:include>
			            <jsp:scriptlet>
			      }
            </jsp:scriptlet>
	
		
			
			<jsp:include page="menubar.jsp"></jsp:include>
			<div class="row contact">
				<div class="col-2">
				</div>
				<div class="col-2 " style="margin-top:80px;" style="height:50px">
					<p class="mt-5" >
					<b>We are waiting to hear you.</b> 
					<img alt="contact" src="images/contact.jpg">
					</p>
				</div>
				<div class="col-1">
				</div>
					
						<div class="col-4">
							<div class="text-center mt-5 mb-3">
							<h4>Contact Us</h4>
							</div>
							<form>
								  <div class="form-group">
								    <label for="exampleInputEmail1">Name</label>
								    <input type="text" class="form-control"  placeholder="Enter Name" style="border-radius:5px">
								    
								  </div>
								  <div class="form-group">
								    <label for="exampleInputPassword1">Email</label>
								    <input type="email" class="form-control" id="exampleInputPassword1" placeholder="Password">
								  </div>
								  <div class="form-group">
								    <label for="exampleInputPassword1">Message</label>
								    	<textarea placeholder="Project Description" name="description1" style="padding: 5px 10px; width: 370px; height: 100px; border-radius: 5px; border: 1px solid gray;">
									
								</textarea> 
								  </div>
								  <div class="text-center">
								  		<button type="submit" class="btn btn-primary">Submit</button>
								  </div>
								</form>
						</div>
						<div class="col-2">
						</div>
					</div>
				</div>
				<div class="col-2">
				</div>
			</div>
	
			
			<jsp:include page="footer.jsp"></jsp:include>
			
			
	
	</div>
	

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
    -->
  </body>
</html>