

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
</jsp:scriptlet>

<jsp:scriptlet>
    if (name == null || name.equals("")) {
        response.sendRedirect("login.jsp");
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
                    	<h2>Add Education Details</h2>
                        <form action="AddEducationDetails" method="POST">
                           
                            <div class="mb-3 pb-2 row">
							<div class="col-4">
								<label for="InputYear" class="form-label">Institution :</label>
							</div>
							<div class="col-8">
								<input type="text" class="form-control" id="Xpercent" name="school1">
							</div>
						</div>
                          <div class="mb-3 pb-2 row">
							<div class="col-4">
								<label for="InputYear" class="form-label">Degree :</label>
							</div>
							<div class="col-8">
								<input type="text" class="form-control" id="Xpercent" placeholder="Eg. 10th or B.tech" name="degree1">
							</div>
						</div>
                         <div class="mb-3 pb-2 row">
							<div class="col-4">
								<label for="InputYear" class="form-label">Year :</label>
							</div>
							<div class="col-8">
								<input type="text" class="form-control" id="Xpercent" placeholder="Eg. 2001-2004"  name="year1">
							</div>
						</div>
						 <div class="mb-3 pb-2 row">
							<div class="col-4">
								<label for="InputYear" class="form-label">Percentage :</label>
							</div>
							<div class="col-8">
								<input type="text" class="form-control" id="Xpercent" placeholder="like 90 "  name="percent1">
							</div>
						</div>
						  <div class="mb-3 pb-2 row">
							<div class="col-4">
								<label for="InputYear" class="form-label">Description :</label>
							</div>
							<div class="col-8">
								<textarea placeholder="Your certifications, Activities and societies" name="description1" style="padding: 5px 10px; width: 280px; height: 100px; border-radius: 5px; border: 1px solid gray;"></textarea> 
							</div>
						</div>
                            
                            <div class="text-center">
                            	<input type="submit" value="Add Education" class="btn btn-danger" />
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
