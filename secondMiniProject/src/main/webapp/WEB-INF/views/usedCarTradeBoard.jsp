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
			<div class="row">
				<div class="col text-end">
					<a href="registcar" class="btn btn-outline-success">차량 등록하기</a>
				</div>
			</div>
			<div class="row my-3">
				<div class="col">
					<table class="table table-hover">
						<thead>
							<tr class="table-dark">
								<th colspan="2">차량정보</th>
								<th>가격</th>
								<th>판매자</th>
							</tr>
						</thead>
						<tbody class="text-secondary align-itmes-center">
							<!-- 게시 글이 있는 경우 -->
							<c:if test="${ not empty tList }">
								<c:forEach var="t" items="${tList}">
									<tr>			
										<td><img src="./resources/images/Ford_Focus.jpeg" style="width:200px;"></td>
										<%-- <td><img src="${ t.cimg }"></td> --%>
										<td><h5><a href="TradeBoardDetail?ucno=${ t.ucno }">${ t.cname }</a></h5>
											<pre>${ t.cyear }년식 | ${ t.cmileage }km | ${ t.carea }
${ t.cshortment }</pre>
										
										</td>
										<td><fmt:formatNumber value="${( t.cprice / 10000 ) }" type="number" maxFractionDigits="0" /> 만원</td>
										<td>${ t.cseller }</td>
									</tr>
								</c:forEach>
							</c:if>							
							<!-- 게시 글이 없는 경우 -->
							<c:if test="${ empty tList }">
								<tr>
									<td colspan="5" class="text-center">등록된 차량이 없습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>