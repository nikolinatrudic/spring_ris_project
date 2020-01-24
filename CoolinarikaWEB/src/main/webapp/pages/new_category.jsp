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
		style="background-image: url('/Coolinarika/img/cake.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
		<!-- Mask & flexbox options-->
		<div class="mask rgba-black-light align-items-center">
			<!-- Content -->
			<div class="container" style="width: 800px; margin-top: 200px">
				<!--Panel-->
				<div class="card text-center border-light mb-3">
					<div class="card-block">
						<h4 class="card-title" style="margin-top: 10px"><strong>Add new food category</strong></h4>
						<form action="/Coolinarika/admin/addCategory" method="post">
							<div class="md-form">
								 <input type="text" name = "name" id="form1" class="form-control" placeholder="Category..." style="width: 600px; margin-left: 100px">
									<input type="submit"
									value="ADD"
									class="btn btn-outline-black btn-rounded btn-sm waves-effect waves-dark float-center">

							</div>
						</form>
					</div>
					<div class="card-footer text-muted white-text" style="background-color: #b09854">
						<c:if test="${! empty cat }">
							<p style="color: white;"><strong>YOU JUST ADDED A NEW CATEGORY</strong></p>
						</c:if>
					</div>
				</div>
				<!--/.Panel-->
			</div>
			<!-- Content -->
		</div>
		<!-- Mask & flexbox options-->
	</div>
	<!-- Full Page Intro -->


</body>
</html>