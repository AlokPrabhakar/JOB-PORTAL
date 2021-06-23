

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.Database.Connection.DbConnection" %>


<jsp:declaration>
    String school="", degree="", year="", percent="", description="";
    Connection con=null;
    PreparedStatement ps=null;
</jsp:declaration>


        {<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    String email = (String) session.getAttribute("session_email");
    String gender = (String) session.getAttribute("session_gender");
    String city = (String) session.getAttribute("session_city");
    String fields = (String) session.getAttribute("session_fields");
    String title = (String) session.getAttribute("session_title");
    if (title == null || title.equals("")) {
        title = "";
    }
    String skills = (String) session.getAttribute("session_skills");
    if (skills == null || skills.equals("")) {
        skills = "";
    }
    
    String id=request.getParameter("id");
    
    try
    {
        
        con=DbConnection.getConnect();
        
        ps=con.prepareStatement("select * from education1 where id=?");
        ps.setString(1,id);
		ResultSet rs=ps.executeQuery();
        
        while(rs.next()){
            school=rs.getString("school");
            degree=rs.getString("degree");
            year=rs.getString("year");
            percent=rs.getString("percent");
            description=rs.getString("description");
            
        }
    }
    catch(Exception e)
    {
        out.print(e);
    }finally {
    	try {
			con.close();
			ps.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
</jsp:scriptlet>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Education Profile </title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <script>
        function submitFunction(val)
        {
            if(val==='update')
            {
                document.editeduform.action="EditEducationDetails";
                document.editeduform.submit();
            }
            if(val==='delete')
            {
                document.editeduform.action="DeleteEducationDetails";
                document.editeduform.submit();
            }
        }

        
        </script>
    </head>
    <body>
    <div class="container-fluid">
        <jsp:include page="profileheader.jsp" />
        <jsp:include page="menubar.jsp" />

        <div class="row">
            <div class="col-md-2"> </div>
            <div class="col-md-8">
                <div class="row" style="border: 1px solid gray; box-shadow: 0px 0px 2px gray; border-radius: 3px">
                    <div class="col-md-4">
                        <img src="images/profile1.png" height="100"/>
                         <b> <jsp:expression> email </jsp:expression> </b> <br> <br>
                    </div>
                    <div class="col-md-8">
                    	<h2>Edit Education Details</h2>
                        <form name="editeduform" method="POST">
                           <input type="hidden" value="<jsp:expression>id</jsp:expression>" name="id1" />
                           
                            <div class="mb-3 pb-2 row">
							<div class="col-4">
								<label for="InputYear" class="form-label">Institution :</label>
							</div>
							<div class="col-8">
								<input type="text" class="form-control" id="Xpercent" value="<jsp:expression>school</jsp:expression>" name="school1">
							</div>
						</div>
                          <div class="mb-3 pb-2 row">
							<div class="col-4">
								<label for="InputYear" class="form-label">Degree :</label>
							</div>
							<div class="col-8">
								<input type="text" class="form-control" id="Xpercent" placeholder="Eg. 10th or B.tech" value="<jsp:expression>degree</jsp:expression>" name="degree1">
							</div>
						</div>
                         <div class="mb-3 pb-2 row">
							<div class="col-4">
								<label for="InputYear" class="form-label">Year :</label>
							</div>
							<div class="col-8">
								<input type="text" class="form-control" id="Xpercent" placeholder="Eg. 2001-2004" value="<jsp:expression>year</jsp:expression>" name="year1">
							</div>
						</div>
						 <div class="mb-3 pb-2 row">
							<div class="col-4">
								<label for="InputYear" class="form-label">Percentage :</label>
							</div>
							<div class="col-8">
								<input type="text" class="form-control" id="Xpercent" placeholder="like 90 " value="<jsp:expression>percent</jsp:expression>"  name="percent1">
							</div>
						</div>
						  <div class="mb-3 pb-2 row">
							<div class="col-4">
								<label for="InputYear" class="form-label">Description :</label>
							</div>
							<div class="col-8">
								<textarea  placeholder="Your certifications, Activities and societies" name="description1" style="padding: 5px 10px; width: 280px; height: 100px; border-radius: 5px; border: 1px solid gray;">
									<jsp:expression>description</jsp:expression>
								</textarea> 
							</div>
						</div>
                            
                            <div class="text-center">
                            	<input type="submit" value="Update Education" class="btn btn-primary" onclick="submitFunction('update')" />
                            	<input type="submit" value="Delete Education" class="btn btn-danger" onclick="submitFunction('delete')"/>
                            </div>
                        </form>
                        
                    </div>
                </div>
            </div>
            <div class="col-md-2"> </div>
        </div>
        <jsp:include page="footer.jsp" />
        </div>
    </body>
</html>
