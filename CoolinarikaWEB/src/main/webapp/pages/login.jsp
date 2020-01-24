<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
// Animations init
new WOW().init();</script>
</head>
<body>
	<%@ include file="header.jsp"%>

	<!-- Full Page Intro -->
	<div class="view"
		style="background-image: url('/Coolinarika/img/cake.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
		<!-- Mask & flexbox options-->
		<div class="mask rgba-black-light align-items-center">
			<!-- Content -->
			<div class="container" style = "width: 600px; margin-top: 200px">
				<!-- Material form login -->
				<div class="card">

					<!--Card content-->
					<div class="card-body px-lg-5 pt-100">

						<!-- Form -->
						<form class="text-center" style="color: #757575;" action="${pageContext.request.contextPath}/login" method="post">

							<!-- Username -->
							<div class="md-form">
								<input type="text" id="materialLoginFormUsername"
									class="form-control" placeholder="Username" name = "username"> <label
									for="materialLoginFormUsername"></label>
							</div>

							<!-- Password -->
							<div class="md-form">
								<input type="password" id="materialLoginFormPassword"
									class="form-control" placeholder="Password" name = "password"> <label
									for="materialLoginFormPassword"></label>
							</div>

							<!-- Sign in button -->
							<button
								class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0"
								type="submit">Sign in</button>

							<!-- Register -->
							<p>
								Not a member? <a href="">Register</a>
							</p>

						</form>
						<!-- Form -->

					</div>

				</div>
				<!-- Material form login -->
			</div>
			<!-- Content -->
		</div>
		<!-- Mask & flexbox options-->
	</div>
	<!-- Full Page Intro -->
</body>
</html>