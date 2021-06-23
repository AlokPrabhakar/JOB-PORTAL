<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.Database.Connection.DbConnection"%>
<%@page import="java.sql.Connection"%>

<jsp:scriptlet>
    String email=(String)session.getAttribute("session_email");
    
    String technology2=request.getParameter("technology1");
    String location2=request.getParameter("location1");
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
			
			
		
				<!-- ==============search job div starts================= -->
			<div class="row search">
				<div class="col-md-2"></div>
				<div class="col-md-8 job_search_div">
				<form action="search-jobs-result.jsp" method="POST">
				
					<h3> Find A Job at India's No.1 Job Site </h3>
					<div class="row">
						<div class="col-md-4">
							<input type="text" name="technology1" placeholder="Technology..." class="form-control " />
						</div>
						<div class="col-md-4">
							<input type="text" name="location1" placeholder="Location..." class="form-control" />
						</div>
						<div class="col-md-4">
							<input type="submit" value="Search" class="btn btn-primary" />
						</div>
					</div>
					</form>
					</div>
			
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
                        <jsp:scriptlet>
                            String id,job_profile, company, experience, description, date1, time1;
                            try
                            {
                                Connection con=DbConnection.getConnect();
                                
                                PreparedStatement ps=con.prepareStatement("select * from jobs where job_profile LIKE '%"+technology2+"%' OR job_locations LIKE '%"+location2+"%'");
                                ResultSet rs=ps.executeQuery();
                                while(rs.next())
                                {
                                    id=rs.getString("id");
                                    job_profile=rs.getString("job_profile");
                                    company=rs.getString("company");
                                    experience=rs.getString("experience");
                                    description=rs.getString("description");
                                    date1=rs.getString("date1");
                                    time1=rs.getString("time1");
                                    </jsp:scriptlet>
                            
                            <div class="col-md-12 display_job_div">
                                <b> <jsp:expression>job_profile</jsp:expression></b> <span style="font-size: 12px; color: #9f9d9d; float: right"> (<jsp:expression>date1</jsp:expression> & <jsp:expression>time1</jsp:expression>)</span> <br>
                            <span class="glyphicon glyphicon-home"></span> <span style="color: #9f9d9d"> Company : </span> <jsp:expression>company</jsp:expression> </span> <br>
                                <span> <span class="glyphicon glyphicon-book"></span> <span style="color: #9f9d9d"> Experience : </span> <jsp:expression>experience</jsp:expression> </span> <br>
                                <span> <span class="glyphicon glyphicon-file"></span>  <span style="color: #9f9d9d"> Job Description : </span> <jsp:expression>description</jsp:expression> </span> <br>
                                <br><a href="job-description.jsp?id=<jsp:expression>id</jsp:expression>"> See Full Details </a>
                            </div>
                            
                        <jsp:scriptlet>
                                }
                            }
                            catch(Exception e)
                            {
                                e.printStackTrace();
                            }
                        </jsp:scriptlet>
                            
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