<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.Database.Connection.DbConnection"%>
<%@page import="java.sql.Connection"%>

<jsp:declaration>
    String id1;
</jsp:declaration>

<jsp:scriptlet>
    String email=(String)session.getAttribute("session_email");
    
    id1=request.getParameter("id");
    
    
</jsp:scriptlet>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="path/to/font-awesome/css/font-awesome.min.css">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
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
		<div class="row wallpaper" style="border: 2px solid black;">
			<img src="images/wall3.jpg" />
		</div>

		<!-- ==============search job div starts================= -->
		<div class="row search">
			<div class="col-md-2"></div>
			<div class="col-md-8 job_search_div">
				<h3>Find A Job at India's No.1 Job Site</h3>
				<div class="row">
					<div class="col-md-4">
						<input type="text" placeholder="Technology..."
							class="form-control " />
					</div>
					<div class="col-md-4">
						<input type="text" placeholder="Location..." class="form-control" />
					</div>
					<div class="col-md-4">
						<input type="submit" value="Search" class="btn btn-primary" />
					</div>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
		<!-- ==============search job div ends================= -->

		<div class="row company">
			<div class="col-md-3">
				<ul>
					<li><a href=""><img src="images/1.jpg" width="150"
							height="100" /> </a></li>
					<li><a href=""> <img src="images/2.jpg" width="150"
							height="100" />
					</a></li>
					<li><a href=""> <img src="images/3.png" width="150"
							height="100" />
					</a></li>
					<li><a href=""> <img src="images/4.png" width="150"
							height="100" />
					</a></li>
					<li><a href=""> <img src="images/5.png" width="150"
							height="100" />
					</a></li>
				</ul>
			</div>
			<div class="col-md-6" style="background-color:; margin-top: 10px">
				<div class="row">
					<table class="table table-light  table-bordered table-hover">
						<jsp:scriptlet>
                            String id,job_profile, company, experience, description, date1, time1,
                                    salary, no_of_openings, job_location, time_venue, c_email,
                                    c_person_name, c_person_profile, c_phone_no;
                            try
                            {
                                Connection con=DbConnection.getConnect();
                                
                                PreparedStatement ps=con.prepareStatement("select * from jobs where id=?");
                                ps.setString(1, id1);
                                ResultSet rs=ps.executeQuery();
                                while(rs.next())
                                {
                                    job_profile=rs.getString("job_profile");
                                    company=rs.getString("company");
                                    experience=rs.getString("experience");
                                    description=rs.getString("description");
                                    date1=rs.getString("date1");
                                    time1=rs.getString("time1");
                                    salary=rs.getString("salary");
                                    no_of_openings=rs.getString("no_of_openings");
                                    job_location=rs.getString("job_locations");
                                    time_venue=rs.getString("time_venue");
                                    c_email=rs.getString("c_email");
                                    c_person_name=rs.getString("c_person_name");
                                    c_person_profile=rs.getString("c_profile");
                                    c_phone_no=rs.getString("c_phone");
                                    
                                    </jsp:scriptlet>

						<tr>
							<td></td>
							<td></td>
							<td><b> <jsp:expression>job_profile</jsp:expression></b> <span
								style="font-size: 12px; color: #9f9d9d; float: right"> (<jsp:expression>date1</jsp:expression>
									& <jsp:expression>time1</jsp:expression>)
							</span> <br></td>
						</tr>
						<tr>
							<td><span class="glyphicon glyphicon-home"></span></td>
							<td><span style="color: #9f9d9d"> Company : </span></td>
							<td><jsp:expression>company</jsp:expression><br></td>
						</tr>
						<tr>
							<td><span class="glyphicon glyphicon-briefcase"></span></td>
							<td><span style="color: #9f9d9d"> Experience : </span></td>
							<td><jsp:expression>experience</jsp:expression><br></td>
						</tr>
						<tr>
							<td><span class="glyphicon glyphicon-list-alt"></span></td>
							<td><span style="color: #9f9d9d"> Job Description : </span></td>
							<td><jsp:expression>description</jsp:expression></td>
						</tr>
						<tr>
							<td><span class="glyphicon glyphicon-usd"></span></td>
							<td><span style="color: #9f9d9d"> Salary : </span></td>
							<td><jsp:expression>salary</jsp:expression></td>
						</tr>
						<tr>
							<td><span class="glyphicon glyphicon-th"></span></td>
							<td><span style="color: #9f9d9d"> No. Of Openings : :
							</span></td>
							<td><jsp:expression>no_of_openings</jsp:expression></td>
						</tr>
						<tr>
							<td><span class="glyphicon glyphicon-map-marker"></span></td>
							<td><span style="color: #9f9d9d"> Job Location : </span></td>
							<td><jsp:expression>job_location</jsp:expression></td>
						</tr>
						<tr>
							<td><span class="glyphicon glyphicon-send"></span></td>
							<td><span style="color: #9f9d9d"> Time / Venue : </span></td>
							<td><jsp:expression>time_venue</jsp:expression></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td>Company Details</td>
						</tr>
						<tr>
							<td><span class="glyphicon glyphicon-file"></span></td>
							<td><span style="color: #9f9d9d"> Company Name : </span></td>
							<td><jsp:expression>company</jsp:expression></td>
						</tr>
						<tr>
							<td><span class="glyphicon glyphicon-user"></span></td>
							<td><span style="color: #9f9d9d"> Person Name : </span></td>
							<td><jsp:expression>c_person_name</jsp:expression> (<jsp:expression>c_person_profile</jsp:expression>)</td>
						</tr>
						<tr>
							<td><span class="glyphicon glyphicon-phone-alt"></span></td>
							<td><span style="color: #9f9d9d"> Phone No. : </span></td>
							<td><jsp:expression>c_phone_no</jsp:expression></td>
						</tr>

						<jsp:scriptlet>
					                if(email == null ? email == null : email.trim().equals("null"))
					                {
								  </jsp:scriptlet>
						<tr>
							<td></td>
							<td></td>
							<td><a href="login.jsp" class="btn btn-primary">Login to
									Apply</a></td>
						</tr>

						<jsp:scriptlet>
								      }
					                else
					                {
					                	Connection con1=null;
					                	
					                	try{
					                		con1=DbConnection.getConnect();
                                            PreparedStatement ps1=con1.prepareStatement("select * from applied_job where email=? and jobid=?");
                                            ps1.setString(1, email);
                                            ps1.setString(2, id1);
                                        
                                            
                                            ResultSet rs1=ps1.executeQuery();
                                            	//System.out.println(rs1);
                                            if(rs1.next())
                                            {
                                            	
                                     </jsp:scriptlet>

						<tr>
							<td></td>
							<td></td>
							<td><span style="color: red; padding: 3px;"> Already
									applied to this job </span> <br> <br>
								<form action="DeleteMyJobApplication" method="post">
									<input type="hidden"
										value="<jsp:expression>id1</jsp:expression>" name="jobid" />
									<input type="submit" value="Delete this Application"
										class="btn btn-danger" />
								</form></td>
						</tr>

						
                                                
                                                
                                            <jsp:scriptlet>
                                            }
                                            else{
                                            </jsp:scriptlet>
                                            	<tr>
								            	<td></td>
								            	<td></td>
								            	<td>
								                    <form action="ApplyForJob" method="post">
				                                        <input type="hidden"
											value="<jsp:expression>id1</jsp:expression>" name="jobid" />
				                                        <input type="submit"
											value="Apply" class="btn btn-primary" />
				                                    </form>
												   </td>
								                   </tr>
                                            <jsp:scriptlet>}
} catch (Exception e) {

}</jsp:scriptlet>

                                           
								           
								            	
								            <jsp:scriptlet>}</jsp:scriptlet>
					                                
                                
	
                        <jsp:scriptlet>}
} catch (Exception e) {
e.printStackTrace();
}</jsp:scriptlet>
                        
					</table>

				</div>
			</div>

			<div class="col-md-3">
				<ul>
					<li><a href=""> <img src="images/6.png" width="150"
							height="100" />
					</a></li>
					<li><a href=""> <img src="images/7.png" width="150"
							height="100" />
					</a></li>
					<li><a href=""> <img src="images/3.png" width="150"
							height="100" />
					</a></li>
					<li><a href=""> <img src="images/4.png" width="150"
							height="100" />
					</a></li>
					<li><a href=""> <img src="images/5.png" width="150"
							height="100" />
					</a></li>
				</ul>
			</div>

		</div>


		<jsp:include page="footer.jsp"></jsp:include>



	</div>


	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
    -->
</body>
</html>