<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>중고차 정보 입력</h2>
    <form action="addUsedCar.jsp" method="post">
        <label for="cname">차량명:</label>
        <input type="text" id="cname" name="cname" required><br>
        
        <label for="cnumber">차량 번호:</label>
        <input type="text" id="cnumber" name="cnumber" required><br>
        
        <label for="cmanufacturer">제조사:</label>
        <input type="text" id="cmanufacturer" name="cmanufacturer" required><br>
        
        <label for="cimg">이미지 URL:</label>
        <input type="text" id="cimg" name="cimg" required><br>
        
        <label for="cyear">연식:</label>
        <input type="number" id="cyear" name="cyear" required><br>
        
        <label for="cmileage">주행 거리:</label>
        <input type="number" id="cmileage" name="cmileage" required><br>
        
        <label for="carea">지역:</label>
        <input type="text" id="carea" name="carea" required><br>
        
        <label for="cprice">가격(만원):</label>
        <input type="number" id="cprice" name="cprice" required><br>
        
        <label for="cshortment">짧은 설명:</label>
        <input type="text" id="cshortment" name="cshortment" required><br>
        
        <label for="cseller">판매자:</label>
        <input type="text" id="cseller" name="cseller" required><br>
        
        <label for="cseller_contact">판매자 연락처:</label>
        <input type="text" id="cseller_contact" name="cseller_contact" required><br>
        
        <label for="ccomment">상세 설명:</label>
        <textarea id="ccomment" name="ccomment" rows="5" required></textarea><br>
        
        <label for="cfuel_type">연료 종류:</label>
        <input type="text" id="cfuel_type" name="cfuel_type" required><br>
        
        <label for="ctransmission">변속기:</label>
        <input type="text" id="ctransmission" name="ctransmission" required><br>
        
        <label for="ccondition">차량 상태:</label>
        <input type="text" id="ccondition" name="ccondition" required><br>
        
        <button type="submit">등록</button>
    </form>
</body>
</html>