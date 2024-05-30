<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<!DOCTYPE html>
<html>
<head>

<style>
	body {
    background-color: white;
}
</style>

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
	<div class="loginNotadd">
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
	</div>
	<!-- 로그인을 한 후 자기차량이 등록되있는 상태 -->
	<div class="loginOkadd">
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
					<img src="./resources/images/${ sessionScope.cmanufacturer }.svg" class="w-25">
				</div>	
			</div>
	
			<div class="row mb-5 p-5">
				<div class="col">
					<button type="button" class="btn btn-outline-secondary text-light btn-lg" data-bs-toggle="modal" data-bs-target="#staticBackdrop">내 차 정보</button>
				</div>		
			</div>
			<div class="row rounded-bottom align-items-center p-3" style="background-color: rgba(0, 0, 0, 0.5);">
				<div class="col-6 text-light py-4">
					<button type="button" class="btn text-white" data-bs-toggle="modal" data-bs-target="#cmileageModal" data-bs-whatever="@getbootstrap">누적 주행거리 ></button><br>
					<div id="mileageDiv">
						<span class="fs-1" id="resultCmileage">${sessionScope.info.carMileage}</span><span>km</span>
					</div>
				</div>		
				<div class="col-6 text-light py-4">
					<span>평균 연비 ></span><br>
					<span class="fs-1">${sessionScope.info.carFuelAverage}</span><span>km/L</span>
				</div>
			</div>
		</div>
	</c:if>
	</div>

		<!-- 광고 캐러셀 --> 
	<div id="carouselExampleAutoplaying" class="carousel slide mt-3" data-bs-ride="carousel">
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="./resources/images/carousel01.webp" class="d-block w-100">
	    </div>
	    <div class="carousel-item">
	      <img src="./resources/images/carousel02.jpeg" class="d-block w-100">
	    </div>
	    <div class="carousel-item">
	      <img src="./resources/images/carousel03.jpeg" class="d-block w-100">
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
	
	<!-- 최근기록 구간 -->
	<div class="row mt-5">
		<div class="col-4 text-start">
			<h2>최근 기록</h2>
		</div>
		<div class="col-8 text-end px-5">
		</div>
		<hr>
	</div>
	
	
	<!-- 최근기록 상세구간 -->
	<div class="row">
		<div class="col-2 text-center">
			<img src="./resources/images/fuelcharger.webp" class="rounded-circle" style="width:60px;">
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
			<img src="./resources/images/fuelcharger.webp" class="rounded-circle" style="width:60px;">
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
		</div>
		<hr>
	</div>
	
	<div class="row d-flex align-items-center">
            <div class="col-2 text-center">
                <img src="./resources/images/engineOil.webp" class="rounded-circle" style="width:60px;">
            </div>
            <div class="col-7">
                <pre>엔진오일 교체</pre>
                <c:set var="cenginOil" value="${sessionScope.info.cenginOil}" />
                <c:set var="carMileage" value="${sessionScope.info.carMileage}" />
                <c:set var="oilPlus7000" value="${cenginOil + 7000}" />
                <c:set var="oilRemainingKm" value="${oilPlus7000 - carMileage}" />
                <c:choose>
                    <c:when test="${oilRemainingKm >= 0}">
                        <c:set var="progressPercent" value="${((7000 - oilRemainingKm) / 7000.0) * 100}" />
                    </c:when>
                    <c:otherwise>
                        <c:set var="progressPercent" value="100" />
                    </c:otherwise>
                </c:choose>
                
                <div class="progress m-0 p-0" role="progressbar" aria-label="Basic example" aria-valuenow="${progressPercent}" aria-valuemin="0" aria-valuemax="100">
                    <c:choose>
                        <c:when test="${oilRemainingKm >= 0}">
                            <div class="progress-bar" style="width: ${progressPercent}%;"></div>
                        </c:when>
                        <c:otherwise>
                            <div class="progress-bar bg-danger" style="width: 100%;"></div>
                        </c:otherwise>
                    </c:choose>
                </div>
                
                <c:choose>
                    <c:when test="${oilRemainingKm >= 0}">
                        <span>${oilRemainingKm} km 남음</span>
                    </c:when>
                    <c:otherwise>
                        <span>${-oilRemainingKm} km 초과</span>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="col-3 text-end px-5">
                <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#enginOilModalLabel" data-bs-whatever="@getbootstrap">업데이트</button>
            </div>
        </div>




		<div class="row d-flex align-items-center">
            <div class="col-2 text-center">
                <img src="./resources/images/airFilter.webp" class="rounded-circle"style="width:60px;">
            </div>
            <div class="col-7">
                <pre>에어컨 필터 교체</pre>
                <c:set var="cairFilter" value="${sessionScope.info.cairFilter}" />
                <c:set var="carMileage" value="${sessionScope.info.carMileage}" />
                <c:set var="filterPlus7000" value="${cairFilter + 7000}" />
                <c:set var="remainingKm" value="${filterPlus7000 - carMileage}" />
                <c:choose>
                    <c:when test="${remainingKm >= 0}">
                        <c:set var="progressPercent" value="${((7000 - remainingKm) / 7000.0) * 100}" />
                    </c:when>
                    <c:otherwise>
                        <c:set var="progressPercent" value="100" />
                    </c:otherwise>
                </c:choose>
                
                <div class="progress m-0 p-0" role="progressbar" aria-label="Basic example" aria-valuenow="${progressPercent}" aria-valuemin="0" aria-valuemax="100">
                    <c:choose>
                        <c:when test="${remainingKm >= 0}">
                            <div class="progress-bar" style="width: ${progressPercent}%;"></div>
                        </c:when>
                        <c:otherwise>
                            <div class="progress-bar bg-danger" style="width: 100%;"></div>
                        </c:otherwise>
                    </c:choose>
                </div>
                
                <c:choose>
                    <c:when test="${remainingKm >= 0}">
                        <span>${remainingKm} km 남음</span>
                    </c:when>
                    <c:otherwise>
                        <span>${-remainingKm} km 초과</span>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="col-3 text-end px-5">
                <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#airFilterModalLabel" data-bs-whatever="@getbootstrap">업데이트</button>
            </div>
        </div>
        
        


		<div class="row d-flex align-items-center mb-3">
            <div class="col-2 text-center">
                <img src="./resources/images/tire.webp" class="rounded-circle" style="width:60px;">
            </div>
            <div class="col-7">
                <pre>타이어 교체</pre>
                <c:set var="cTire" value="${sessionScope.info.cTire}" />
                <c:set var="carMileage" value="${sessionScope.info.carMileage}" />
                <c:set var="tirePlus7000" value="${cTire + 7000}" />
                <c:set var="tireRemainingKm" value="${tirePlus7000 - carMileage}" />
                <c:choose>
                    <c:when test="${tireRemainingKm >= 0}">
                        <c:set var="progressPercent" value="${((7000 - tireRemainingKm) / 7000.0) * 100}" />
                    </c:when>
                    <c:otherwise>
                        <c:set var="progressPercent" value="100" />
                    </c:otherwise>
                </c:choose>
                
                <div class="progress" role="progressbar" aria-label="Danger example" aria-valuenow="${progressPercent}" aria-valuemin="0" aria-valuemax="100">
                    <c:choose>
                        <c:when test="${tireRemainingKm >= 0}">
                            <div class="progress-bar" style="width: ${progressPercent}%;"></div>
                        </c:when>
                        <c:otherwise>
                            <div class="progress-bar bg-danger" style="width: 100%;"></div>
                        </c:otherwise>
                    </c:choose>
                </div>
                
                <c:choose>
                    <c:when test="${tireRemainingKm >= 0}">
                        <span>${tireRemainingKm} km 남음</span>
                    </c:when>
                    <c:otherwise>
                        <span>${-tireRemainingKm} km 초과</span>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="col-3 text-end px-5">
                <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#tireModalLabel" data-bs-whatever="@getbootstrap">업데이트</button>
            </div>
        </div>

<!-- 차량정보 추가 모달창 -->

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">차량 등록하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="carForm" action="infoRegistProcess" method="post" enctype="multipart/form-data">
        <input type="hidden" id="sessionId" value="${ id }">
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
              <option value="스바루">스바루</option>
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
            <input type="text" class="form-control" id="carMileage" name="carMileage" required>
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

<!-- 차량 주행거리 추가 모달창 -->

<div class="modal fade" id="cmileageModal" tabindex="-1" aria-labelledby="cmileageModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">누적 주행거리 업데이트</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="cmileageForm">
        <input type="hidden" id="sessionId" value="${ id }">
          <div class="mb-3">
            <label for="editCmileage" class="col-form-label">누적 주행거리 :</label>
            <input type="text" class="form-control" id="editCmileage" name="editCmileage">
            <small id="editCmileageHelp" class="form-text"> 숫자만 입력해주세요.</small>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="submit" class="btn btn-primary carInfoUpdate" form="cmileageForm">업데이트</button>
      </div>
    </div>
  </div>
</div>

<!-- 엔진오일 교채 업데이트 모달창 -->

<div class="modal fade" id="enginOilModalLabel" tabindex="-1" aria-labelledby="enginOilModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">엔진오일 교체</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="enginOilForm">
        <input type="hidden" id="sessionId" value="${ id }">
        <input type="hidden" id="carMileage" value="${sessionScope.info.carMileage}">        
          <div class="mb-3">
            <label for="editEngineOil" class="col-form-label">교체 주행거리 :</label>
            <input type="text" class="form-control" id="editEngineOil" name="editEngineOil">
            <small id="editEngineOilHelp" class="form-text"> 숫자만 입력해주세요.</small>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="submit" class="btn btn-primary carInfoUpdate" form="enginOilForm">업데이트</button>
      </div>
    </div>
  </div>
</div>

<!-- 에어컨 필터 교채 업데이트 모달창 -->

<div class="modal fade" id="airFilterModalLabel" tabindex="-1" aria-labelledby="airFilterModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">에어컨 필터 교체</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="airFilterForm">
        <input type="hidden" id="sessionId" value="${ id }">
        <input type="hidden" id="carMileage" value="${sessionScope.info.carMileage}">        
          <div class="mb-3">
            <label for="editairFilter" class="col-form-label">교체 주행거리 :</label>
            <input type="text" class="form-control" id="editairFilter" name="editairFilter">
            <small id="editairFilterHelp" class="form-text"> 숫자만 입력해주세요.</small>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="submit" class="btn btn-primary carInfoUpdate" form="airFilterForm">업데이트</button>
      </div>
    </div>
  </div>
</div>

<!-- 타이어 교채 업데이트 모달창 -->



<div class="modal fade" id="tireModalLabel" tabindex="-1" aria-labelledby="tireModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="tireModalLabel">타이어 교체</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="tireForm">
        <input type="hidden" id="sessionId" value="${ id }">
        <input type="hidden" id="carMileage" value="${sessionScope.info.carMileage}">        
          <div class="mb-3">
            <label for="editcTire" class="col-form-label">교체 주행거리 :</label>
            <input type="text" class="form-control" id="editcTire" name="editcTire">
            <small id="editcTireHelp" class="form-text"> 숫자만 입력해주세요.</small>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="submit" class="btn btn-primary carInfoUpdate" form="tireForm">업데이트</button>
      </div>
    </div>
  </div>
</div>

<!-- 내차정보 모달 -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel"><strong>"${sessionScope.info.id}"</strong> 님의 차량정보</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p><strong>차량 별명:</strong> ${sessionScope.info.carNickname}</p>
                    <p><strong>차량 종류:</strong> ${sessionScope.info.cname}</p>
                    <p><strong>차량 번호:</strong> ${sessionScope.info.cnumber}</p>
                    <p><strong>제조사:</strong> ${sessionScope.info.cmanufacturer}</p>
                    <p><strong>제조 연도:</strong> ${sessionScope.info.cyear} 년식</p>
                    <p><strong>차량 색상:</strong> ${sessionScope.info.ccolor}</p>
                    <p><strong>연료 타입:</strong> ${sessionScope.info.cfuelType}</p>
                    <p><strong>변속기:</strong> ${sessionScope.info.ctransmission}</p>
                    <p><strong>마지막 엔진 오일 교체:</strong> ${sessionScope.info.cenginOil} km</p>
                    <p><strong>마지막 에어컨 필터 교체:</strong> ${sessionScope.info.cairFilter} km</p>
                    <p><strong>마지막 타이어 교체:</strong> ${sessionScope.info.cTire} km</p>
                    <p><strong>현재 주행 거리:</strong> ${sessionScope.info.carMileage} km</p>
                    <p><strong>평균 연비:</strong> ${sessionScope.info.carFuelAverage} km/l</p>
                    <p><strong>등록 날짜:</strong> <fmt:formatDate value="${sessionScope.info.createdAt}" pattern="yyyy년 MM월 dd일"/></p>
                    <div class="text-center">
                        <p><strong>차량 이미지:</strong></p>
                        <img src="./resources/upload/${sessionScope.info.carImg}" alt="Car Image" class="img-fluid" style="max-width: 100%; height: auto;">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>


</body>
</html>

			
			
			
			
			
			