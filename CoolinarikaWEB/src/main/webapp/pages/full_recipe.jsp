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
			<div class="container" style="width: 1200px; height 800px; margin-top: 200px; ">
				<div class = "row">
					<div class = "col">
						<section class="card profile-card mb-4 text-center">
						<c:if test="${! empty ingRecipes }">
							<c:forEach items = "${ingRecipes }" var = "i"> 
								<p>${i.name }</p><br>
							</c:forEach>
						</c:if>
						</section>
					</div>
					<div class = "col">
						<p>ALOOOOOOOOOOO</p>
					</div>
				</div>

			</div>
			<!-- Content -->
		</div>
		<!-- Mask & flexbox options-->
	</div>
	<!-- Full Page Intro -->
</body>
</html>