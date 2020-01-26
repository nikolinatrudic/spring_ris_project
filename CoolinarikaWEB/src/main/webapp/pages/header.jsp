<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/Coolinarika/js/jquery-3.4.1.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="/Coolinarika/js/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="/Coolinarika/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="/Coolinarika/js/mdb.min.js"></script>
<meta charset="UTF-8">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Bootstrap core CSS -->
<link href="/Coolinarika/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="/Coolinarika/css/mdb.min.css" rel="stylesheet">
<!-- Your custom styles (optional) -->
<link href="/Coolinarika/css/style.css" rel="stylesheet">
<script type="text/javascript">
	$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	})
</script>
</head>
<nav
	class="navbar fixed-top navbar-expand-lg navbar-dark scrolling-navbar">
	<a class="navbar-brand" href="/Coolinarika/pages/index.jsp"><strong>Coolinarika</strong></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<s:authorize access="!isAuthenticated()">
				<li class="nav-item active"><a class="nav-link"
					href="${pageContext.request.contextPath}/pages/login.jsp">LOG
						IN </a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/pages/signup.jsp">SIGN
						UP</a></li>
			</s:authorize>
			<s:authorize access="isAuthenticated()">
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/users/redirectAddRecipe">ADD
						RECIPE <span class="sr-only">(current)</span>
				</a></li>
				<s:authorize access="hasRole('ADMIN')">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/pages/new_category.jsp">ADD
							NEW CATEGORY</a></li>
				</s:authorize>
				<li class="nav-item"><a class="nav-link" href="/Coolinarika/searchAll">RECIPES</a></li>
				<s:authorize access="isAuthenticated()">
					</s:authorize>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/logout">SIGN OUT</a></li>
				</s:authorize>
		</ul>
		<form class="form-inline" action="/Coolinarika/getIngredientsAndCategories">
			<div class="md-form my-0">
				<input class="btn btn-light" type="submit" value="Search">
			</div>
		</form>
		<!-- 		    <div class="md-form my-0"> -->
		<%-- 		   		<i class="fas fa-envelope fa-2x badge-secondary" style="background-color: black"></i><span class="counter counter-lg">9</span>&nbsp;&nbsp; --%>
		<!-- 		    </div> -->
		<s:authorize access="isAuthenticated()">
			<a href="${pageContext.request.contextPath}/users/getFriendsInfo"
				class="notification" style="margin-right: 12px; margin-bottom: 2px" data-toggle="tooltip" data-placement="bottom" title="Social page">
				<i class="fas fa-user fa-2x"></i> <span class="badge">${friendRequest }</span>
			</a>
			<a href="/Coolinarika/users/getMessages" class="notification" data-toggle="tooltip" data-placement="bottom" title="${messageNumber } messages"> <i
				class="fas fa-envelope fa-2x" ></i> <span class="badge">${messageNumber }</span>
			</a>
			<a href="/Coolinarika/users/getProfileInfo">
			<img src="${userPicture }" alt="avatar"
				style="width: 45px; height: 45px; margin-bottom: 2px; margin-left: 12px"
				class="avatar rounded-circle d-flex align-self-center mr-2 z-depth-1" data-toggle="tooltip" data-placement="bottom" title="My profile">
			</a>
		</s:authorize>
	</div>
</nav>
</html>