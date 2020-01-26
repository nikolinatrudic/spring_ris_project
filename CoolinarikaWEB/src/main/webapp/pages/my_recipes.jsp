<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--   Ovde se prikazuju recepti dobijeni kada na profilu korisnik pritisne my recipes - kako bi video svoje recepte, ili stisne na neku omiljenu kategoriju kategoriju -->
	<%@ include file="header.jsp"%>

	<!-- Full Page Intro -->
	<div class="view"
		style="background-image: url('/Coolinarika/img/cookies.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
		<!-- Mask & flexbox options-->
		<div class="mask rgba-black-light align-items-center">
			<!-- Content -->
			<div class="container" style="width: 1800px; margin-top: 150px">
				<div class="col-lg-8 col-md-12 text-center"
					style="margin-top: -50px">
					<div class="table-wrapper-scroll-y my-custom-scrollbar"
						style="width: 800px; height: 800px">

						<table class="table table-bordered table-striped mb-0"
							style="background-color: black;">
							<thead>
								<tr>
									<th scope="col"><strong>#</strong></th>
									<th scope="col"><strong style="color: white;">Recipe
											name</strong></th>
									<th scope="col"><strong style="color: white;">Owner</strong></th>
									<th scope="col"><strong style="color: white;">Date</strong></th>
									<th scope="col"><strong style="color: white;">See
											full recipe</strong></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${myRecipes }" var="mr">
									<tr>
										<th><i class="fas fa-utensils fa-2x"></i></th>
										<td><strong style="color: white;">${mr.name }</strong></td>
										<td><strong style="color: white;">${mr.user.name }
												${mr.user.surname }</strong></td>
										<td><strong style="color: white;">${mr.postDate }</strong></td>
										<td><form action="/Coolinarika/getRecipeInfo">
												<input type="hidden" value="${mr.idRecipe }"
													name="forRecipe">
													<input
													type="submit" value="SEE"
													class="btn btn-outline-default waves-effect">
											</form></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>
				</div>
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