<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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

<title>Registration</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript">
		function val(v)
		{
		    document.getElementById(v).innerHTML="";
		}
	
		function validation(){
		var flag=true;
		var name=document.regform.myname.value;
		var email=document.regform.email.value;
		var password=document.regform.password.value;
		var dob=document.regform.dob.value;
		var city=document.regform.city.value;
		var gender=document.regform.gender.value;
		var name_pattern=/^[a-zA-Z ]{3,30}$/;
        var email_pattern = /^([a-zA-Z0-9])(([a-zA-Z0-9])*([\._\+-])*([a-zA-Z0-9]))*@(([a-zA-Z0-9\-])+(\.))+([a-zA-Z]{2,4})+$/;
        var password_pattern = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
        var dob_pattern=/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$/;
        if(!name.match(name_pattern)){
			document.getElementById('name_error').innerHTML="Name be not properly formatted";
            flag=false;
		}
		if(name==="")
        {
            document.getElementById('name_error').innerHTML="Name cannot be empty";
            flag=false;
        }
		
		if(!email.match(email_pattern))
        {
            document.getElementById('email_error').innerHTML="Email is not properly formatted";
            flag=false;
        }
        if(email==="")
        {
            document.getElementById('email_error').innerHTML="Email cannot be empty";
            flag=false;
        }
        
        if(!password.match(password_pattern))
        {
            document.getElementById('password_error').innerHTML="Password is not properly formatted (should contain 0-9,special characters)";
            flag=false;
        }

        if(password==="")
        {
            document.getElementById('password_error').innerHTML="Password cannot be empty";
            flag=false;
        }
        if(gender==="")
        {
            document.getElementById('gender_error').innerHTML="Please select gender";
            flag=false;
        }
        if(city==="Select City")
        {
            document.getElementById('city_error').innerHTML="Please select City";
            flag=false;
        }
        if(dob==="")
        {
            document.getElementById('dob_error').innerHTML="Date cannot be empty";
            flag=false;
        }
        if(!dob.match(dob_pattern))
        {
            document.getElementById('dob_error').innerHTML="Date is not properly formatted";
            flag=false;
        }
     
		return flag;
		
	}
</script>
</head>
<body>

	<div class="container-fluid">

		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menubar.jsp"></jsp:include>
		<div class="container  mt-5 ml-5" style="width: 25rem;">
			<div class="card">
			
				<div class="card-body reg_div_design">
					<h5 class="card-title text-center">Registration Here</h5>
					<hr>
					<form action="reg" name="regform" method="post" onsubmit="return validation()">
						<div class="mb-3 form-group ">
							<label for="name1" class="form-label">Name</label> <input
								type="text" class="form-control" id="name1" name="myname" onkeyup="val('name_error')" >
								<span id="name_error" style="color: red"> </span>
						</div>
						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Email
								address</label> <input type="text" class="form-control"
								id="exampleInputEmail1" name="email" onkeyup="val('email_error')">
								<span id="email_error" style="color: red"> </span>
							<div id="emailHelp" class="form-text">We'll never share
								your email with anyone else.</div>
						</div>
						<div class="mb-3">
							<label for="exampleInputPassword1" class="form-label">Password</label>
							<input type="password" class="form-control"
								id="exampleInputPassword1" name="password" onkeyup="val('password_error')">
								<span id="password_error" style="color: red"> </span>
						</div>
						<div class="mb-3 form-group">
							<label for="birthday">DOB:</label> <input type="text"
								id="birthday" class="form-control" name="dob"
								placeholder="dd/mm/yyyy" onkeyup="val('dob_error')">
								<span id="dob_error" style="color: red"> </span>
						</div>
						<div class="mb-3">
							<label for="course">City:</label> <select class="form-select"
								aria-label="Default select example" id="course" name="city" onchange="val('city_error')">
								<option selected>Select City</option>
								<option value="Banglore">Banglore</option>
								<option value="Delhi">Delhi</option>
								<option value="Chennai">Chennai</option>
							</select>
							<span id="city_error" style="color: red"> </span>
						</div>
						<div class="mb-1 ">
							<span class="mr-3">Gender :</span>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="gender"
									id="inlineRadio1" value="Male" /> <label
									class="form-check-label" for="inlineRadio1"> Male</label>
									
							</div>

							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="gender"
									id="inlineRadio2" value="Female" /> <label
									class="form-check-label" for="inlineRadio2">Female</label>
									
							</div>
							<span id="gender_error" style="color: red"> </span>
						</div>
							<br>
							<div class="mt-1">
								Field :
								<div class="form-check">
									<input class="form-check-input" type="checkbox"
										id="inlineCheckbox1" name="field1"  value="Information Technology"> <label
										class="form-check-label" for="inlineCheckbox1">Information
										Technology</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox"
										id="inlineCheckbox2" name="field1"  value="Marketing"> <label
										class="form-check-label" for="inlineCheckbox2">Marketing</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox"
										id="inlineCheckbox3" name="field1"  value="Finance "> <label
										class="form-check-label" for="inlineCheckbox3">Finance
									</label>
								</div>
							</div>
						


						<div class="text-center mt-5 mb-2">
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
					</form>
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