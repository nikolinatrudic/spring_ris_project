<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.mySlides {
	display: none;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>

	<!-- Full Page Intro -->
	<div class="view"
		style="background-image: url('/Coolinarika/img/cookies.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
		<!-- Mask & flexbox options-->
		<div class="mask rgba-black-light align-items-center">
			<!-- Content -->
			<div class="container"
				style="width: 1400px; height 800px; margin-top: 150px;">
				<div class="row">
					<div class="col">
						<div class="row">
							<section
								class="card profile-card mb-4 text-center table-wrapper-scroll-y my-custom-scrollbar"
								style="width: 300px; height: 300px;">
								<c:if test="${! empty ingRecipes }">
									<table class="table">
										<thead>
											<tr>
												<th scope="col">Ingredient</th>
												<th scope="col">Amount</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${ingRecipes }" var="i">
												<tr>
													<td>${i.ingredient.name }</td>
													<td>${i.amount }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>
								<c:if test="${empty ingRecipes }">
									<p>There is not added ingredient's for this recipe!</p>
								</c:if>
							</section>
						</div>
						<div class="row">
							<section class="card profile-card mb-4 text-center"
								style="width: 300px; height: 420px;">
								<s:authorize access="!isAuthenticated()">
									<h2>${userInfo }</h2>
									<br>
									<p>Sign up for more</p>
								</s:authorize>
								<s:authorize access="isAuthenticated()">
									<div class="avatar z-depth-1-half">
										<img src="${recipeOwner.picture }" alt="" class="img-fluid"
											style="width: 250px">
									</div>
									<!-- Card content -->
									<div class="card-body">
										<!-- Title -->
										<h4 class="card-title">
											<strong>${recipeOwner.name } ${recipeOwner.surname }</strong>
										</h4>
										<h5>@${recipeOwner.username }</h5>
										<p class="dark-grey-text">${recipeOwner.email }</p>

										<c:if test="${friendStatus == '' }">
											<form action="/Coolinarika/users/addFriend" method="post">
												<input type="submit" value="Add friend"
													class="btn btn-brown">
											</form>
										</c:if>
										<c:if test="${friendStatus != '' }">
											<c:if test="${friendStatus == 'pending'  }">
												<c:if test="${isf.user1 != recipeOwner }">
													<form action="/Coolinarika/users/cancelFriendRequest"
														method="post">
														<input type="submit" value="Cancel request"
															class="btn btn-brown">
													</form>
												</c:if>
												<c:if test="${isf.user1 == recipeOwner }">
													<input type="submit" value="Pending" class="btn btn-brown">
												</c:if>
											</c:if>
											<c:if test="${friendStatus == 'accepted'  }">
												<p class="btn btn-brown">Friend</p>
											</c:if>
										</c:if>
									</div>
								</s:authorize>
							</section>
						</div>
					</div>
					<div class="col">
						<section
							class="card profile-card mb-4 text-center table-wrapper-scroll-y my-custom-scrollbar"
							style="width: 800px; height: 750px; margin-left: -20px">
							<h1 style="margin-top: 30px">${lookRecipe.name }</h1>
							<h4 style="margin-top: 10px">${lookRecipe.postDate }</h4>
							<br>
							<s:authorize access="isAuthenticated()">
								<c:if test="${! empty favc }">
									<form action="/Coolinarika/users/addToFavouriteCategory" method="post">
										<select name="favcat" class="browser-default custom-select"
											style="width: 300px">
											<c:forEach items="${favc }" var="fc">
												<option value="${fc.idFavourite_category }">${fc.name }</option>
											</c:forEach>
										</select>
										<br>
										<input type = "submit" value="ADD TO FAVOURITES" class="btn btn-brown">
									</form>
								</c:if>
							</s:authorize>
							<br> <br>  
							<p align="justify" style="padding: 15px">${lookRecipe.description }</p>
							<br>
							<div class="w3-content w3-display-container"
								style="width: 100%; height: 40%">
								<c:forEach items="${picRecipes }" var="pc">
									<img class="mySlides" src="${pc.path }" style="width: 100%">
								</c:forEach>

								<button class="w3-button w3-black w3-display-left"
									onclick="plusDivs(-1)">&#10094;</button>
								<button class="w3-button w3-black w3-display-right"
									onclick="plusDivs(1)">&#10095;</button>
							</div>
						</section>
					</div>
				</div>
				<%-- 			<c:remove var="lookRecipe"/> --%>
				<%-- 			<c:remove var="ingRecipe"/> --%>
				<%-- 			<c:remove var="picRecipe"/> --%>
				<%-- 			<c:remove var="picRecipe"/> --%>
			</div>
			<!-- Content -->
		</div>
		<!-- Mask & flexbox options-->
	</div>
	<!-- Full Page Intro -->
	<script>
		var slideIndex = 1;
		showDivs(slideIndex);

		function plusDivs(n) {
			showDivs(slideIndex += n);
		}

		function showDivs(n) {
			var i;
			var x = document.getElementsByClassName("mySlides");
			if (n > x.length) {
				slideIndex = 1;
			}
			if (n < 1) {
				slideIndex = x.length
			}
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			x[slideIndex - 1].style.display = "block";
		}
	</script>
</body>
</html>