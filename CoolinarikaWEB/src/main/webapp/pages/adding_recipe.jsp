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
				<div class="card text-center border-light mb-3a">
					<div class="card-block">
						<h4 class="card-title" style="margin-top: 10px"><strong>Add new recipe</strong></h4>
						<form action="/Coolinarika/users/addRecipe" method="post">
							<div class="md-form">
								 <input type="text" name = "name" id="form1" class="form-control" placeholder="Recipe name..." style="width: 600px; margin-left: 100px">
								 <input type="text" name = "description" id="form1" class="form-control" placeholder="Description..." style="width: 600px; margin-left: 100px">
								 <br>
								 <p>Category:</p>
								  <select name = "catId" class="browser-default custom-select" style="width: 450px">
								 	<c:forEach items = "${categories }" var = "c">
								 		<option value="${c.idCategory }">${c.name }</option>
								 	</c:forEach>
								 </select>
								 
								 <input type="submit"
									value="ADD"
									class="btn btn-outline-black btn-rounded btn-sm waves-effect waves-dark float-center">
							</div>
						</form>
						<br><br>
					</div>
					<div class="card-footer text-muted white-text" style="background-color: #b09854">
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