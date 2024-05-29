<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bricks</title>
</head>
<body>

	<!-- 메인 메뉴 -->
	<div class="row text-center">
		<div class="col-3">
		
		</div>
		<div class="col-1 my-5 align-items-center center">
			<a href="#" class="fs-3 link-dark link-underline-opacity-0"><span>내차</span></a>
		</div>
		<div class="col-1 my-5 align-items-center">
			<span class="fs-3">|</span>
		</div>
		<div class="col-1 my-5 align-items-center text-center">
			<a href="#" class="fs-3 link-dark link-underline-opacity-0"><span>기록</span></a>
		</div>
		<div class="col-1 my-5 align-items-center text-center">
			<a href="#" class="fs-3 link-dark link-underline-opacity-0"><span>통계</span></a>
		</div>
		<div class="col-1 my-5 align-items-center text-center">
			<a href="#" class="fs-3 link-dark link-underline-opacity-0"><span>점검</span></a>
		</div>
		<div class="col-1 my-5 align-items-center text-center">
			<a href="#" class="fs-3 link-dark link-underline-opacity-0"><span>정비</span></a>
		</div>
		<div class="col-3">
		
		</div>
	</div>
	
	<!-- 광고 캐러셀 --> 
	<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="https://via.placeholder.com/1296x100" class="d-block w-100">
	    </div>
	    <div class="carousel-item">
	      <img src="https://via.placeholder.com/1296x100" class="d-block w-100">
	    </div>
	    <div class="carousel-item">
	      <img src="https://via.placeholder.com/1296x100" class="d-block w-100">
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
	<!-- 차량 디테일 -->
	
	<!-- 로그인을 안한상태 -->
	<c:if test="${sessionScope.carInfoCheck == null}">
		<div class="border rounded border-dark mt-5 d-flex align-items-center justify-content-center" style="width:1360px; height:370px; padding:0px 12px;" >
			<div class="row">
				<div class="col">
					<div class="d-grid gap-2">
						<h1>로그인 또는 회원가입을 해주세요</h1>
					</div>
				</div>	
			</div>
		</div>
	</c:if>
	
	<!-- 로그인을 했으나 자기 차량등록을 안한상태 -->
	<c:if test="${sessionScope.carInfoCheck == false}">
		<div class="border rounded border-dark mt-5 d-flex align-items-center justify-content-center" style="width:1360px; height:370px; padding:0px 12px;" >
			<div class="row">
				<div class="col">
					<div class="d-grid gap-2">
						<button class="btn btn-primary btn-lg" type="button">차량등록하기</button>
					</div>
				</div>	
			</div>
		</div>
	</c:if>
	
	<!-- 로그인을 한 후 자기차량이 등록되있는 상태 -->
	<c:if test="${sessionScope.carInfoCheck == true}">
		<div class="border rounded border-dark mt-5" style="padding:0px 12px; background-image: url('./resources/upload/default_car_image.png');  background-repeat: no-repeat; background-position: center; background-size: cover;" >
			<div class="row mb-1 pt-5 px-5">
				<div class="col text-light">
					<div class="row">
						<h1>${sessionScope.info.carNickname}</h1>
					</div>
					<div class="row">
						<h5>${(sessionScope.diffInDays) + 1}일 째 관리중</h5>
					</div>
				</div>	
				<div class="col text-end">
					<img src="./resources/images/HYUNDAI.svg" class="w-50">
				</div>	
			</div>
	
			<div class="row mb-5 p-5">
				<div class="col">
					<button type="button" class="btn btn-outline-secondary text-light btn-lg">내 차 정보</button>
				</div>		
			</div>
			<div class="row rounded-bottom align-items-center p-3" style="background-color: rgba(0, 0, 0, 0.5);">
				<div class="col-6 text-light py-4">
					<span>누적 주행거리 ></span><br>
					<span class="fs-1">${sessionScope.info.carMileage}</span><span>km</span>
				</div>		
				<div class="col-6 text-light py-4">
					<span>평균 연비 ></span><br>
					<span class="fs-1">${sessionScope.info.carFuelAverage}</span><span>km/L</span>
				</div>
			</div>
		</div>
	</c:if>
	
	
	<!-- 최근기록 구간 -->
	<div class="row mt-5">
		<div class="col-4 text-start">
			<h2>최근 기록</h2>
		</div>
		<div class="col-8 text-end px-5">
			<button  type="button" class="btn btn-secondary">더보기 ></button>
		</div>
		<hr>
	</div>
	
	
	<!-- 최근기록 상세구간 -->
	<div class="row">
		<div class="col-2 text-center">
			<img src="https://via.placeholder.com/50" class="rounded-circle">
		</div>
		<div class="col-7 text-start">
			<pre>주유 17.66L</pre>
			<pre>(주) 지에스이엔알 보라주유소</pre>
		</div>
		<div class="col-3 text-end px-5">
			<pre>1,699 ₩/L</pre>
			<h5>₩ 30,000</h5>
		</div>
	</div>
	
	<div class="row">
		<div class="col-2 text-center">
			<img src="https://via.placeholder.com/50" class="rounded-circle">
		</div>
		<div class="col-7 text-start">
			<pre>주유 17.66L</pre>
			<pre>(주) 지에스이엔알 보라주유소</pre>
		</div>
		<div class="col-3 text-end px-5">
			<pre>1,699 ₩/L</pre>
			<h5>₩ 30,000</h5>
		</div>
	</div>
	

	<!-- 정비목록 구간 -->
	<div class="row mt-5">
		<div class="col-4 text-start">
			<h2>정비 목록</h2>
		</div>
		<div class="col-8 text-end px-5">
			<button  type="button" class="btn btn-secondary">전체보기 ></button>
		</div>
		<hr>
	</div>
	
	<div class="row d-flex align-items-center">
		<div class="col-2 text-center">
			<img src="https://via.placeholder.com/50" class="rounded-circle">
		</div>
		<div class="col-7">
			<pre>엔진오일 교체</pre>
			<div class="progress m-0 p-0" role="progressbar" aria-label="Basic example" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">
				<div class="progress-bar w-75"></div>
			</div>
			<pre>1800 km 남음</pre>
		</div>
		<div class="col-3 text-end px-5">
			<button  type="button" class="btn btn-secondary">보기</button>
		</div>
	</div>
		<div class="row d-flex align-items-center">
		<div class="col-2 text-center">
			<img src="https://via.placeholder.com/50" class="rounded-circle">
		</div>
		<div class="col-7">
			<pre>에어컨 필터 교체</pre>
			<div class="progress m-0 p-0" role="progressbar" aria-label="Basic example" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">
				<div class="progress-bar w-75"></div>
			</div>
			<pre>1개월 16일 남음</pre>
		</div>
		<div class="col-3 text-end px-5">
			<button  type="button" class="btn btn-secondary">보기</button>
		</div>
	</div>
		<div class="row d-flex align-items-center">
		<div class="col-2 text-center">
			<img src="https://via.placeholder.com/50" class="rounded-circle">
		</div>
		<div class="col-7">
			<pre>타이어 교체</pre>
			<div class="progress" role="progressbar" aria-label="Danger example" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
				<div class="progress-bar bg-danger" style="width: 100%"></div>
			</div>
			<pre>2개월 9일 지남</pre>
		</div>
		<div class="col-3 text-end px-5">
			<button  type="button" class="btn btn-secondary">보기</button>
		</div>
	</div>

</body>
</html>

			
			
			
			
			
			