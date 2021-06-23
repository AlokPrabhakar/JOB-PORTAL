<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.Database.Connection.DbConnection" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:declaration>
   
    String company="", location="", year="", job_title="",project="", description="", id="";
    Connection con=null;
    PreparedStatement ps=null;
</jsp:declaration>

<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    
    id=request.getParameter("id");
   
    try
    {
    	con=DbConnection.getConnect();
        ps=con.prepareStatement("select * from experience where id=?");
        ps.setString(1, id);
        ResultSet rs=ps.executeQuery();
        while(rs.next())
        {
            company=rs.getString("company");
            location=rs.getString("location");
            year=rs.getString("year");
            job_title=rs.getString("title");
            project=rs.getString("project");
            description=rs.getString("description");
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


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Education Profile </title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
       
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <script>
            function submitFunction(val)
            {
                if(val==='update')
                {
                    document.editexpform.action="EditExperienceDetails";
                    document.action.submit();
                }
                if(val==='delete')
                {
                    document.editexpform.action="DeleteExperienceDetails";
                    document.action.submit();
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
                         <b> <jsp:expression> session.getAttribute("session_email") </jsp:expression> </b> <br> <br>
                    </div>
                    <div class="col-md-8">
                    	<h2>Edit Experience Details</h2>
                        <form name="editexpform"  method="POST">
                           <input type="hidden" value="<jsp:expression>id</jsp:expression>" name="id1" />
                           
                            <div class="mb-3 pb-2 row">
							<div class="col-4">
								<label for="InputYear" class="form-label">Company :</label>
							</div>
							<div class="col-8">
								<input type="text" class="form-control" value="<jsp:expression>company</jsp:expression>" id="Xpercent" name="company1">
							</div>
						</div>
                          <div class="mb-3 pb-2 row">
							<div class="col-4">
								<label for="InputYear" class="form-label">Title :</label>
							</div>
							<div class="col-8">
								<input type="text" class="form-control" id="Xpercent" value="<jsp:expression>job_title</jsp:expression>" placeholder="eg. JAVA Devloper ,Python Devloper" name="title1">
							</div>
						</div>
                         <div class="mb-3 pb-2 row">
							<div class="col-4">
								<label for="InputYear" class="form-label">Year :</label>
							</div>
							<div class="col-8">
								<input type="text" class="form-control" id="Xpercent" value="<jsp:expression>year</jsp:expression>" placeholder="e g.  2001-2004"  name="year1">
							</div>
						</div>
						 <div class="mb-3 pb-2 row">
							<div class="col-4">
								<label for="InputYear" class="form-label">Locaation :</label>
							</div>
							<div class="col-8">
								<input type="text" class="form-control" id="Xpercent" value="<jsp:expression>location</jsp:expression>" placeholder="like Banglore,.. "  name="location1">
							</div>
						</div>
						<div class="mb-3 pb-2 row">
							<div class="col-4">
								<label for="InputYear" class="form-label">Project :</label>
							</div>
							<div class="col-8">
								<input type="text" class="form-control" id="Xpercent" value="<jsp:expression>project</jsp:expression>" placeholder="eg. JOB PORTAL.. "  name="project1">
							</div>
						</div>
						  <div class="mb-3 pb-2 row">
							<div class="col-4">
								<label for="InputYear" class="form-label">Description :</label>
							</div>
							<div class="col-8">
								<textarea placeholder="Project Description" name="description1" style="padding: 5px 10px; width: 280px; height: 100px; border-radius: 5px; border: 1px solid gray;">
									<jsp:expression>description</jsp:expression>
								</textarea> 
							</div>
						</div>
                            
                            <div class="text-center">
                            	<input type="submit" value="Update Experience" class="btn btn-danger" onclick="submitFunction('update')" />
                            	<input type="submit" value="Delete Experience" class="btn btn-danger" onclick="submitFunction('delete')" />
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
 