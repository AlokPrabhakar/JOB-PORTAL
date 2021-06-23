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
                            String id,job_profile=null, company=null, experience=null, description=null, date1=null, time1=null;
                           
                            try
                            {
                                Connection con=DbConnection.getConnect();
                               
                                PreparedStatement ps=con.prepareStatement("select * from applied_job where email=?");
                                ps.setString(1,email);
                                
                                ResultSet rs=ps.executeQuery();
                                while(rs.next())
                                {
                                	
                                    id=rs.getString("jobid");
									System.out.println(id);
                                    PreparedStatement ps2=con.prepareStatement("select * from jobs where id=?");
                                    ps2.setString(1,id);
                                    ResultSet rs2=ps2.executeQuery();
                                    while(rs2.next()){
                                    	System.out.println("JOB "+email+rs2.getString(2) );
                                    	
                                    	job_profile=rs2.getString("job_profile");
                                        company=rs2.getString("company");
                                        experience=rs2.getString("experience");
                                        description=rs2.getString("description");
                                        date1=rs2.getString("date1");
                                        time1=rs2.getString("time1");

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