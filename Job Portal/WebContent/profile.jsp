<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.Database.Connection.DbConnection" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:declaration>
    Connection con=null;
    PreparedStatement ps=null;
</jsp:declaration>

<jsp:scriptlet>String name = (String) session.getAttribute("session_name");
String email = (String) session.getAttribute("session_email");
String gender = (String) session.getAttribute("session_gender");
String city = (String) session.getAttribute("session_city");
String field1 = (String) session.getAttribute("session_field1");
if (field1 == null || field1.equals("")) {
	field1 = "--- Not Available ---";
}

String skills = (String) session.getAttribute("session_skills");
if (skills == null || skills.equals("")) {
	skills = "--- Not Available ---";
}
String title = (String) session.getAttribute("session_title");
if (title == null || title.equals("")) {
	title = "--- Not Available ---";
}</jsp:scriptlet>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

            <link rel="stylesheet" type="text/css" href="css/style.css" />
<title>Profile <jsp:expression>name</jsp:expression></title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>

	<div class="container-fluid">

		<jsp:include page="profileheader.jsp"></jsp:include>
		<jsp:include page="menubar.jsp"></jsp:include>

		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row"
					style="border: 1px solid gray; box-shadow: 0px 0px 2px gray; border-radius: 3px">

					<div class="col-md-2">
						<div class=row"></div>
						
                        <img src="images/profilepic.png" height="100" style="border-radius: 50px"/>
						
					</div>
					<div class=" col-md-10 ">
						<h3 class="text-capitalize" style="color: blue">
							<jsp:expression>name</jsp:expression>
							<a href="edit-profile-about.jsp"
								style="font-size: 20px; float: right"> 
								<span class="glyphicon glyphicon-pencil"></span> 
							</a>
						</h3>
						<h4><jsp:expression>title</jsp:expression></h4>
						<br> <br> <span style="color: #acaaaa"> Skills :
						</span>
						<jsp:expression>skills</jsp:expression>
						<br> <span class="mb-3" style="color: #acaaaa"> Gender
							: </span>
						<jsp:expression>gender</jsp:expression>
						<br> <span style="color: #acaaaa"> City : </span>
						<jsp:expression>city</jsp:expression>
						<br> <span style="color: #acaaaa"> Fields : </span>
						<jsp:expression>field1</jsp:expression>
						<br>


					</div>
				</div>
				<div class="row mt-5 mb-5 pb-5"  style="border: 1px solid gray; box-shadow: 0px 0px 2px gray; border-radius: 3px">
                        
                        <div class="col-md-12">
                            <h4 class="mb-3"> 
								
									Education Details <a href="add-profile-education.jsp"
										style="font-size: 20px; float: right">
										<span class="glyphicon glyphicon-plus"></span> 
									</a>
									<br>
									<br>
									</h4>
								
							
					<jsp:scriptlet>
                            String id="", school="", degree="", percent="", year="";
                          
                            try
                            {
                                
                                con=DbConnection.getConnect();
            
                                ps=con.prepareStatement("select * from education1 where email=?");
                                ps.setString(1, email);
                                ResultSet rs=ps.executeQuery();
                                while(rs.next())
                                {
                                	id=rs.getString("id");
                                    school=rs.getString("school");
                                    degree=rs.getString("degree");
                                    percent=rs.getString("percent");
                                    year=rs.getString("year");
                                    
                        </jsp:scriptlet>
                            
                            <div class="row" style="background-color: #eeecec;margin-left:10%;width:80%;">
                                <div class="col-md-4 text-center" > &nbsp;&nbsp;&nbsp; <img src="images/school.png" height="70" /> </div>
                                <div class="col-md-8">
                                    <a href="edit-profile-education.jsp?id=<jsp:expression>id</jsp:expression>" style="font-size: 12px; float: right"> <span class="glyphicon glyphicon-pencil"></span> </a>
                                    <b> <span class="glyphicon glyphicon-home">&nbsp;</span> <jsp:expression>school</jsp:expression> <br> </b>
                                <span class="glyphicon glyphicon-book"></span> &nbsp; <jsp:expression> degree </jsp:expression> <span style="color: #858585">(<jsp:expression> year </jsp:expression>)</span> <br>
                                <span class="glyphicon glyphicon-file"></span> &nbsp; <jsp:expression> percent </jsp:expression>% <br>
                                </div>
                        </div> <br>
                            
                        <jsp:scriptlet>
                                }
                            }
                            catch(Exception e)
                            {
                                out.print(e);
                            }
                            finally {
                            	try {
                        			con.close();
                        			ps.close();
                        		} catch (Exception e) {
                        			// TODO Auto-generated catch block
                        			e.printStackTrace();
                        		}
                            }
                        </jsp:scriptlet>
					
					</div>
					</div>
					<div class="row mt-5 mb-5 pb-5"  style="border: 1px solid gray; box-shadow: 0px 0px 2px gray; border-radius: 3px">
                        
                        <div class="col-md-12">
                            <h4 class="mb-3"> 
								
									Experience Details <a href="add-profile-experience.jsp"
										style="font-size: 20px; float: right">
										<span class="glyphicon glyphicon-plus"></span> 
									</a>
									<br>
									<br>
									</h4>
								
							
					<jsp:scriptlet>
                            String id1="", company1="", title1="", year1="",location1="",project1="";
                          
                            try
                            {
                                
                                con=DbConnection.getConnect();
                                ps=con.prepareStatement("select * from experience where email=?");
                                ps.setString(1, email);
                                ResultSet rs=ps.executeQuery();
                                while(rs.next())
                                {
                                	id=rs.getString("id");
                                    company1=rs.getString("company");
                                    title1=rs.getString("title");
                                    year1=rs.getString("year");
                                    location1=rs.getString("location");
                                    project1=rs.getString("project");
                        </jsp:scriptlet>
                            
                            <div class="row" style="background-color: #eeecec;margin-left:10%;width:80%;">
                                <div class="col-md-2"> &nbsp;&nbsp;&nbsp; <img src="images/school.png" height="70" /> </div>
                                <div class="col-md-10">
                                    <a href="edit-profile-experience.jsp?id=<jsp:expression>id</jsp:expression>" style="font-size: 12px; float: right"> <span class="glyphicon glyphicon-pencil"></span> </a>
                                    <b> <span class="glyphicon glyphicon-home">&nbsp;</span> <jsp:expression>company1</jsp:expression> <br> </b>
                                <span class="glyphicon glyphicon-book"></span> &nbsp; <jsp:expression>location1</jsp:expression> <span style="color: #858585">(<jsp:expression> year1 </jsp:expression>)</span> <br>
                                <span class="glyphicon glyphicon-file"></span> &nbsp; <jsp:expression>title1</jsp:expression> <br>
                                </div>
                        </div> <br>
                            
                            
                        <jsp:scriptlet>
                                }
                            }
                            catch(Exception e)
                            {
                                out.print(e);
                            }
                            finally {
                            	try {
                        			con.close();
                        			ps.close();
                        		} catch (Exception e) {
                        			// TODO Auto-generated catch block
                        			e.printStackTrace();
                        		}
                            }
                        </jsp:scriptlet>
					
					</div>
					</div>	
					
                        
                   
                    
					
					<div class="text-center">
						<button type="button" class="btn btn-info">Info</button>
					</div>
				</div>
				<div class="col-md-2"></div>
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