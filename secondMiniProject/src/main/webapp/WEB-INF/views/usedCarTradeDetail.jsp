<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>

<style>

</style>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>

		<form name="tradeCheckForm" id="tradeCheckForm">
			<input type="hidden" name="ucno" id="ucno" value="${ trade.ucno }">
			<input type="hidden" name="pageNum" id="pageNum" value="${ pageNum }">
			
			<c:if test="${ searchOption }">
				<input type="hidden" name="type" value="${ type }" />
				<input type="hidden" name="keyword" value="${ keyword }" />
			</c:if>
		</form>
		
    <div class="row align-items-center">
    <div class="col">
        <div class="row align-items-center h-auto">
        	<div class="col pt-3">
        		<h2>${ trade.cname }</h2>
        	</div>          
        </div>
        <div class="row">
        	<div class="col pb-3">
        		 <span><fmt:formatNumber value="${ trade.cmileage }" type="number" maxFractionDigits="0" />Km &nbsp;|&nbsp; ${ trade.cyear }년식 &nbsp;|&nbsp; ${ trade.cfuelType } &nbsp;|&nbsp; ${ trade.ccolor } &nbsp;|&nbsp; ${ trade.ctransmission } &nbsp;|&nbsp; ${ trade.cnumber }</span>
        	</div>
        </div>
        </div>
        <div class="col text-end text-danger">
        	<span class="fs-2"><fmt:formatNumber value="${ trade.cprice / 10000 }" type="number" maxFractionDigits="0" /></span><span class="fs-4"> 만원</span>
        </div>
   	</div>
   	
   	<div class="row justify-content-center">
   		<div class="col-8 justify-content-center align-items-center">
   			<img src="./resources/upload/${ trade.cimg }" style="width:850px; height:550px" >
   		</div>
   		<div class="col-4 border border-secondary-emphasis text-center" >
   			<img src="https://via.placeholder.com/80x80" class="rounded-circle my-5">
   			
   			<p class="fs-2">${ trade.cseller }</p>
   			<p class="fs-4">${ trade.carea }</p>
   			<p class="text-danger fs-3"><i class="bi bi-telephone-fill" ></i> ${ trade.csellerContact }</p>
   			
   			<div class="row">
   				<div class="col my-2">
   					<span class="text-secondary-emphasis">050 안심 번호</span> <span tooltip="허위 매물 단속 및 매매관련 분쟁처리 등을 위해 050 안심번호로 문의하신 전화번호와 통화내용이 엔카에 자동저장되니 안심하고 문의하세요." flow="down"><i class="bi bi-patch-question"></i></span>
   				</div>
   			</div>
   			
   			<div class="row justify-content-center">
   				<div class="col-9">
		   			<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="이 차의 어떤 점이 궁금하신가요?" aria-label="Recipient's username" aria-describedby="button-addon2">
						<button class="btn btn-outline-danger" type="button" id="button-addon2">문의</button>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<a href="tradeCarUpdate?ucno=${ trade.ucno }&pageNum=${pageNum}" class="btn btn-outline-success">수정하기</a>
					<a href="DeleteTradeBoardProcess?ucno=${ trade.ucno }&pageNum=${pageNum}" class="btn btn-outline-danger">삭제하기</a>
					<c:if test="${ not searchOption }">
					<a href="used_car_board?pageNum=${ pageNum }" class="btn btn-outline-warning">목록가기</a>
					</c:if>
					<c:if test="${ searchOption }">
					<a href="used_car_board?pageNum=${ pageNum }&type=${ type }&keyword=${ keyword }" class="btn btn-outline-warning">목록가기</a>
					</c:if>
				</div>
			</div>
   		</div>
   	</div>
   	
   	<div class="row mt-4">
   		<div class="col">
   			<span>등록번호 : ${ trade.ucno } | 조회수 : ${ trade.viewCount }</span>
   		</div>
   	</div>
   	
   	<hr>
   	
   	<div class="row mt-5">
   		<div class="col">
   			<h3>판매자 설명</h3>
   		</div>
   	</div>
   	<div class="row align-items-center">
   		<div class="col-1 h-auto">
   			<img src="https://via.placeholder.com/80x80" class="rounded-circle my-2">
   		</div>
   		<div class="col-11 text-start">
   			<div class="row">
   				<div class="col">
   					<span>${ trade.cseller } | ${ trade.carea }</span>
   				</div>
   			</div>
   			<div class="row">
   				<div class="col">
   					<span>${ trade.csellerContact }</span>
   				</div>
   			</div>
   		</div>
   	</div>
   	
   	<hr>
   	
   	
   	<div class="row">
   		<div class="col">
   			<span>${ trade.ccomment }</span>
   		</div>
   	</div>
   	
   	<div class="row py-5">
   		<div class="col-1"></div>
   		<div class="col-10 bg-dark-subtle py-3 rounded">
   			<span>브릭스는 광고등록 시스템을 제공하는 사업자로, 차량 광고 (상품정보, 이미지, 성능상태점검기록부, 차량설명글 등)의 모든 내용은 판매자가 직접 입력하였습니다.</span><br>
   			<span>차량 구매 시 광고 내용의 모든 정보를 실제 차량, 차량등록증 원본, 성능점검기록부 원본으로 직접 확인하신 뒤 계약을 진행, 완료하세요.</span>
   		</div>
   		<div class="col-1"></div>
   	</div>
   	
   	<div class="row mt-5">
   		<div class="col">
   			<h3>구매 가이드</h3>
   		</div>
   	</div>
   	<div class="row d-flex align-items-center justify-content-center">
   		<div class="col-1 text-center rounded-circle shadow-lg p-3 mb-5 mx-2 bg-body-tertiary rounded" id="notice1" style="width:120px; height:120px; cursor:pointer;">
   			<img src="./resources/images/free-icon-siren-2785693.png" style="width:40px"><br>
   			<span class="mt-5 fs-6">허위매물<br>대처</span>
   		</div>
   		<div class="col-1 text-center rounded-circle shadow-lg p-3 mb-5 mx-2 bg-body-tertiary rounded" id="notice2" style="width:120px; height:120px; cursor:pointer;">
   			<img src="./resources/images/free-icon-car-14746470.png" style="width:40px"><br>
   			<span class="mt-5">압류 및 저당처리</span>
   		</div>
   		<div class="col-1 text-center rounded-circle shadow-lg p-3 mb-5 mx-2 bg-body-tertiary rounded" id="notice3" style="width:120px; height:120px; cursor:pointer;">
   			<img src="./resources/images/free-icon-searching-4274995.png" style="width:40px"><br>
   			<span class="mt-5">성능 상태<br>점검기록부</span>
   		</div>
   		<div class="col-1 text-center rounded-circle shadow-lg p-3 mb-5 mx-2 bg-body-tertiary rounded" id="notice4" style="width:120px; height:120px; cursor:pointer;">
   			<img src="./resources/images/free-icon-commission-7582224.png" style="width:40px"><br>
   			<span class="mt-5">차량금액 외<br>별도수수료</span>
   		</div>
   		<div class="col-1 text-center rounded-circle shadow-lg p-3 mb-5 mx-2 bg-body-tertiary rounded" id="notice5" style="width:120px; height:120px; cursor:pointer;">
   			<img src="./resources/images/free-icon-cars-2555021.png" style="width:40px"><br>
   			<span class="mt-5">차량 이전등록</span>
   		</div>
   		<div class="col-1 text-center rounded-circle shadow-lg p-3 mb-5 mx-2 bg-body-tertiary rounded" id="notice6" style="width:120px; height:120px; cursor:pointer;">
   			<img src="./resources/images/free-icon-action-plan-4331899.png" style="width:40px"><br>
   			<span class="mt-5">차량체크 사항</span>
   		</div>
   	</div>
   	<div class="row mb-5">
   		<div class="col-2"></div>
   		<div class="col-8" id="noticeText">
   			<p class="fw-bold">01. 허위매물 대처</p>
   			<span>- 가격이 수시로 여러번 오르고 내리는 형태를 보이는 매물</span><br>
			<span>- 전화상담 직원과 차량 응대 직원이 다를 경우 (자연스럽게 여러가지 핑계를 댄다.)</span><br>
			<span>- 상담했던 차량과 다른 차량을 보여주거나 권하는 매물, 저렴하면서 좋은 중고차는 세상에 존재하지 않는다는 것을 잊지 마세요.</span>
   		</div>
   		<div class="col-2"></div>
   	</div>

</body>
</html>