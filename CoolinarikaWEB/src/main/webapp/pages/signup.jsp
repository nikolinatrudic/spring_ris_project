<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/Coolinarika/css/mystyle.css" rel="stylesheet">
<script>
	// Animations init
	new WOW().init();
</script>
</head>
<body>
	<%@ include file="header.jsp"%>

	<!-- Full Page Intro -->
	<div class="view"
		style="background-image: url('/Coolinarika/img/cake.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
		<!-- Mask & flexbox options-->
		<div class="mask rgba-black-light align-items-center">
			<!-- Content -->
			<div class="container" style="width: 600px; margin-top: 150px">
				<!-- Material form register -->
				<div class="card">

					<!--Card content-->
					<div class="card-body px-lg-5 pt-0">

						<!-- Form -->
						<form class="text-center" style="color: #757575;" action="${pageContext.request.contextPath}/addUser" method="post">

							<div class="form-row">
								<div class="col">
									<!-- First name -->
									<div class="md-form">
										<input type="text" id="materialRegisterFormFirstName"
											class="form-control" placeholder="First name" name = "name"> <label
											for="materialRegisterFormFirstName"></label>
									</div>
								</div>
								<div class="col">
									<!-- Last name -->
									<div class="md-form">
										<input type="text" id="materialRegisterFormLastName"
											class="form-control" placeholder="Last name" name = "surname"> <label
											for="materialRegisterFormLastName"></label>
									</div>
								</div>
							</div>
							
							<!-- Phone number -->
							<div class="md-form">
								<input type="text" id="materialRegisterFormUsername"
									class="form-control" placeholder = "Username" name = "username">
								<label for="materialRegisterUsername"></label>
							</div>
							

							<!-- E-mail -->
							<div class="md-form mt-0">
								<input type="email" id="materialRegisterFormEmail"
									class="form-control" placeholder = "E-mail" name = "email"> <label
									for="materialRegisterFormEmail"></label>
							</div>

							<!-- Password -->
							<div class="md-form">
								<input type="password" id="materialRegisterFormPassword"
									class="form-control"
									aria-describedby="materialRegisterFormPasswordHelpBlock" placeholder = "Password" name = "password">
								<label for="materialRegisterFormPassword" ></label> <small
									id="materialRegisterFormPasswordHelpBlock"
									class="form-text text-muted mb-4"> At least 8
									characters and 1 digit </small>
							</div>

							<!-- Sign up button -->
							<button
								class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0"
								type="submit">Sign up</button>

						</form>
						<!-- Form -->

					</div>

				</div>
				<!-- Material form register -->
				<br><br>
				<c:if test="${! empty user }">
					<p style = "color: white"><strong>YOU JUST MADE A NEW ACCOUNT ON COOLINARIKA <i class="fas fa-check"></i></strong></p>
				</c:if>
			</div>
			<!-- Content -->
		</div>
		<!-- Mask & flexbox options-->
	</div>
	<!-- Full Page Intro -->
</body>
</html>