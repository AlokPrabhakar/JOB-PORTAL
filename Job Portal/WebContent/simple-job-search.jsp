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
    
        <script>
            function searchJobByTech(tech)
            {
                //alert(tech);
                
                var obj;
                // 1. creates an XMLHttpRequest Object
                if(window.XMLHttpRequest)
                {
                    obj=new XMLHttpRequest();   //for latest browsers
                }
                else
                {
                    obj=new ActiveXObject("Microsoft.XMLHTTP");     //for old IE version
                }
                
                // 2. specify the request
                obj.open("POST", "JobSearchByTechnology?technology="+tech, true);
                
                // 3. sends the request to the server
                obj.send();
                
                // 4. calls the function when readyState property changes
                obj.onreadystatechange = function()
                {
                    if(obj.readyState === 4 && obj.status === 200)
                    {
                        document.getElementById('respgenerated').innerHTML = obj.responseText;
                    }
                };
            }
            
            function searchJobByLocation(location)
            {
                var obj;
                // 1. creates an XMLHttpRequest Object
                if(window.XMLHttpRequest)
                {
                    obj=new XMLHttpRequest();   //for latest browsers
                }
                else
                {
                    obj=new ActiveXObject("Microsoft.XMLHTTP");     //for old IE version
                }
                
                // 2. specify the request
                obj.open("POST", "JobSearchByLocation?location="+location, true);
                
                // 3. sends the request to the server
                obj.send();
                
                // 4. calls the function when readyState property changes
                obj.onreadystatechange = function()
                {
                    if(obj.readyState === 4 && obj.status === 200)
                    {
                        document.getElementById('respgenerated').innerHTML = obj.responseText;
                    }
                };
            }

        </script>
    
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
			
			
		<!-- ==============search job div starts================= -->
			<div class="row search">
				<div class="col-md-2"></div>
				<div class="col-md-8 job_search_div">
					<h3> Find A Job at India's No.1 Job Site </h3>
					<div class="row">
						<div class="col-md-5">
							<input type="text" placeholder="Technology..." class="form-control " onkeyup="searchJobByTech(this.value)"  />
						</div>
						<div class="col-2"></div>
						<div class="col-md-5">
							<input type="text" placeholder="Location..." class="form-control" onkeyup="searchJobByLocation(this.value)"  />
						</div>
						
					</div>
					</div>
				<div class="col-md-2"></div>
			</div>
			<!-- ==============search job div ends================= -->
			
			<div class="row company">
				<div class="col-md-3">
					<ul>
						<li> <a href=""><img src="images/1.jpg" width="150" height="100"/>  </a> </li>
						<li> <a href=""> <img src="images/2.jpg" width="150" height="100"/> </a> </li>
						<li> <a href=""> <img src="images/3.png" width="150" height="100"/> </a> </li>
						<li> <a href=""> <img src="images/4.png" width="150" height="100"/> </a> </li>
						<li> <a href=""> <img src="images/5.png" width="150" height="100"/> </a> </li>
					</ul>
				</div>
				<div class="col-md-6" style="background-color: #f9f8f9; margin-top: 10px">
                        <div class="row">
                            <div class="col-md-12">
                                <span id="respgenerated"> No Result Found </span>
                            </div>
                        </div>
                    </div>
				
				
				<div class="col-md-3">
					<ul>
						<li> <a href=""> <img src="images/6.png" width="150" height="100"/>  </a> </li>
						<li> <a href=""> <img src="images/7.png" width="150" height="100"/> </a> </li>
						<li> <a href=""> <img src="images/3.png" width="150" height="100"/> </a> </li>
						<li> <a href=""> <img src="images/4.png" width="150" height="100"/> </a> </li>
						<li> <a href=""> <img src="images/5.png" width="150" height="100"/> </a> </li>
					</ul>
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