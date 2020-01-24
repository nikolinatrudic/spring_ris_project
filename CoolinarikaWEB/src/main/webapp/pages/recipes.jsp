<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
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
		style="background-image: url('/Coolinarika/img/apples.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
		<div class="container" style="margin-top: 50px; margin-left: 130px">
			<div class="card-body">

				<!-- Grid row -->
				<div class="row mt-5">

					<!-- Grid column -->
						<div class="col-md-6 col-xl-4 px-0">
							<c:if test="${! empty allCategories}">
								<ul
									class="list-unstyled table-wrapper-scroll-y my-custom-scrollbar"
									style="width: 750px; height: 850px; margin-top: 20px">
									<c:forEach items="${allCategories}" var="al">
										<li class="d-flex justify-content-between mb-4">
											<!-- Card -->
											<div class="card card-cascade narrower card-ecommerce mb-5"
												style="height: 300px; width: 300px">

												<!-- Card image -->
												<div class="view view-cascade overlay">
													<img
														src="https://i.ytimg.com/vi/LNuarCw8c8Y/maxresdefault.jpg"
														class="img-fluid" alt="" style="height: 150px; width: 300px">
												</div>

												<!-- Card content -->
												<div class="card-body card-body-cascade">

													<!-- Title -->
													<h4 class="card-title">${al.name }</h4>


												</div>

												<!-- Card footer -->
												<div class="card-footer links-light">
													<span class="float-right"> <a href="/Coolinarika/seeRecipes?selectedCategory=${al.idCategory }"
														class="waves-effect p-2">See recipes <i
															class="far fa-image ml-1"></i></a>
													</span>
												</div>

											</div> <!-- Card -->

										</li>
									</c:forEach>
								</ul>
							</c:if>
							</div>
							<div class="col-lg-8 col-md-12 text-center" style="margin-top: 20px">
							<c:if test = "${! empty categoryRecipes }">
								<div class="table-wrapper-scroll-y my-custom-scrollbar" style="width: 1000px; height: 800px">
									<table class="table table-bordered table-striped mb-0" style="background-color: black;">
										<thead>
											<tr>
												<th scope="col"><strong>#</strong></th>
												<th scope="col"><strong style="color: white;">Recipe name</strong></th>
												<th scope="col"><strong style="color: white;">Owner</strong></th>
												<th scope="col"><strong style="color: white;">Date</strong></th>
												<th scope="col"><strong style="color: white;">See full recipe</strong></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${categoryRecipes }" var="cr">
												<tr>
													<th><i class="fas fa-utensils fa-2x"></i></th>
													<td><strong style="color: white;">${cr.name }</strong></td>
													<td><strong style="color: white;">${cr.user.name } ${cr.user.surname }</strong></td>
													<td><strong style="color: white;">${cr.postDate }</strong></td>
													<td><form action="/Coolinarika/getRecipeInfo">
														<input type = "hidden" value="${cr.idRecipe }" name = "forRecipe">
														<input type = "submit" value="SEE" class="btn btn-outline-default waves-effect">
													</form>	
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</c:if>
							</div>
						</div>

					</div>
				</div>
				</div>
	<!-- Full Page Intro -->
</body>
</html>