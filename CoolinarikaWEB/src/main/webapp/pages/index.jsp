<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coolinarika</title>
<script>
// Animations init
new WOW().init();</script>
</head>
<body>
	<%@ include file="header.jsp" %>
	
	 <!-- Full Page Intro -->
          <div class="view" style="background-image: url('/Coolinarika/img/cake.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
            <!-- Mask & flexbox options-->
            <div class="mask rgba-black-light align-items-center">
              <!-- Content -->
              <div class="container" style="margin-top: 150px">
                <!--Grid row-->
                <div class="row">
                  <!--Grid column-->
                  <div class="col-md-12 mb-4 white-text text-center">
                    <h1 class="h1-reponsive white-text text-uppercase font-weight-bold mb-0 pt-md-5 pt-5 wow fadeInDown" data-wow-delay="0.3s"><strong>COOLINARIKA</strong></h1>
                    <hr class="hr-light my-4 wow fadeInDown" data-wow-delay="0.4s">
                    <s:authorize access="isAuthenticated()">
                    	<h2 class="text-uppercase mb-4 white-text wow fadeInDown" data-wow-delay="0.4s"><strong>Welcome, <s:authentication property="principal.u.name"/>!</strong></h2>
                    </s:authorize>
                    <h5 class="text-uppercase mb-4 white-text wow fadeInDown" data-wow-delay="0.4s"><strong>Tasty food recipes</strong></h5>
                    <a class="btn btn-outline-white wow fadeInDown" data-wow-delay="0.4s" href = "/Coolinarika/searchAll">Search recipes</a>
                  </div>
                  <!--Grid column-->
                </div>
                <!--Grid row-->
              </div>
              <!-- Content -->
            </div>
            <!-- Mask & flexbox options-->
          </div>
          <!-- Full Page Intro -->
</body>
</body>
</html>