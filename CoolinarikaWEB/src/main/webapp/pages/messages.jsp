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
		style="background-image: url('/Coolinarika/img/cake.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
		<!-- Mask & flexbox options-->
		<div class="mask rgba-black-light align-items-center">
			<!-- Content -->
			<div class="container" style="margin-top: 100px; margin-left: 130px">
				<div class="card rare-wind-gradient chat-room"
					style="width: 1300px; height: 800px">
					<div class="card-body">

						<!-- Grid row -->
						<div class="row px-lg-2 px-2">

							<!-- Grid column -->
							<div class="col-md-6 col-xl-4 px-0">

								<h6 class="font-weight-bold mb-3 text-center text-lg-left">Chat</h6>
								<div
									class="white z-depth-1 px-2 pt-3 pb-0 members-panel-1 scrollbar-light-blue "
									style="height: 700px">
									<ul class="list-unstyled friend-list">
										<c:if test="${! empty friendsChat}">
											<c:forEach items="${friendsChat}" var="fc">
												<li class="active grey lighten-3 p-2"><a
													href="/Coolinarika/users/seeMessages?usernamet=${fc.username}"
													class="d-flex justify-content-between"> <img
														src="${fc.picture}" alt="avatar"
														style="width: 60px; height: 60px"
														class="avatar rounded-circle d-flex align-self-center mr-2 z-depth-1">
														<div class="text-small">
															<strong>${fc.name} ${fc.surname}</strong>
														</div>
												</a></li>
											</c:forEach>
										</c:if>
									</ul>
								</div>

							</div>
							<!-- Grid column -->

							<!-- Grid column -->
							<div class="col-md-6 col-xl-8 pl-md-3 px-lg-auto px-0">
								<div class="chat-message" style="height: 9m,kn00px">

									<c:if test = "${! empty user }">
										<form action="/Coolinarika/users/sendMessage" method="post"
											style="margin-bottom: 30px; margin-top: 35px">
											<div class="white">
												<div class="form-group basic-textarea">
													<textarea class="form-control pl-2 my-0" name="content"
														id="exampleFormControlTextarea2" rows="3"
														placeholder="Type your message here..."></textarea>
												</div>
											</div>
											<input type="submit" value="SEND"
												class="btn btn-outline-pink btn-rounded btn-sm waves-effect waves-dark float-right"
												style="margin-right: 45px; padding: 15px;">
										</form>
									</c:if>
									<c:if test="${! empty message}">
										<ul class="list-unstyled chat-1 scrollbar-light-blue"
															style="width: 650px;margin-top: 50px">
											<c:forEach items="${message}" var="m">
													<li class="d-flex justify-content-between mb-4"><img
														src="${m.user1.picture }" alt="avatar"
														style="width: 80px; height: 80px"
														class="avatar rounded-circle mr-2 ml-lg-3 ml-0 z-depth-1">
														<div class="chat-body white p-3 ml-2 z-depth-1" style="width: 500px">
															<div class="header">
																<strong class="primary-font">${m.user1.name} ${m.user1.surname}</strong>
																<small class="pull-right text-muted"><i
																	class="far fa-clock"></i> ${m.date}</small>
															</div>
															<hr class="w-100">
															<p class="mb-0">${m.content}</p>
														</div></li>
											</c:forEach>
										</ul>
									</c:if>



									<%-- 									</c:if> --%>
									<%-- 									<c:if test="${obj != null }"> --%>
									<!-- 										<form action="/Coolinarika/users/sendMessage" method="post"> -->
									<!-- 										<div class="white"> -->
									<!-- 											<div class="form-group basic-textarea"> -->
									<!-- 												<textarea class="form-control pl-2 my-0" -->
									<!-- 													name = "content" -->
									<!-- 													id="exampleFormControlTextarea2" rows="3" -->
									<!-- 													placeholder="Type your message here..."></textarea> -->
									<!-- 											</div> -->
									<!-- 										</div> -->
									<!-- 										<input type="submit" value = "SEND" -->
									<!-- 											class="btn btn-outline-pink btn-rounded btn-sm waves-effect waves-dark float-right" -->
									<!-- 											style = "margin-left: 10px"> -->
									<!-- 										</form> -->
									<%-- 									</c:if> --%>
								</div>

							</div>
							<!-- Grid column -->

						</div>
						<!-- Grid row -->

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