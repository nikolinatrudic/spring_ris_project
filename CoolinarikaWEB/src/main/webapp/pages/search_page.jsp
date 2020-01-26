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
					<div class="row">
						<div class="col">
							<c:if test="${! empty ingSearch }">
								<form action="/Coolinarika/searchByIngredient">
									<select name="selIngSearch">
										<c:forEach items="${ingSearch }" var="is">
											<option value="${is.idIngredient }">${is.name }</option>
										</c:forEach>
									</select> <br> <input type="submit" value="Search by ingredient">
								</form>
							</c:if>
						</div>
						<div class="col">
							<c:if test="${! empty catSearch }">
								<form action="/Coolinarika/searchByCategory">
									<select name="selCatSearch">
										<c:forEach items="${catSearch }" var="cs">
											<option value="${cs.idCategory }">${cs.name }</option>
										</c:forEach>
									</select> <br> <input type="submit" value="Search by category">
								</form>
							</c:if>
						</div>
					</div>
				</section>
				<c:if test="${! empty foundRecipesByIng }">
					<div class="col-lg-8 col-md-12 text-center"
						style="margin-top: 50px; margin-left: 150px">
						<div class="table-wrapper-scroll-y my-custom-scrollbar"
							style="width: 800px; height: 600px">
							<strong style="color: white;">Ingredient: ${ingName }</strong>
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
									<c:forEach items="${foundRecipesByIng }" var="fr">
										<tr>
											<th><i class="fas fa-utensils fa-2x"></i></th>
											<td><strong style="color: white;">${fr.name }</strong></td>
											<td><strong style="color: white;">${fr.user.name }
													${fr.user.surname }</strong></td>
											<td><strong style="color: white;">${fr.postDate }</strong></td>
											<td><form action="/Coolinarika/getRecipeInfo">
													<input type="hidden" value="${fr.idRecipe }"
														name="forRecipe"> <input type="submit" value="SEE"
														class="btn btn-outline-default waves-effect">
												</form></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

						</div>
					</div>
					<c:remove var="foundRecipesByIng" />
				</c:if>
				<c:if test="${! empty foundRecipesByCat }">
					<div class="col-lg-8 col-md-12 text-center"
						style="margin-top: 50px; margin-left: 150px">
						<div class="table-wrapper-scroll-y my-custom-scrollbar"
							style="width: 800px; height: 600px">
							<strong style="color: white;">Category: ${catName }</strong>
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
									<c:forEach items="${foundRecipesByCat }" var="fr">
										<tr>
											<th><i class="fas fa-utensils fa-2x"></i></th>
											<td><strong style="color: white;">${fr.name }</strong></td>
											<td><strong style="color: white;">${fr.user.name }
													${fr.user.surname }</strong></td>
											<td><strong style="color: white;">${fr.postDate }</strong></td>
											<td><form action="/Coolinarika/getRecipeInfo">
													<input type="hidden" value="${fr.idRecipe }"
														name="forRecipe"> <input type="submit" value="SEE"
														class="btn btn-outline-default waves-effect">
												</form></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

						</div>
					</div>
					<c:remove var="foundRecipesByCat" />
				</c:if>
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