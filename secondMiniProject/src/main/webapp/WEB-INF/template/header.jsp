<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.second.miniproject.domain.MemberShip" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<!-- header -->
<div class="row" id="global-header">
	<div class="col">
		<div class="row align-items-center">
			<div class="col-2 text-end">
				<a href="main">
					<img src="./resources/images/logo.png" class="w-50">
				</a>	
			</div>
			<div class="col-7 text-end">
				<a class="link-dark link-underline-opacity-0" href='${sessionScope.isLogin ? "logout" : "loginForm"}' >
					${sessionScope.isLogin ? "SIGN OUT" : "SING IN" }</a>
				&nbsp;|&nbsp;
				<!-- 회원가입 폼 joinForm 으로 이동 -->
				<c:if test="${not sessionScope.isLogin }">
					<a href="joinForm" class="link-dark link-underline-opacity-0">SIGN UP</a>
				</c:if>
				<c:if test="${sessionScope.isLogin }">
					<a href="memberUpdateForm" class="link-dark link-underline-opacity-0">CORRECTION</a>
				</c:if>
			</div>
			<div class="col-3 text-start">
				&nbsp;
				<div>
					<c:if test="${sessionScope.isLogin}">
						<img src="/Profile/${sessionScope.membership.file1 }" class="rounded-circle">
						${sessionScope.membership.name } 님 ${sessionScope.membership.id } 
					</c:if>
				</div>
				&nbsp;
<!-- <<<<<<< HEAD -->
				<button class="btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight"><i class="bi bi-list"></i></button>

					<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
					  <div class="offcanvas-header">
					    <h5 class="offcanvas-title" id="offcanvasRightLabel">MENU</h5>
					    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
					  </div>
					  <div class="offcanvas-body">
					    <a href="used_car_board">중고거래 게시판</a>
					  </div>
=======
				<button class="btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
					<i class="bi bi-list"></i>
				</button>
				<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
					<div class="offcanvas-header">
						<h5 class="offcanvas-title" id="offcanvasRightLabel">MENU</h5>
						<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
<!-- >>>>>>> branch 'hyhy' of https://github.com/ddochiisrich/MiniProject.git -->
					</div>
					<div class="offcanvas-body">CONTENT</div>
				</div>
			</div>
		</div>
	</div>
</div>