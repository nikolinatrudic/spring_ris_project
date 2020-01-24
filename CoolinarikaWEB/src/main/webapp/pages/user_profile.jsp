<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp"%>

	<!-- Full Page Intro -->
	<div class="view"
		style="background-image: url('/Coolinarika/img/cookies.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
		<!-- Mask & flexbox options-->
		<div class="mask rgba-black-light align-items-center">
			<!-- Content -->
			<div class="container" style="width: 1800px; margin-top: 200px">
				<!-- Section: Profile -->
				<section>

					<!-- Grid row -->
					<div class="row mt-5">

						<!-- Grid column -->
						<div class="col-lg-4 col-md-12" style="margin-top: -50px">

							<!-- Section: Basic Info -->
							<section class="card profile-card mb-4 text-center">
								<div class="avatar z-depth-1-half">
									<img src="${profileUser.picture }" alt="" class="img-fluid">
								</div>
								<!-- Card content -->
								<div class="card-body">
									<!-- Title -->
									<h4 class="card-title">
										<strong>${profileUser.name } ${profileUser.surname }</strong>
									</h4>
									<h5>@${profileUser.username }</h5>
									<p class="dark-grey-text">${profileUser.email }</p>


									<!-- Text -->
									<p class="card-text mt-3">The number of posted recipes is
										${recipeNumber }</p>

									<form action="/Coolinarika/users/addFavouriteCategory" method="post">
										<div class="md-form">
											<input type="text" name="name" id="form1"
												class="form-control" placeholder="Favourite category..."
												style="width: 300px;"> <input
												type="submit" value="ADD FAVOURITE CATEGORY"
												class="btn btn-outline-black btn-rounded btn-sm waves-effect waves-dark float-center">

										</div>
									</form>
									<c:if test="${! empty fav }">
										<p>Just added a new favourite category</p>
									</c:if>
								</div>

							</section>
							<!-- Section: Basic Info -->

						</div>
						<div class="col-lg-8 col-md-12 text-center" style="margin-top: -50px">
							<div class="table-wrapper-scroll-y my-custom-scrollbar">

								<table class="table table-bordered table-striped mb-0" style="background-color: black;">
									<thead>
										<tr>
											<th scope="col"><strong>#</strong></th>
											<th scope="col"><strong style="color: white;">Name</strong></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row"><i class="far fa-folder fa-2x"></i></th>
											<td><strong style="color: white;">My recipes</strong></td>
										</tr>
										<c:forEach items="${fc }" var="fc">
											<tr>
												<th><i class="far fa-folder fa-2x"></i></th>
												<td><strong style="color: white;">${fc.name }</strong></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>

							</div>
						</div>
						<!-- Grid row -->
					</div>
				</section>
				<!-- Section: Profile -->

			</div>
			<!-- Content -->
		</div>
		<!-- Mask & flexbox options-->
	</div>
	<!-- Full Page Intro -->
</body>
</html>