<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:scriptlet>String name = (String) session.getAttribute("session_name");
String dob = (String) session.getAttribute("session_dob");
String email = (String) session.getAttribute("session_email");
String gender = (String) session.getAttribute("session_gender");
String city = (String) session.getAttribute("session_city");

String title = (String) session.getAttribute("session_title");

if (title == null || title.equals("")) {
	title = "";
}
String skills = (String) session.getAttribute("session_skills");
if (skills == null || skills.equals("")) {
	skills = "";
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
<link rel="stylesheet"
	href="path/to/font-awesome/css/font-awesome.min.css">
<title>Profile <jsp:expression>name</jsp:expression></title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script>
            function changeGender()
            {
                document.getElementById('chnggendertf').value = document.getElementById('chnggender').value;
            }
            function changeCity()
            {
                document.getElementById('chngcitytf').value = document.getElementById('chngcity').value;
            }
        </script>

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
						<img src="images/profile1.png" height="100" />
						<b class="text-primary"> <jsp:expression> session.getAttribute("session_name") </jsp:expression> </b> <br> <br>
						
					</div>
					<div class=" col-md-10 ">
						<form action="EditProfilePlus" method="post">
						<div class="mb-3 pb-2 pt-3 row">
								<div class="col-4">
									<label for="name1" class="form-label">Email</label>
								</div>
								<div class="col-8">
									<input type="text" class="form-control" id="name1"
										value="<jsp:expression> email </jsp:expression>" name="email1" readonly="">
								</div>
							</div>
							<div class="mb-3 pb-2 pt-3 row">
								<div class="col-4">
									<label for="name1" class="form-label">Name</label>
								</div>
								<div class="col-8">
									<input type="text" class="form-control" id="name1"
										value="<jsp:expression> name </jsp:expression>" name="name1">
								</div>
							</div>
							
								<div class="mb-3 pb-2 row">
								<div class="col-4">
									<label for="city1" class="form-label">DOB :</label>
								</div>
								<div class="col-8">
									<input type="text" class="form-control" id="city1"
										value="<jsp:expression> dob </jsp:expression>" name="dob1">
								</div>
							</div>
							<div class="mb-3 pb-2 row">
								<div class="col-4">
									<label for="gender" class="form-label">Gender :</label>
								</div>
								<div class="col-2">
									<input type="text" class="form-control" id="chnggendertf"
										value="<jsp:expression> gender </jsp:expression>"
										name="gender1">
										
								</div>
								<div class="col-4 ms-3">
								<select id="chnggender" onchange="changeGender()">
                                    <option disabled=""> Select Gender </option>
                                    <option> Male </option>
                                    <option> Female </option>
                                </select>	
									
							</div>
							</div>
							<div class="mb-3 pb-2 row">
								<div class="col-4">
									<label for="city1" class="form-label">City :</label>
								</div>
								<div class="col-2">
									<input type="text" class="form-control" id="chngcitytf"
										value="<jsp:expression> city </jsp:expression>" name="city1">
								</div>
								<div class="col-4 ms-3">
									<select id="chngcity" onchange="changeCity()">
                                    <option disabled=""> Select City </option>
                                    <option value="Banglore"> Banglore </option>
                                    <option value="Delhi"> Delhi </option>
                                    <option value="Noida"> Noida </option>
                                </select>
								</div>
							</div>
							<div class="mb-3 pb-2 row">
								<div class="col-4">
									<label for="title1" class="form-label">Title :</label>
								</div>
								<div class="col-8">
									<input type="text" class="form-control" id="city1"
										value="<jsp:expression> title </jsp:expression>"
										placeholder="Profile Title" name="title1">
								</div>
								<div class="mb-3 mt-3 pb-2 row">
									<div class="col-4">
										<label for="title1" class="form-label">Skills :</label>
									</div>
									<div class="col-8">
										<textarea class="form-control" placeholder="Skills"
											name="skills1"
											style="padding: 5px 10px; width: 338px; height: 100px; border-radius: 5px; border: 1px solid gray;"> 
									<jsp:expression>skills</jsp:expression> </textarea>
									</div>
								</div>
								<div class="row ">
									<div class="col-2"></div>
									<div class="col-4">
										<button type="submit" class="btn btn-danger btn-lg">Update</button>
									</div>
									<div class="col-2"></div>
								</div>
						</form>
					</div>
				</div>
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