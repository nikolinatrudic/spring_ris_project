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
		<!-- Mask & flexbox options-->
		<div class="mask rgba-black-light align-items-center">
			<div class="container" style="margin-top: 150px;">
				<div class="row">
					<div class="col-md">
						<p class="font-weight-bold text-white example z-depth-5">My friends</p>
						<table class="table table-striped table-light">
							<thead>
								<tr>
									<th scope="col">First name</th>
									<th scope="col">Last name</th>
									<th scope="col">Username</th>
									<th scope="col">Message</th>
									<th scope="col">Delete</th>
								</tr>
							</thead>
							<c:if test="${ empty friends}">
								<td colspan="5">Friends list is empty at the moment!</td>
							</c:if>
							<c:if test="${! empty friends}">	
								<tbody>
									<c:forEach items = "${friends }" var = "f">
										<tr>
											<td>${f.name }</td>
											<td>${f.surname }</td>
											<td>@${f.username }</td>
											<td style="padding: 0; margin: 0"><form action="/Coolinarika/users/sendFriendMessage" method = "post">
											<input type="hidden" name="id" value="${f.idUser }" />
											<input type = "submit" value="SEND" class="btn btn-outline-default waves-effect">
											</form></td>
											<td style="padding: 0; margin: 0">
												<form action="/Coolinarika/users/deleteFriend" method = "post">
													<input type="hidden" name="id" value="${f.idUser }" />
													<input type = "submit" value="DELETE" class="btn btn-outline-default waves-effect">
												</form>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</c:if>
						</table>
					</div>
					<div class="col-md">
						<p class="font-weight-bold text-white example z-depth-5">Friend requests</p>
						<table class="table table-striped table-light">
							<thead>
								<tr>
									<th scope="col">First name</th>
									<th scope="col">Last name</th>
									<th scope="col">Username</th>
									<th scope="col">Accept</th>
									<th scope="col">Delete</th>
								</tr>
							</thead>
							<c:if test="${ empty requests}">
								<td colspan="5">There are not friend requests at the moment!</td>
							</c:if>
							<c:if test="${! empty requests }">
								<tbody>
									<c:forEach items = "${requests }" var = "r">
										<td>${r.name }</td>
										<td>${r.surname }</td>
										<td>@${r.username }</td>
										<td style="padding: 0; margin: 0"><form action="${pageContext.request.contextPath}/users/acceptFriend" method = "post">
										<input type="hidden" name="id" value="${r.idUser }" />
										<input type = "submit" value="ACCEPT" class="btn btn-outline-default waves-effect">
										</form></td>
										<td style="padding: 0; margin: 0"><form action="/Coolinarika/users/deleteFriendRequest" method = "post">
										<input type="hidden" name="id" value="${r.idUser }" />
										<input type = "submit" value="DELETE" class="btn btn-outline-default waves-effect">
										</form></td>
									</c:forEach>
								</tbody>
							</c:if>
						</table>
					</div>
<!-- 					<br><br><br> -->
				</div>
			</div>
		</div>
		<!-- Mask & flexbox options-->
	</div>
	<!-- Full Page Intro -->
</body>
</html>