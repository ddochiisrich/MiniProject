<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.second.miniproject.domain.MemberShip" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato:400,300,700,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Rubik:700&display=swap" rel="stylesheet">

<style>

/*오프캔버스 타이틀*/

h5 {
  position: relative;
  padding: 0;
  margin: 0;
  font-family: "Raleway", sans-serif;
  font-weight: 300;
  font-size: 40px;
  color: #080808;
  -webkit-transition: all 0.4s ease 0s;
  -o-transition: all 0.4s ease 0s;
  transition: all 0.4s ease 0s;
}

h5 span {
  display: block;
  font-size: 0.5em;
  line-height: 1.3;
}
h5 em {
  font-style: normal;
  font-weight: 600;
}

.two h5 {
  text-transform: capitalize;
}
.two h5:before {
  position: absolute;
  left: 0;
  bottom: 0;
  width: 60px;
  height: 2px;
  content: "";
  background-color: #c50000;
}

.two h5 span {
  font-size: 13px;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 4px;
  line-height: 3em;
  padding-left: 0.25em;
  color: rgba(0, 0, 0, 0.4);
  padding-bottom: 10px;
}
.alt-two h5 {
  text-align:center;
}
.alt-two h5:before {
  left:50%; margin-left:-30px;
}


/*오프캔버스 메뉴*/

*, *:after, *:before {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

a:hover, a:focus {
  outline: none;
}

.SMN_effect-24 a {
  padding: 10px 20px;
  position: relative;
  overflow: hidden;
  display: inline-block;
  -webkit-transition: 0.3s ease-out;
  -moz-transition: 0.3s ease-out;
  transition: 0.3s ease-out;
  text-decoration-line: none;
  color: #000;
}

.SMN_effect-24 a span:before {
  width: 5px;
  height: 5px;
  background: transparent;
  content: "";
  position: absolute;
  left: 0;
  top: 0;
  border-top: 2px solid #c50000;
  border-left: 2px solid #c50000;
  -webkit-transition: 0.3s;
  -moz-transition: 0.3s;
  transition: 0.3s;
  opacity: 0;
}

.SMN_effect-24 a span:after {
  width: 6px;
  height: 6px;
  background: transparent;
  content: "";
  position: absolute;
  right: 0;
  bottom: 0;
  border-right: 2px solid #c50000;
  border-bottom: 2px solid #c50000;
  -webkit-transition: 0.3s;
  -moz-transition: 0.3s;
  transition: 0.3s;
  opacity: 0;
}

.SMN_effect-24 a:before {
  width: 6px;
  height: 6px;
  background: transparent;
  content: "";
  position: absolute;
  right: 0;
  top: 0;
  border-right: 2px solid #c50000;
  border-top: 2px solid #c50000;
  -webkit-transition: 0.3s;
  -moz-transition: 0.3s;
  transition: 0.3s;
  opacity: 0;
}

.SMN_effect-24 a:after {
  width: 6px;
  height: 6px;
  background: transparent;
  content: "";
  position: absolute;
  left: 0;
  bottom: 0;
  border-left: 2px solid #c50000;
  border-bottom: 2px solid #c50000;
  -webkit-transition: 0.3s;
  -moz-transition: 0.3s;
  transition: 0.3s;
  opacity: 0;
}

.SMN_effect-24 a:hover {
  color: #c50000;
}

.SMN_effect-24 a:hover:before {
  opacity: 1;
  right: 5px;
  top: 5px;
}

.SMN_effect-24 a:hover:after {
  opacity: 1;
  left: 5px;
  bottom: 5px;
}

.SMN_effect-24 a:hover span:before {
  opacity: 1;
  left: 5px;
  top: 5px;
}

.SMN_effect-24 a:hover span:after {
  opacity: 1;
  right: 5px;
  bottom: 5px;
}
</style>

<!-- header -->
<div class="row" id="global-header">
	<div class="col">
		<div class="row align-items-center">
			<div class="col-2 text-end">
				<a href="main" class="link">
					<img src="./resources/images/logo.png" class="w-75">
				</a>	
			</div>
			<!-- 움직이는 로고 -->
<!-- 			<div class="wrapper">
			  <div class="focus">
			    webs
			  </div>
			  <div class="mask">
			    <div class="text">webs</div>
			  </div>
			</div> -->
			
			<div class="col-7 text-end">
				<a class="link-dark link-underline-opacity-0 fs-5" href='${sessionScope.isLogin ? "logout" : "loginForm"}' >
					${sessionScope.isLogin ? "SIGN OUT" : "SING IN" }</a>
				&nbsp;|&nbsp;
				<!-- 회원가입 폼 joinForm 으로 이동 -->
				<c:if test="${not sessionScope.isLogin }">
					<a href="joinForm" class="link-dark link-underline-opacity-0 fs-5">SIGN UP</a>
				</c:if>
				<c:if test="${sessionScope.isLogin }">
					<a href="memberUpdateForm" class="link-dark link-underline-opacity-0 fs-5">PROFILE</a>
				</c:if>
			</div>
			<div class="col-3 text-end">
				&nbsp;
				<div>
					<c:if test="${sessionScope.isLogin}">
						<img src="./resources/images/profile.webp" class="rounded-circle" style="width:50px;">
						<span class="fs-5"><strong>${sessionScope.membership.name }</strong> 님</span>
					</c:if>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="btn fs-2" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight"><i class="bi bi-list"></i></button>
				</div>
				&nbsp;
					<div class="offcanvas offcanvas-end custom-offcanvas" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
					  <div class="offcanvas-header custom-header">
					    
<div class="two mt-4 ms-3">
  <h5 class="mb-2">MENU

  </h5>
</div>

					    <button type="button" class="btn-close me-2" data-bs-dismiss="offcanvas" aria-label="Close"></button>
					  </div>
					  <hr class="hr-19">
					  <div class="offcanvas-body custom-body">
<div class="back color-4">
    <div class="row columns">
      <ul class="menu align-center expanded text-center SMN_effect-24" style="list-style-type: none;">
        <li><a href="used_car_board" class="link"><span class="fs-5">중고차 거래 게시판</span></a></li>
<!--         <li><a href="" class="link"><span class="fs-5">메뉴1</span></a></li>
        <li><a href="" class="link"><span class="fs-5">메뉴2</span></a></li>
        <li><a href="" class="link"><span class="fs-5">메뉴3</span></a></li>
        <li><a href="" class="link"><span class="fs-5">메뉴4</span></a></li> -->
      </ul>
    </div>
  </div>
					  </div>
					</div>
			</div>
		</div>
	</div>
</div>