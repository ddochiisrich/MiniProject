<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row">
	<div class="container mt-5">
		<h2 class="mb-4">판매할 중고차 정보 입력</h2>
		<form action="registProcess" method="post" id="registForm" name="registForm">
			<div class="row">
				<div class="col-md-6">		
					<div class="form-group">
						<label for="cname">차량명:</label>
						<input type="text" class="form-control" id="cname" name="cname">
					</div>
					<div class="form-group">
						<label for="cnumber">차량 번호:</label>
						<input type="text" class="form-control" id="cnumber" name="cnumber">
						<small id="cnumberHelp" class="form-text"></small>
					</div>
					<div class="form-group">
						<label for="cmanufacturer">제조사:</label>
						<select class="form-control" id="cmanufacturer" name="cmanufacturer">
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
					<div class="form-group">
						<label for="cimg">상품이미지:</label>
						<input type="file" class="form-control" id="cimg" name="cimg">
					</div>
					<div class="form-group">
						<label for="cyear">연식:</label>
						<select class="form-control" id="cyear" name="cyear">
							<option value="">연식 선택</option>
							<option value="2024">2024</option>
							<option value="2023">2023</option>
							<option value="2022">2022</option>
							<option value="2021">2021</option>
							<option value="2020">2020</option>
							<option value="2019">2019</option>
							<option value="2018">2018</option>
							<option value="2017">2017</option>
							<option value="2016">2016</option>
							<option value="2015">2015</option>
							<option value="2014">2014</option>
							<option value="2013">2013</option>
							<option value="2012">2012</option>
							<option value="2011">2011</option>
							<option value="2010">2010</option>
							<option value="2009">2009</option>
							<option value="2008">2008</option>
							<option value="2007">2007</option>
							<option value="2006">2006</option>
							<option value="2005">2005</option>
							<option value="2004">2004</option>
							<option value="2003">2003</option>
							<option value="2002">2002</option>
							<option value="2001">2001</option>
							<option value="2000">2000</option>
							<option value="1999">1999</option>
							<option value="1998">1998</option>
							<option value="1997">1997</option>
							<option value="1996">1996</option>
							<option value="1995">1995</option>
							<option value="1994">1994</option>
							<option value="1993">1993</option>
							<option value="1992">1992</option>
							<option value="1991">1991</option>
							<option value="1990">1990</option>
						</select>
					</div>
					<div class="form-group">
						<label for="cmileage">주행 거리:</label>
						<input type="text" class="form-control" id="cmileage" name="cmileage" pattern="[0-9]+" title="숫자만 입력하세요.">Km
					</div>
					<div class="form-group">
						<label for="carea">지역:</label>
						<select class="form-control" id="carea" name="carea">
							<option value="">지역 선택</option>
							<optgroup label="서울특별시">
								<option value="서울 강남구">강남구</option>
								<option value="서울 강동구">강동구</option>
								<option value="서울 강북구">강북구</option>
								<option value="서울 강서구">강서구</option>
								<option value="서울 관악구">관악구</option>
								<option value="서울 광진구">광진구</option>
								<option value="서울 구로구">구로구</option>
								<option value="서울 금천구">금천구</option>
								<option value="서울 노원구">노원구</option>
								<option value="서울 도봉구">도봉구</option>
								<option value="서울 동대문구">동대문구</option>
								<option value="서울 동작구">동작구</option>
								<option value="서울 마포구">마포구</option>
								<option value="서울 서대문구">서대문구</option>
								<option value="서울 서초구">서초구</option>
								<option value="서울 성동구">성동구</option>
								<option value="서울 성북구">성북구</option>
								<option value="서울 송파구">송파구</option>
								<option value="서울 양천구">양천구</option>
								<option value="서울 영등포구">영등포구</option>
								<option value="서울 용산구">용산구</option>
								<option value="서울 은평구">은평구</option>
								<option value="서울 종로구">종로구</option>
								<option value="서울 중구">중구</option>
								<option value="서울 중랑구">중랑구</option>
							</optgroup>
							<optgroup label="경기도">
								<option value="경기 가평군">가평군</option>
								<option value="경기 고양시">고양시</option>
								<option value="경기 과천시">과천시</option>
								<option value="경기 광명시">광명시</option>
								<option value="경기 광주시">광주시</option>
								<option value="경기 구리시">구리시</option>
								<option value="경기 군포시">군포시</option>
								<option value="경기 김포시">김포시</option>
								<option value="경기 남양주시">남양주시</option>
								<option value="경기 동두천시">동두천시</option>
								<option value="경기 부천시">부천시</option>
								<option value="경기 성남시">성남시</option>
								<option value="경기 수원시">수원시</option>
								<option value="경기 시흥시">시흥시</option>
								<option value="경기 안산시">안산시</option>
								<option value="경기 안성시">안성시</option>
								<option value="경기 안양시">안양시</option>
								<option value="경기 양주시">양주시</option>
								<option value="경기 양평군">양평군</option>
								<option value="경기 여주시">여주시</option>
								<option value="경기 연천군">연천군</option>
								<option value="경기 오산시">오산시</option>
								<option value="경기 용인시">용인시</option>
								<option value="경기 의왕시">의왕시</option>
								<option value="경기 의정부시">의정부시</option>
								<option value="경기 이천시">이천시</option>
								<option value="경기 파주시">파주시</option>
								<option value="경기 평택시">평택시</option>
								<option value="경기 포천시">포천시</option>
								<option value="경기 하남시">하남시</option>
								<option value="경기 화성시">화성시</option>
							</optgroup>
						</select>
					</div>
					<div class="form-group">
						<label for="cprice">가격(만원):</label>
						<input type="text" class="form-control" id="cprice" name="cprice">
					</div>
					<div class="form-group">
						<label for="cshortment">짧은 설명:</label>
						<input type="text" class="form-control" id="cshortment" name="cshortment">
					</div>
				</div>
				<div class="col-md-6">				
					<div class="form-group">
						<label for="cseller">판매자:</label>
						<input type="text" class="form-control" id="cseller" name="cseller">
					</div>
					<div class="form-group">
					    <label for="cseller_contact">판매자 연락처:</label><br>
					    <div class="input-group">
					        <input type="text" class="form-control" id="cseller_contact1" name="cseller_contact1" maxlength="3" pattern="[0-9]{3}" placeholder="010">
					        <div class="input-group-prepend input-group-append">
					            <span class="input-group-text">-</span>
					        </div>
					        <input type="text" class="form-control" id="cseller_contact2" name="cseller_contact2" maxlength="4" pattern="[0-9]{4}" placeholder="1234">
					        <div class="input-group-prepend input-group-append">
					            <span class="input-group-text">-</span>
					        </div>
					        <input type="text" class="form-control" id="cseller_contact3" name="cseller_contact3" maxlength="4" pattern="[0-9]{4}" placeholder="5678">
					    </div>
					    <small class="form-text text-muted">연락처는 숫자만 입력하세요. 예: 010-1234-5678</small>
					</div>
					<div class="form-group">
						<label for="ccomment">상세 설명:</label>
						<textarea class="form-control" id="ccomment" name="ccomment" rows="5"></textarea>
					</div>
					<div class="form-group">
						<label for="ccolor">차량 색상:</label>
						<select class="form-control" id="ccolor" name="ccolor">
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
					<div class="form-group">
						<label for="cfuel_type">연료 종류:</label>
						<select class="form-control" id="cfuelType" name="cfuelType">
							<option value="">연료 종류 선택</option>
							<option value="휘발유">휘발유</option>
							<option value="경유">경유</option>
							<option value="전기">전기</option>
							<option value="하이브리드">하이브리드</option>
						</select>
					</div>
					<div class="form-group">
						<label for="ctransmission">변속기:</label>
						<select class="form-control" id="ctransmission" name="ctransmission">
							<option value="">변속기 종류 선택</option>
							<option value="오토">오토</option>
							<option value="수동">수동</option>
						</select>
					</div>
					<div class="form-group">
						<label for="ccondition">차량 상태:</label>
						<input type="text" class="form-control" id="ccondition" name="ccondition">
					</div>
				</div>	
				<div class="form-group">
						<button type="submit" class="btn btn-primary">등록</button>
						<button type="button" class="btn btn-primary" onclick="location.href='used_car_board'">목록</button>
						</div>
			</div>

		</form>
	</div>
</div>
</body>
</html>