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
						<c:if test="${! empty addedRecipe }">
							<form action="/Coolinarika/users/addIngredient" method="post">
								<table style="margin-left: 50px">
									<tr>
										<td><select name = "ingredient" class="browser-default custom-select" style="width: 450px;">
											<c:forEach items = "${ing }" var = "i">
												<option value="${i.idIngredient }">${i.name }</option>
											</c:forEach>
										</select></td>
									<td><input type="text" name = "amount" id="form1" class="form-control" placeholder="Amount..." style="width: 150px;"></td>
									<td><input type="submit"
										value="ADD"
										class="btn btn-outline-black btn-rounded btn-sm waves-effect waves-dark"></td>
									</tr>
							   </table>
							</form>
							<br>
							<c:if test = "${! empty cont }">
								<p>Just added a new ingredient!</p>
							</c:if>
							<form action="/Coolinarika/users/addPicture" method="post">
								<table style="margin-left: 50px">
									<tr>
										<td><input type="text" name = "picture" id="form1" class="form-control" placeholder="Picture..." style="width: 300px; margin-left: 100px"></td>
										<td><input type="submit"
											value="ADD"
											class="btn btn-outline-black btn-rounded btn-sm waves-effect waves-dark"></td>
									</tr>
								</table>
							</form>
							<br><br>
						</c:if>
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