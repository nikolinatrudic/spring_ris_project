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
					style="height: 100px; padding: 30px">
					<form action="/Coolinarika/admin/getRecipesCategoriesReport">
						<input type = "submit" value="Get recipes report by categories">
					</form>
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