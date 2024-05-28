<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row">
	<div class="container mt-5">
		<h2 class="mb-4">수정할 중고차 정보 입력</h2>
		<form action="tradeUpdateProcess" method="post" id="registForm" name="registForm">
			<input type="hidden" name="ucno" value="${ trade.ucno }">
			<input type="hidden" name="pageNum" value="${ pageNum }">
			<c:if test="${ searchOption }">
				<input type="hidden" name="type" value="${ type }" />
				<input type="hidden" name="keyword" value="${ keyword }" />
			</c:if>
			<div class="row">
				<div class="col-md-6">		
					<div class="form-group">
						<label for="cname">차량명:</label>
						<input type="text" class="form-control" id="cname" name="cname" value="${ trade.cname }">
					</div>
					<div class="form-group">
						<label for="cnumber">차량 번호:</label>
						<input type="text" class="form-control" id="cnumber" name="cnumber" value="${ trade.cnumber }">
						<small id="cnumberHelp" class="form-text"></small>
					</div>
					<div class="form-group">
					    <label for="cmanufacturer">제조사:</label>
					    <select class="form-control" id="cmanufacturer" name="cmanufacturer">
					        <option value="" ${trade.cmanufacturer == '' ? 'selected' : ''}>제조사 선택</option>
					        <option value="BMW" ${trade.cmanufacturer == 'BMW' ? 'selected' : ''}>BMW</option>
					        <option value="GM" ${trade.cmanufacturer == 'GM' ? 'selected' : ''}>GM</option>
					        <option value="기아" ${trade.cmanufacturer == '기아' ? 'selected' : ''}>기아</option>
					        <option value="도요타" ${trade.cmanufacturer == '도요타' ? 'selected' : ''}>도요타</option>
					        <option value="람보르기니" ${trade.cmanufacturer == '람보르기니' ? 'selected' : ''}>람보르기니</option>
					        <option value="렉서스" ${trade.cmanufacturer == '렉서스' ? 'selected' : ''}>렉서스</option>
					        <option value="마쯔다" ${trade.cmanufacturer == '마쯔다' ? 'selected' : ''}>마쯔다</option>
					        <option value="미쓰비시" ${trade.cmanufacturer == '미쓰비시' ? 'selected' : ''}>미쓰비시</option>
					        <option value="벤츠" ${trade.cmanufacturer == '벤츠' ? 'selected' : ''}>벤츠</option>
					        <option value="볼보" ${trade.cmanufacturer == '볼보' ? 'selected' : ''}>볼보</option>
					        <option value="수바루" ${trade.cmanufacturer == '수바루' ? 'selected' : ''}>수바루</option>
					        <option value="쉐보레" ${trade.cmanufacturer == '쉐보레' ? 'selected' : ''}>쉐보레</option>
					        <option value="아우디" ${trade.cmanufacturer == '아우디' ? 'selected' : ''}>아우디</option>
					        <option value="재규어" ${trade.cmanufacturer == '재규어' ? 'selected' : ''}>재규어</option>
					        <option value="테슬라" ${trade.cmanufacturer == '테슬라' ? 'selected' : ''}>테슬라</option>
					        <option value="폭스바겐" ${trade.cmanufacturer == '폭스바겐' ? 'selected' : ''}>폭스바겐</option>
					        <option value="포드" ${trade.cmanufacturer == '포드' ? 'selected' : ''}>포드</option>
					        <option value="포르쉐" ${trade.cmanufacturer == '포르쉐' ? 'selected' : ''}>포르쉐</option>
					        <option value="페라리" ${trade.cmanufacturer == '페라리' ? 'selected' : ''}>페라리</option>
					        <option value="혼다" ${trade.cmanufacturer == '혼다' ? 'selected' : ''}>혼다</option>
					        <option value="현대" ${trade.cmanufacturer == '현대' ? 'selected' : ''}>현대</option>
					        <option value="닛산" ${trade.cmanufacturer == '닛산' ? 'selected' : ''}>닛산</option>
					    </select>
					</div>

					<div class="form-group">
						<label for="cimg">상품이미지:</label>
						<input type="file" class="form-control" id="cimg" name="cimg">
						<img src="./resources/upload/${ trade.cnumber }">
					</div>
					<div class="form-group">
						<label for="cyear">연식:</label>
						<select class="form-control" id="cyear" name="cyear">
							<option value="" ${trade.cyear == '' ? 'selected' : ''}>연식 선택</option>
							<option value="2024" ${trade.cyear == '2024' ? 'selected' : ''}>2024</option>
							<option value="2023" ${trade.cyear == '2023' ? 'selected' : ''}>2023</option>
							<option value="2022" ${trade.cyear == '2022' ? 'selected' : ''}>2022</option>
							<option value="2021" ${trade.cyear == '2021' ? 'selected' : ''}>2021</option>
							<option value="2020" ${trade.cyear == '2020' ? 'selected' : ''}>2020</option>
							<option value="2019" ${trade.cyear == '2019' ? 'selected' : ''}>2019</option>
							<option value="2018" ${trade.cyear == '2018' ? 'selected' : ''}>2018</option>
							<option value="2017" ${trade.cyear == '2017' ? 'selected' : ''}>2017</option>
							<option value="2016" ${trade.cyear == '2016' ? 'selected' : ''}>2016</option>
							<option value="2015" ${trade.cyear == '2015' ? 'selected' : ''}>2015</option>
							<option value="2014" ${trade.cyear == '2014' ? 'selected' : ''}>2014</option>
							<option value="2013" ${trade.cyear == '2013' ? 'selected' : ''}>2013</option>
							<option value="2012" ${trade.cyear == '2012' ? 'selected' : ''}>2012</option>
							<option value="2011" ${trade.cyear == '2011' ? 'selected' : ''}>2011</option>
							<option value="2010" ${trade.cyear == '2010' ? 'selected' : ''}>2010</option>
							<option value="2009" ${trade.cyear == '2009' ? 'selected' : ''}>2009</option>
							<option value="2008" ${trade.cyear == '2008' ? 'selected' : ''}>2008</option>
							<option value="2007" ${trade.cyear == '2007' ? 'selected' : ''}>2007</option>
							<option value="2006" ${trade.cyear == '2006' ? 'selected' : ''}>2006</option>
							<option value="2005" ${trade.cyear == '2005' ? 'selected' : ''}>2005</option>
							<option value="2004" ${trade.cyear == '2004' ? 'selected' : ''}>2004</option>
							<option value="2003" ${trade.cyear == '2003' ? 'selected' : ''}>2003</option>
							<option value="2002" ${trade.cyear == '2002' ? 'selected' : ''}>2002</option>
							<option value="2001" ${trade.cyear == '2001' ? 'selected' : ''}>2001</option>
							<option value="2000" ${trade.cyear == '2000' ? 'selected' : ''}>2000</option>
							<option value="1999" ${trade.cyear == '1999' ? 'selected' : ''}>1999</option>
							<option value="1998" ${trade.cyear == '1998' ? 'selected' : ''}>1998</option>
							<option value="1997" ${trade.cyear == '1997' ? 'selected' : ''}>1997</option>
							<option value="1996" ${trade.cyear == '1996' ? 'selected' : ''}>1996</option>
							<option value="1995" ${trade.cyear == '1995' ? 'selected' : ''}>1995</option>
							<option value="1994" ${trade.cyear == '1994' ? 'selected' : ''}>1994</option>
							<option value="1993" ${trade.cyear == '1993' ? 'selected' : ''}>1993</option>
							<option value="1992" ${trade.cyear == '1992' ? 'selected' : ''}>1992</option>
							<option value="1991" ${trade.cyear == '1991' ? 'selected' : ''}>1991</option>
							<option value="1990" ${trade.cyear == '1990' ? 'selected' : ''}>1990</option>
						</select>
					</div>
					<div class="form-group">
					    <label for="cmileage">주행 거리:</label>
					    <input type="text" class="form-control" id="cmileage" name="cmileage" pattern="[0-9]+" title="숫자만 입력하세요." 
					           value="${trade.cmileage}">Km
					</div>
					<div class="form-group">
						<label for="carea">지역:</label>
						<select class="form-control" id="carea" name="carea">
							<option value="">지역 선택</option>
							<optgroup label="서울특별시">
								<option value="서울 강남구" ${trade.carea == '서울 강남구' ? 'selected' : ''}>강남구</option>
								<option value="서울 강동구" ${trade.carea == '서울 강동구' ? 'selected' : ''}>강동구</option>
								<option value="서울 강북구" ${trade.carea == '서울 강북구' ? 'selected' : ''}>강북구</option>
								<option value="서울 강서구" ${trade.carea == '서울 강서구' ? 'selected' : ''}>강서구</option>
								<option value="서울 관악구" ${trade.carea == '서울 관악구' ? 'selected' : ''}>관악구</option>
								<option value="서울 광진구" ${trade.carea == '서울 광진구' ? 'selected' : ''}>광진구</option>
								<option value="서울 구로구" ${trade.carea == '서울 구로구' ? 'selected' : ''}>구로구</option>
								<option value="서울 금천구" ${trade.carea == '서울 금천구' ? 'selected' : ''}>금천구</option>
								<option value="서울 노원구" ${trade.carea == '서울 노원구' ? 'selected' : ''}>노원구</option>
								<option value="서울 도봉구" ${trade.carea == '서울 도봉구' ? 'selected' : ''}>도봉구</option>
								<option value="서울 동대문구" ${trade.carea == '서울 동대문구' ? 'selected' : ''}>동대문구</option>
								<option value="서울 동작구" ${trade.carea == '서울 동작구' ? 'selected' : ''}>동작구</option>
								<option value="서울 마포구" ${trade.carea == '서울 마포구' ? 'selected' : ''}>마포구</option>
								<option value="서울 서대문구" ${trade.carea == '서울 서대문구' ? 'selected' : ''}>서대문구</option>
								<option value="서울 서초구" ${trade.carea == '서울 서초구' ? 'selected' : ''}>서초구</option>
								<option value="서울 성동구" ${trade.carea == '서울 성동구' ? 'selected' : ''}>성동구</option>
								<option value="서울 성북구" ${trade.carea == '서울 성북구' ? 'selected' : ''}>성북구</option>
								<option value="서울 송파구" ${trade.carea == '서울 송파구' ? 'selected' : ''}>송파구</option>
								<option value="서울 양천구" ${trade.carea == '서울 양천구' ? 'selected' : ''}>양천구</option>
								<option value="서울 영등포구" ${trade.carea == '서울 영등포구' ? 'selected' : ''}>영등포구</option>
								<option value="서울 용산구" ${trade.carea == '서울 용산구' ? 'selected' : ''}>용산구</option>
								<option value="서울 은평구" ${trade.carea == '서울 은평구' ? 'selected' : ''}>은평구</option>
								<option value="서울 종로구" ${trade.carea == '서울 종로구' ? 'selected' : ''}>종로구</option>
								<option value="서울 중구" ${trade.carea == '서울 중구' ? 'selected' : ''}>중구</option>
								<option value="서울 중랑구" ${trade.carea == '서울 중랑구' ? 'selected' : ''}>중랑구</option>
							</optgroup>
							<optgroup label="경기도">
								<option value="경기 가평군" ${trade.carea == '경기 가평군' ? 'selected' : ''}>가평군</option>
								<option value="경기 고양시" ${trade.carea == '경기 고양시' ? 'selected' : ''}>고양시</option>
								<option value="경기 과천시" ${trade.carea == '경기 과천시' ? 'selected' : ''}>과천시</option>
								<option value="경기 광명시" ${trade.carea == '경기 광명시' ? 'selected' : ''}>광명시</option>
								<option value="경기 광주시" ${trade.carea == '경기 광주시' ? 'selected' : ''}>광주시</option>
								<option value="경기 구리시" ${trade.carea == '경기 구리시' ? 'selected' : ''}>구리시</option>
								<option value="경기 군포시" ${trade.carea == '경기 군포시' ? 'selected' : ''}>군포시</option>
								<option value="경기 김포시" ${trade.carea == '경기 김포시' ? 'selected' : ''}>김포시</option>
								<option value="경기 남양주시" ${trade.carea == '경기 남양주시' ? 'selected' : ''}>남양주시</option>
								<option value="경기 동두천시" ${trade.carea == '경기 동두천시' ? 'selected' : ''}>동두천시</option>
								<option value="경기 부천시" ${trade.carea == '경기 부천시' ? 'selected' : ''}>부천시</option>
								<option value="경기 성남시" ${trade.carea == '경기 성남시' ? 'selected' : ''}>성남시</option>
								<option value="경기 수원시" ${trade.carea == '경기 수원시' ? 'selected' : ''}>수원시</option>
								<option value="경기 시흥시" ${trade.carea == '경기 시흥시' ? 'selected' : ''}>시흥시</option>
								<option value="경기 안산시" ${trade.carea == '경기 안산시' ? 'selected' : ''}>안산시</option>
								<option value="경기 안성시" ${trade.carea == '경기 안성시' ? 'selected' : ''}>안성시</option>
								<option value="경기 안양시" ${trade.carea == '경기 안양시' ? 'selected' : ''}>안양시</option>
								<option value="경기 양주시" ${trade.carea == '경기 양주시' ? 'selected' : ''}>양주시</option>
								<option value="경기 양평군" ${trade.carea == '경기 양평군' ? 'selected' : ''}>양평군</option>
								<option value="경기 여주시" ${trade.carea == '경기 여주시' ? 'selected' : ''}>여주시</option>
								<option value="경기 연천군" ${trade.carea == '경기 연천군' ? 'selected' : ''}>연천군</option>
								<option value="경기 오산시" ${trade.carea == '경기 오산시' ? 'selected' : ''}>오산시</option>
								<option value="경기 용인시" ${trade.carea == '경기 용인시' ? 'selected' : ''}>용인시</option>
								<option value="경기 의왕시" ${trade.carea == '경기 의왕시' ? 'selected' : ''}>의왕시</option>
								<option value="경기 의정부시" ${trade.carea == '경기 의정부시' ? 'selected' : ''}>의정부시</option>
								<option value="경기 이천시" ${trade.carea == '경기 이천시' ? 'selected' : ''}>이천시</option>
								<option value="경기 파주시" ${trade.carea == '경기 파주시' ? 'selected' : ''}>파주시</option>
								<option value="경기 평택시" ${trade.carea == '경기 평택시' ? 'selected' : ''}>평택시</option>
								<option value="경기 포천시" ${trade.carea == '경기 포천시' ? 'selected' : ''}>포천시</option>
								<option value="경기 하남시" ${trade.carea == '경기 하남시' ? 'selected' : ''}>하남시</option>
								<option value="경기 화성시" ${trade.carea == '경기 화성시' ? 'selected' : ''}>화성시</option>
							</optgroup>
						</select>
					</div>
					<div class="form-group">
						<label for="cprice">가격(만원):</label>
						<input type="text" class="form-control" id="cprice" name="cprice" value="${trade.cprice}">
					</div>
					<div class="form-group">
						<label for="cshortment">짧은 설명:</label>
						<input type="text" class="form-control" id="cshortment" name="cshortment" value="${trade.cshortment}">
					</div>
				</div>
				<div class="col-md-6">				
					<div class="form-group">
						<label for="cseller">판매자:</label>
						<input type="text" class="form-control" id="cseller" name="cseller" value="${trade.cseller}">
					</div>

						<c:set var="csellerContact" value="${trade.csellerContact}" />
							<c:choose>
							    <c:when test="${not empty csellerContact}">
							        <c:set var="contactParts" value="${fn:split(csellerContact, '-')}" />
							    </c:when>
							    <c:otherwise>
							        <c:set var="contactParts" value="{ '', '', '' }" />
							    </c:otherwise>
							</c:choose>
							
							<div class="form-group">
							    <label for="cseller_contact">판매자 연락처:</label><br>
							    <div class="input-group">
							        <input type="text" class="form-control" id="cseller_contact1" name="cseller_contact1" maxlength="3" pattern="[0-9]{3}" placeholder="010" value="${contactParts[0]}">
							        <div class="input-group-prepend input-group-append">
							            <span class="input-group-text">-</span>
							        </div>
							        <input type="text" class="form-control" id="cseller_contact2" name="cseller_contact2" maxlength="4" pattern="[0-9]{4}" placeholder="1234" value="${contactParts[1]}">
							        <div class="input-group-prepend input-group-append">
							            <span class="input-group-text">-</span>
							        </div>
							        <input type="text" class="form-control" id="cseller_contact3" name="cseller_contact3" maxlength="4" pattern="[0-9]{4}" placeholder="5678" value="${contactParts[2]}">
							    </div>
							    <small class="form-text text-muted">연락처는 숫자만 입력하세요. 예: 010-1234-5678</small>
							</div>
					<div class="form-group">
						<label for="ccomment">상세 설명:</label>
						<textarea class="form-control" id="ccomment" name="ccomment" rows="5">${trade.ccomment}</textarea>
					</div>
					<div class="form-group">
						<label for="ccolor">차량 색상:</label>
						<select class="form-control" id="ccolor" name="ccolor">
							<option value="" ${trade.ccolor == '' ? 'selected' : ''}>색상 선택</option>
							<option value="흰색" ${trade.ccolor == '흰색' ? 'selected' : ''}>흰색</option>
							<option value="검정색" ${trade.ccolor == '검정색' ? 'selected' : ''}>검정색</option>
							<option value="회색" ${trade.ccolor == '회색' ? 'selected' : ''}>회색</option>
							<option value="빨간색" ${trade.ccolor == '빨간색' ? 'selected' : ''}>빨간색</option>
							<option value="파란색" ${trade.ccolor == '파란색' ? 'selected' : ''}>파란색</option>
							<option value="초록색" ${trade.ccolor == '초록색' ? 'selected' : ''}>초록색</option>
							<option value="노란색" ${trade.ccolor == '노란색' ? 'selected' : ''}>노란색</option>
							<option value="주황색" ${trade.ccolor == '주황색' ? 'selected' : ''}>주황색</option>
						</select>
					</div>
					<div class="form-group">
						<label for="cfuel_type">연료 종류:</label>
						<select class="form-control" id="cfuelType" name="cfuelType">
							<option value="" ${trade.cfuelType == '' ? 'selected' : ''}>연료 종류 선택</option>
							<option value="휘발유" ${trade.cfuelType == '휘발유' ? 'selected' : ''}>휘발유</option>
							<option value="경유" ${trade.cfuelType == '경유' ? 'selected' : ''}>경유</option>
							<option value="전기" ${trade.cfuelType == '전기' ? 'selected' : ''}>전기</option>
							<option value="하이브리드" ${trade.cfuelType == '하이브리드' ? 'selected' : ''}>하이브리드</option>
						</select>
					</div>
					<div class="form-group">
						<label for="ctransmission">변속기:</label>
						<select class="form-control" id="ctransmission" name="ctransmission">
							<option value="" ${trade.ctransmission == '' ? 'selected' : ''}>변속기 종류 선택</option>
							<option value="오토" ${trade.ctransmission == '오토' ? 'selected' : ''}>오토</option>
							<option value="수동" ${trade.ctransmission == '수동' ? 'selected' : ''}>수동</option>
						</select>
					</div>
					<div class="form-group">
						<label for="ccondition">차량 상태:</label>
						<input type="text" class="form-control" id="ccondition" name="ccondition" value="${trade.ccondition}">
					</div>
				</div>	
				<div class="form-group">
						<button type="submit" class="btn btn-primary">수정</button>
						<c:if test="${ not searchOption }">
							<button type="button" class="btn btn-primary" onclick="location.href='used_car_board?pageNum=${pageNum}'">목록</button>
						</c:if>
						<c:if test="${ searchOption }">
							<button type="button" class="btn btn-primary" onclick="location.href='used_car_board?pageNum=${pageNum}&type=${type}&keyword=${ keyword }'">목록</button>
						</c:if>
						</div>
			</div>

		</form>
	</div>
</div>
</body>
</html>