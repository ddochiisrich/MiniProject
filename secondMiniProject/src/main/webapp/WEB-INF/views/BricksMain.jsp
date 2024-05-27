<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	      <img src="https://via.placeholder.com/150x10" class="d-block w-100">
	    </div>
	    <div class="carousel-item">
	      <img src="https://via.placeholder.com/150x10" class="d-block w-100">
	    </div>
	    <div class="carousel-item">
	      <img src="https://via.placeholder.com/150x10" class="d-block w-100">
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
	<div class="border rounded border-dark mt-5" style="padding:0px 12px; background-image: url('./resources/images/Hyundai_Sonata_(DN8).jpeg');  background-repeat: no-repeat;" >
		<div class="row mb-1 pt-5 px-5">
			<div class="col text-light">
				<div class="row">
					<h2>쏘우나타</h2>
				</div>
				<div class="row">
					<h5>000일 째 관리중</h5>
				</div>
			</div>	
			<div class="col text-end">
				<img src="./resources/images/HYUNDAI.svg" class="w-50">
			</div>	
		</div>

		<div class="row mb-5 p-5">
			<div class="col">
				<button type="button" class="btn btn-outline-dark text-light">내 차 정보</button>
			</div>		
		</div>
		<div class="row rounded-bottom align-items-center p-3" style="background-color: rgba(0, 0, 0, 0.5);">
			<div class="col-6 text-light py-4">
				<span>누적 주행거리 ></span><br>
				<span class="fs-1">17,000</span><span>km</span>
			</div>		
			<div class="col-6 text-light py-4">
				<span>평균 연비 ></span><br>
				<span class="fs-1">18.6</span><span>km/L</span>
			</div>
		</div>
	</div>
	
	
	
	<!-- 이미지 구간 -->
	<div class="row text-center">
		<div class="col">
			<img src="./resources/images/background.jpg">
		</div>
	</div>
	

	

</body>
</html>

			
			
			
			
			
			