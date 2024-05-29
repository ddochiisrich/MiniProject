<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고거래 게시판</title>
</head>
<body>
	<!-- content -->
	<div class="row" id="global-content">
		<div class="col">
			<div class="row text-center">
				<div class="col">
					<h2>중고차 거래 게시판</h2>
				</div>
			</div>
			<!-- 검색인경우 -->
			<c:if test="${ searchOption }">
				<div class="row">
					<div class="col text-end">
						<a href="used_car_board" class="btn btn-outline-success">검색 초기화</a>
						<a href="registcar" class="btn btn-outline-success">차량 등록하기</a>
					</div>
				</div>
			</c:if>
			<!-- 검색아닌경우 -->
			<c:if test="${ not searchOption }">
				<div class="row">
					<div class="col text-end">
						<a href="registcar" class="btn btn-outline-success">차량 등록하기</a>
					</div>
				</div>
			</c:if>
			
			<div class="row my-3">
			
				<!-- 검색 -->
				<div class="col-2 container mt-5">
			        <h4 class="text-danger font-weight-bold">중고차 검색</h4>
			        <div class="text-end mb-3">
			        	<A href="used_car_board"><button type="button" class="btn btn-primary" style="--bs-btn-padding-y: .1rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;" > 조건 초기화 </button></A>
						 <span class="text-end">${ count }대 </span>
					</div>	 
			        <div class="accordion" id="accordionExample">
			            <div class="accordion-item">
			                <h2 class="accordion-header" id="headingManufacturer">
			                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseManufacturer" aria-expanded="false" aria-controls="collapseManufacturer">
			                        제조사
			                    </button>
			                </h2>
			                <div id="collapseManufacturer" class="accordion-collapse collapse" aria-labelledby="headingManufacturer" data-bs-parent="#accordionExample">
			                    <div class="accordion-body">
									<ul class="list-group overflow-auto" id="cmanufacturer" name="cmanufacturer" style="max-height: 200px;" data-type="manufacturer">
									    <li class="list-group-item border-0" data-value="BMW">BMW</li>
									    <li class="list-group-item border-0" data-value="GM">GM</li>
									    <li class="list-group-item border-0" data-value="기아">기아</li>
									    <li class="list-group-item border-0" data-value="닛산">닛산</li>
									    <li class="list-group-item border-0" data-value="도요타">도요타</li>
									    <li class="list-group-item border-0" data-value="람보르기니">람보르기니</li>
									    <li class="list-group-item border-0" data-value="렉서스">렉서스</li>
									    <li class="list-group-item border-0" data-value="마쯔다">마쯔다</li>
									    <li class="list-group-item border-0" data-value="미쓰비시">미쓰비시</li>
									    <li class="list-group-item border-0" data-value="벤츠">벤츠</li>
									    <li class="list-group-item border-0" data-value="볼보">볼보</li>
									    <li class="list-group-item border-0" data-value="쉐보레">쉐보레</li>
									    <li class="list-group-item border-0" data-value="스바루">스바루</li>
									    <li class="list-group-item border-0" data-value="아우디">아우디</li>
									    <li class="list-group-item border-0" data-value="재규어">재규어</li>
									    <li class="list-group-item border-0" data-value="테슬라">테슬라</li>
									    <li class="list-group-item border-0" data-value="폭스바겐">폭스바겐</li>
									    <li class="list-group-item border-0" data-value="포드">포드</li>
									    <li class="list-group-item border-0" data-value="포르쉐">포르쉐</li>
									    <li class="list-group-item border-0" data-value="페라리">페라리</li>
									    <li class="list-group-item border-0" data-value="현대">현대</li>
									    <li class="list-group-item border-0" data-value="혼다">혼다</li>
									</ul>
			                    </div>
			                </div>
			            </div>
			            <div class="accordion-item">
			                <h2 class="accordion-header" id="headingYear">
			                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseYear" aria-expanded="false" aria-controls="collapseYear">
			                        연식
			                    </button>
			                </h2>
			                <div id="collapseYear" class="accordion-collapse collapse" aria-labelledby="headingYear" data-bs-parent="#accordionExample">
						    <div class="accordion-body">
						        <div class="mb-3">
						            <ul class="list-group overflow-auto" id="year" name="year" style="max-height: 200px;" data-type="cyear">
						                <li class="list-group-item border-0" data-value="2024">2024</li>
						                <li class="list-group-item border-0" data-value="2023">2023</li>
						                <li class="list-group-item border-0" data-value="2022">2022</li>
						                <li class="list-group-item border-0" data-value="2021">2021</li>
						                <li class="list-group-item border-0" data-value="2020">2020</li>
						                <li class="list-group-item border-0" data-value="2019">2019</li>
						                <li class="list-group-item border-0" data-value="2018">2018</li>
						                <li class="list-group-item border-0" data-value="2017">2017</li>
						                <li class="list-group-item border-0" data-value="2016">2016</li>
						                <li class="list-group-item border-0" data-value="2015">2015</li>
						                <li class="list-group-item border-0" data-value="2014">2014</li>
						                <li class="list-group-item border-0" data-value="2013">2013</li>
						                <li class="list-group-item border-0" data-value="2012">2012</li>
						                <li class="list-group-item border-0" data-value="2011">2011</li>
						                <li class="list-group-item border-0" data-value="2010">2010</li>
						                <li class="list-group-item border-0" data-value="2009">2009</li>
						                <li class="list-group-item border-0" data-value="2008">2008</li>
						                <li class="list-group-item border-0" data-value="2007">2007</li>
						                <li class="list-group-item border-0" data-value="2006">2006</li>
						                <li class="list-group-item border-0" data-value="2005">2005</li>
						                <li class="list-group-item border-0" data-value="2004">2004</li>
						                <li class="list-group-item border-0" data-value="2003">2003</li>
						                <li class="list-group-item border-0" data-value="2002">2002</li>
						                <li class="list-group-item border-0" data-value="2001">2001</li>
						                <li class="list-group-item border-0" data-value="2000">2000</li>
						                <li class="list-group-item border-0" data-value="1999">1999</li>
						                <li class="list-group-item border-0" data-value="1998">1998</li>
						                <li class="list-group-item border-0" data-value="1997">1997</li>
						                <li class="list-group-item border-0" data-value="1996">1996</li>
						                <li class="list-group-item border-0" data-value="1995">1995</li>
						                <li class="list-group-item border-0" data-value="1994">1994</li>
						                <li class="list-group-item border-0" data-value="1993">1993</li>
						                <li class="list-group-item border-0" data-value="1992">1992</li>
						                <li class="list-group-item border-0" data-value="1991">1991</li>
						                <li class="list-group-item border-0" data-value="1990">1990</li>
						            </ul>
						        </div>
						    </div>
						</div>
			            </div>
			            <div class="accordion-item">
			                <h2 class="accordion-header" id="headingMileage">
			                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseMileage" aria-expanded="false" aria-controls="collapseMileage">
			                        주행거리
			                    </button>
			                </h2>
			                <div id="collapseMileage" class="accordion-collapse collapse" aria-labelledby="headingMileage" data-bs-parent="#accordionExample">
			                    <div class="accordion-body">
			                        <ul class="list-group overflow-auto" id="cmileage" style="max-height: 200px;" data-type="cmileage">
									    <li class="list-group-item border-0" data-value="10000">10,000km 이하</li>
									    <li class="list-group-item border-0" data-value="20000">20,000km 이하</li>
									    <li class="list-group-item border-0" data-value="30000">30,000km 이하</li>
									    <li class="list-group-item border-0" data-value="40000">40,000km 이하</li>
									    <li class="list-group-item border-0" data-value="50000">50,000km 이하</li>
									    <li class="list-group-item border-0" data-value="60000">60,000km 이하</li>
									    <li class="list-group-item border-0" data-value="70000">70,000km 이하</li>
									    <li class="list-group-item border-0" data-value="80000">80,000km 이하</li>
									    <li class="list-group-item border-0" data-value="90000">90,000km 이하</li>
									    <li class="list-group-item border-0" data-value="100000">100,000km 이하</li>
									    <li class="list-group-item border-0" data-value="100000_plus">100,000km 이상</li>
									</ul>
			                    </div>
			                </div>
			            </div>
			            <div class="accordion-item">
			                <h2 class="accordion-header" id="headingArea">
			                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseArea" aria-expanded="false" aria-controls="collapseArea">
			                        판매지역
			                    </button>
			                </h2>
			                <div id="collapseArea" class="accordion-collapse collapse" aria-labelledby="headingArea" data-bs-parent="#accordionExample">
			                    <div class="accordion-body">
			                        <ul class="list-group overflow-auto" style="max-height: 200px;" id="carea" data-type="carea">
									    <li class="list-group-item border-0" data-value="서울 강남구">서울 강남구</li>
									    <li class="list-group-item border-0" data-value="서울 강동구">서울 강동구</li>
									    <li class="list-group-item border-0" data-value="서울 강북구">서울 강북구</li>
									    <li class="list-group-item border-0" data-value="서울 강서구">서울 강서구</li>
									    <li class="list-group-item border-0" data-value="서울 관악구">서울 관악구</li>
									    <li class="list-group-item border-0" data-value="서울 광진구">서울 광진구</li>
									    <li class="list-group-item border-0" data-value="서울 구로구">서울 구로구</li>
									    <li class="list-group-item border-0" data-value="서울 금천구">서울 금천구</li>
									    <li class="list-group-item border-0" data-value="서울 노원구">서울 노원구</li>
									    <li class="list-group-item border-0" data-value="서울 도봉구">서울 도봉구</li>
									    <li class="list-group-item border-0" data-value="서울 동대문구">서울 동대문구</li>
									    <li class="list-group-item border-0" data-value="서울 동작구">서울 동작구</li>
									    <li class="list-group-item border-0" data-value="서울 마포구">서울 마포구</li>
									    <li class="list-group-item border-0" data-value="서울 서대문구">서울 서대문구</li>
									    <li class="list-group-item border-0" data-value="서울 서초구">서울 서초구</li>
									    <li class="list-group-item border-0" data-value="서울 성동구">서울 성동구</li>
									    <li class="list-group-item border-0" data-value="서울 성북구">서울 성북구</li>
									    <li class="list-group-item border-0" data-value="서울 송파구">서울 송파구</li>
									    <li class="list-group-item border-0" data-value="서울 양천구">서울 양천구</li>
									    <li class="list-group-item border-0" data-value="서울 영등포구">서울 영등포구</li>
									    <li class="list-group-item border-0" data-value="서울 용산구">서울 용산구</li>
									    <li class="list-group-item border-0" data-value="서울 은평구">서울 은평구</li>
									    <li class="list-group-item border-0" data-value="서울 종로구">서울 종로구</li>
									    <li class="list-group-item border-0" data-value="서울 중구">서울 중구</li>
									    <li class="list-group-item border-0" data-value="서울 중랑구">서울 중랑구</li>
									    <li class="list-group-item border-0" data-value="경기 가평군">경기 가평군</li>
									    <li class="list-group-item border-0" data-value="경기 고양시">경기 고양시</li>
									    <li class="list-group-item border-0" data-value="경기 과천시">경기 과천시</li>
									    <li class="list-group-item border-0" data-value="경기 광명시">경기 광명시</li>
									    <li class="list-group-item border-0" data-value="경기 광주시">경기 광주시</li>
									    <li class="list-group-item border-0" data-value="경기 구리시">경기 구리시</li>
									    <li class="list-group-item border-0" data-value="경기 군포시">경기 군포시</li>
									    <li class="list-group-item border-0" data-value="경기 김포시">경기 김포시</li>
									    <li class="list-group-item border-0" data-value="경기 남양주시">경기 남양주시</li>
									    <li class="list-group-item border-0" data-value="경기 동두천시">경기 동두천시</li>
									    <li class="list-group-item border-0" data-value="경기 부천시">경기 부천시</li>
									    <li class="list-group-item border-0" data-value="경기 성남시">경기 성남시</li>
									    <li class="list-group-item border-0" data-value="경기 수원시">경기 수원시</li>
									    <li class="list-group-item border-0" data-value="경기 시흥시">경기 시흥시</li>
									    <li class="list-group-item border-0" data-value="경기 안산시">경기 안산시</li>
									    <li class="list-group-item border-0" data-value="경기 안성시">경기 안성시</li>
									    <li class="list-group-item border-0" data-value="경기 안양시">경기 안양시</li>
									    <li class="list-group-item border-0" data-value="경기 양주시">경기 양주시</li>
									    <li class="list-group-item border-0" data-value="경기 양평군">경기 양평군</li>
									    <li class="list-group-item border-0" data-value="경기 여주시">경기 여주시</li>
									    <li class="list-group-item border-0" data-value="경기 연천군">경기 연천군</li>
									    <li class="list-group-item border-0" data-value="경기 오산시">경기 오산시</li>
									    <li class="list-group-item border-0" data-value="경기 용인시">경기 용인시</li>
									    <li class="list-group-item border-0" data-value="경기 의왕시">경기 의왕시</li>
									    <li class="list-group-item border-0" data-value="경기 의정부시">경기 의정부시</li>
									    <li class="list-group-item border-0" data-value="경기 이천시">경기 이천시</li>
									    <li class="list-group-item border-0" data-value="경기 파주시">경기 파주시</li>
									    <li class="list-group-item border-0" data-value="경기 평택시">경기 평택시</li>
									    <li class="list-group-item border-0" data-value="경기 포천시">경기 포천시</li>
									    <li class="list-group-item border-0" data-value="경기 하남시">경기 하남시</li>
									    <li class="list-group-item border-0" data-value="경기 화성시">경기 화성시</li>
									</ul>
			                    </div>
			                </div>
			            </div>
			            <div class="accordion-item">
			                <h2 class="accordion-header" id="headingColor">
			                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseColor" aria-expanded="false" aria-controls="collapseColor">
			                        색상
			                    </button>
			                </h2>
			                <div id="collapseColor" class="accordion-collapse collapse" aria-labelledby="headingColor" data-bs-parent="#accordionExample">
			                    <div class="accordion-body">
			                       <ul class="list-group overflow-auto" style="max-height: 200px;" id="ccolor" data-type="ccolor">
									    <li class="list-group-item border-0" data-value="흰색">흰색</li>
									    <li class="list-group-item border-0" data-value="검정색">검정색</li>
									    <li class="list-group-item border-0" data-value="회색">회색</li>
									    <li class="list-group-item border-0" data-value="빨간색">빨간색</li>
									    <li class="list-group-item border-0" data-value="파란색">파란색</li>
									    <li class="list-group-item border-0" data-value="초록색">초록색</li>
									    <li class="list-group-item border-0" data-value="노란색">노란색</li>
									    <li class="list-group-item border-0" data-value="주황색">주황색</li>
									</ul>
			                    </div>
			                </div>
			            </div>
			            <div class="accordion-item">
			                <h2 class="accordion-header" id="headingFuelType">
			                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFuelType" aria-expanded="false" aria-controls="collapseFuelType">
			                        연료 종류
			                    </button>
			                </h2>
			                <div id="collapseFuelType" class="accordion-collapse collapse" aria-labelledby="headingFuelType" data-bs-parent="#accordionExample">
			                    <div class="accordion-body">
			                        <ul class="list-group overflow-auto" style="max-height: 200px;" id="cfuelType" data-type="cfuelType">
								    <li class="list-group-item border-0" data-value="휘발유">휘발유</li>
								    <li class="list-group-item border-0" data-value="경유">경유</li>
								    <li class="list-group-item border-0" data-value="전기">전기</li>
								    <li class="list-group-item border-0" data-value="하이브리드">하이브리드</li>
								</ul>
			                    </div>
			                </div>
			            </div>
			            <div class="accordion-item">
			                <h2 class="accordion-header" id="headingTransmission">
			                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTransmission" aria-expanded="false" aria-controls="collapseTransmission">
			                        변속기
			                    </button>
			                </h2>
			                <div id="collapseTransmission" class="accordion-collapse collapse" aria-labelledby="headingTransmission" data-bs-parent="#accordionExample">
			                    <div class="accordion-body">
			                        <ul class="list-group overflow-auto" style="max-height: 200px;" id="ctransmission" data-type="ctransmission">
									    <li class="list-group-item border-0" data-value="오토">오토</li>
									    <li class="list-group-item border-0" data-value="수동">수동</li>
									</ul>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			
				<!-- 테이블 -->
				<div class="col-10">
					<table class="table table-hover">
						<thead>
							<tr class="table-dark">
								<th colspan="2">차량정보</th>
								<th>가격</th>
								<th>판매자</th>
							</tr>
						</thead>
						<tbody class="text-secondary" id="usedCarList">
							<!-- 검색이면서 게시 글이 있는 경우 -->
							<c:if test="${ searchOption and not empty tradeBoardList }">
								<c:forEach var="t" items="${tradeBoardList}" varStatus="status">
									<tr>			
										<td><img src="./resources/upload/${ t.cimg }" style="width:100px;"></td>
										<%-- <td><img src="${ t.cimg }"></td> --%>
										<td><h5><a href="TradeBoardDetail?ucno=${ t.ucno }&pageNum=${currentPage}&type=${ type }&keyword=${ keyword }" class="text-decoration-none link-secondary">${ t.cmanufacturer } ${ t.cname }</a></h5>
											<pre>${ t.cyear }년식 | ${ t.cmileage }km | ${ t.carea } | ${ t.ccolor }
${ t.cshortment }</pre>
										
										</td>
										<td><fmt:formatNumber value="${( t.cprice / 10000 ) }" type="number" maxFractionDigits="0" /> 만원</td>
										<td>${ t.cseller }</td>
									</tr>
								</c:forEach>
							</c:if>		
							<!-- 검색이 아니면서 게시 글이 있는 경우 -->
							<c:if test="${ not searchOption and not empty tradeBoardList }">
								<c:forEach var="t" items="${tradeBoardList}" varStatus="status">
									<tr>			
										<td><img src="./resources/upload/${ t.cimg }" style="width:100px;"></td>
										<%-- <td><img src="${ t.cimg }"></td> --%>
										<td><h5><a href="TradeBoardDetail?ucno=${ t.ucno }&pageNum=${currentPage}" class="text-decoration-none link-secondary">${ t.cmanufacturer } ${ t.cname }</a></h5>
											<pre>${ t.cyear }년식 | ${ t.cmileage }km | ${ t.carea } | ${ t.ccolor }
${ t.cshortment }</pre>
										
										</td>
										<td><fmt:formatNumber value="${( t.cprice / 10000 ) }" type="number" maxFractionDigits="0" /> 만원</td>
										<td>${ t.cseller }</td>
									</tr>
								</c:forEach>
							</c:if>													
							<!-- 검색요청이면서 게시 글이 없는 경우 -->
							<c:if test="${ searchOption and empty tradeBoardList }">
								<tr>
									<td colspan="5" class="text-center">${ keyword }로 검색된 차량이 없습니다.</td>
								</tr>
							</c:if>
							<!-- 게시 글이 없는 경우 -->
							<c:if test="${ not searchOption and empty tradeBoardList }">
								<tr>
									<td colspan="5" class="text-center">등록된 차량이 없습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row" id="pageNavigation">
			<!-- 검색 요청이면서 검색된 리스트가 존재할 경우 페이지네이션 -->
			<c:if test="${ searchOption and not empty tradeBoardList }">
			<div class="row">
				<div class="col">
					<nav aria-label="Page navigation">
					  <ul class="pagination justify-content-center">
					  	<c:if test="${ startPage > pageGroup }">
						    <li class="page-item">
						      <a class="page-link" href="used_car_board?pageNum=${ startPage - pageGroup }&type=${ type }&keyword=${ keyword }">Pre</a>
						    </li>
					    </c:if>
					    <c:forEach var="i" begin="${ startPage }" end="${ endPage }">
					    <c:if test="${ i == currentPage }">
					    <li class="page-item active" aria-current="page">
					    	<span class="page-link">${ i }</span>
					    </li>
					    </c:if>
					    <c:if test="${ i != currentPage }">
					    	<li class="page-item">
					    		<a class="page-link" href="used_car_board?pageNum=${ i }&type=${ type }&keyword=${ keyword }">${i}</a>
					    	</li>
					    	</c:if>
					    	</c:forEach>
					    	<c:if test="${ endPage < pageCount }">
						<li class="page-item">
					      <a class="page-link" href="used_car_board?pageNum=${ startPage + pageGroup }&type=${ type }&keyword=${ keyword }">Next</a>
					    </li>
					    </c:if>
					  </ul>
					</nav>
				</div>
			</div>
			</c:if>
			<!-- 일반 게시글 요청이면서 검색된 리스트가 존재할 경우 페이지네이션 -->
			<c:if test="${ not searchOption and not empty tradeBoardList }">
			<div class="row">
				<div class="col">
					<nav aria-label="Page navigation">
					  <ul class="pagination justify-content-center">
					  	<c:if test="${ startPage > pageGroup }">
						    <li class="page-item">
						      <a class="page-link" href="used_car_board?pageNum=${ startPage - pageGroup }">Pre</a>
						    </li>
					    </c:if>
					    <c:forEach var="i" begin="${ startPage }" end="${ endPage }">
					    <c:if test="${ i == currentPage }">
					    <li class="page-item active" aria-current="page">
					    	<span class="page-link">${ i }</span>
					    </li>
					    </c:if>
					    <c:if test="${ i != currentPage }">
					    	<li class="page-item">
					    		<a class="page-link" href="used_car_board?pageNum=${ i }">${i}</a>
					    	</li>
					    	</c:if>
					    	</c:forEach>
					    	<c:if test="${ endPage < pageCount }">
						<li class="page-item">
					      <a class="page-link" href="used_car_board?pageNum=${ startPage + pageGroup }">Next</a>
					    </li>
					    </c:if>
					  </ul>
					</nav>
				</div>
			</div>
			</c:if>
			</div>
		</div>
	</div>
</body>
</html>