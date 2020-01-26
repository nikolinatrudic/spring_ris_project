<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--   Ovde se prikazuju recepti dobijeni biranjem uslova za pretragu -->
	<%@ include file="header.jsp"%>

	<!-- Full Page Intro -->
	<div class="view"
		style="background-image: url('/Coolinarika/img/cookies.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
		<!-- Mask & flexbox options-->
		<div class="mask rgba-black-light align-items-center">
			<!-- Content -->
			<div class="container" style="width: 1800px; margin-top: 150px">
				<section class="card profile-card mb-4 text-center"
					style="height: 200px; padding: 30px">
					<div class = "row">
						<div class="col">
							<form action="/Coolinarika/admin/getRecipesCategoriesReport">
								<input type = "submit" value="Get recipes report by categories" class="btn btn-brown" style="margin-top: 40px">
							</form>
						</div>
						<div class="col">
							<form action="/Coolinarika/admin/getRecipesForEnteredDate">
								<input type = "text" name = "d" id="form1" class="form-control" placeholder="Date..." style="width: 150px; margin-left: 180px">
								<br>
								<input type = "submit" value="Get recipes report by entered date" class="btn btn-brown">
							</form>
						</div>
					</div>
				</section>
				<!-- Grid row -->
			</div>
			<!-- Section: Profile -->

		</div>
		<!-- Content -->
	</div>
	<!-- Mask & flexbox options-->
	<!-- Full Page Intro -->
</body>
</html>