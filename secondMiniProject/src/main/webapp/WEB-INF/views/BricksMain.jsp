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
						<button class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap" type="button">차량등록하기</button>
					</div>
				</div>	
			</div>
		</div>
	</c:if>
	
	<!-- 로그인을 한 후 자기차량이 등록되있는 상태 -->
	<c:if test="${sessionScope.carInfoCheck == true}">
		<div class="border rounded border-dark mt-5" style="padding:0px 12px; background-image: url('./resources/upload/${sessionScope.info.carImg}');  background-repeat: no-repeat; background-position: center; background-size: cover;" >
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

<!-- 모달창 -->

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">차량 등록하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="carForm" action="infoRegistProcess" method="post" enctype="multipart/form-data">
          <div class="mb-3">
            <label for="cname" class="col-form-label">차종:</label>
            <input type="text" class="form-control" id="cname" name="cname" required>
          </div>
          <div class="mb-3">
            <label for="carNickname" class="col-form-label">차 별명:</label>
            <input type="text" class="form-control" id="carNickname" name="carNickname" required>
          </div>
          <div class="mb-3">
            <label for="cnumber" class="col-form-label">차량번호:</label>
            <input type="text" class="form-control" id="cnumber" name="cnumber" required>
          </div>
          <div class="mb-3">
            <label for="cmanufacturer" class="col-form-label">제조사:</label>
            <select class="form-control" id="cmanufacturer" name="cmanufacturer" required>
              <option value="">제조사 선택</option>
              <option value="BMW">BMW</option>
              <option value="도요타">도요타</option>
              <option value="폭스바겐">폭스바겐</option>
              <option value="포드">포드</option>
              <option value="벤츠">벤츠</option>
              <option value="혼다">혼다</option>
              <option value="GM">GM</option>
              <option value="현대">현대</option>
              <option value="닛산">닛산</option>
              <option value="아우디">아우디</option>
              <option value="테슬라">테슬라</option>
              <option value="페라리">페라리</option>
              <option value="포르쉐">포르쉐</option>
              <option value="람보르기니">람보르기니</option>
              <option value="기아">기아</option>
              <option value="미쓰비시">미쓰비시</option>
              <option value="수바루">수바루</option>
              <option value="쉐보레">쉐보레</option>
              <option value="볼보">볼보</option>
              <option value="재규어">재규어</option>
            </select>
          </div>
          <div class="mb-3">
            <label for="cimg" class="col-form-label">차량이미지:</label>
            <input type="file" class="form-control" id="cimg" name="cimg1">
          </div>
          <div class="mb-3">
            <label for="cyear" class="col-form-label">연식:</label>
            <input type="text" class="form-control" id="cyear" name="cyear" required>
          </div>
          <div class="mb-3">
            <label for="cmileage" class="col-form-label">누적주행거리:</label>
            <input type="text" class="form-control" id="cmileage" name="cmileage" required>
          </div>
          <div class="mb-3">
            <label for="ccolor" class="col-form-label">차량 색상:</label>
            <select class="form-control" id="ccolor" name="ccolor" required>
              <option value="">색상 선택</option>
              <option value="흰색">흰색</option>
              <option value="검정색">검정색</option>
              <option value="회색">회색</option>
              <option value="빨간색">빨간색</option>
              <option value="파란색">파란색</option>
              <option value="초록색">초록색</option>
              <option value="노란색">노란색</option>
              <option value="주황색">주황색</option>
            </select>
          </div>
          <div class="mb-3">
            <label for="cfuelType" class="col-form-label">연료 종류:</label>
            <select class="form-control" id="cfuelType" name="cfuelType" required>
              <option value="">연료 종류 선택</option>
              <option value="휘발유">휘발유</option>
              <option value="경유">경유</option>
              <option value="전기">전기</option>
              <option value="하이브리드">하이브리드</option>
            </select>
          </div>
          <div class="mb-3">
            <label for="ctransmission" class="col-form-label">변속기:</label>
            <select class="form-control" id="ctransmission" name="ctransmission" required>
              <option value="">변속기 종류 선택</option>
              <option value="오토">오토</option>
              <option value="수동">수동</option>
            </select>
          </div>
          <div class="mb-3">
            <label for="cenginOil" class="col-form-label">마지막 엔진오일교체 시기:</label>
            <input type="text" class="form-control" id="cenginOil" name="cenginOil" required>
          </div>
          <div class="mb-3">
            <label for="cairFilter" class="col-form-label">마지막 에어컨필터교체 시기:</label>
            <input type="text" class="form-control" id="cairFilter" name="cairFilter" required>
          </div>
          <div class="mb-3">
            <label for="cTire" class="col-form-label">마지막 타이어교체 시기:</label>
            <input type="text" class="form-control" id="cTire" name="cTire" required>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            <button type="submit" class="btn btn-primary">등록</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>



</body>
</html>

			
			
			
			
			
			