<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div id="global-content">
	<div class="row text-center">
		<div class="col">
			<h2 class="fs-3 fw-bold">간단한 차량 정보등록</h2>
		</div>
	</div>
	<form name="writeForm2" action="communitywrite" id="writeForm2" class="border-primary offset-2" method="post"
		enctype="multipart/form-data">
		<div class="row">
			<div class="col-3">
				<label class="fs-5">제목 : </label>
				<input type="text" class="form-control" name="title" id="title">
			</div>
			<div class="col-4">
				<label for="id" class="form-label">작성자 : </label>
			    <input type="text" class="form-control" name="id" id="id" style="background-color:lightgray;"
			    	value="" readonly>
			    	<!-- ${sessionScope.communi.id} -->
			</div>					
		</div>
		<div class="row">
			<div class="col-4">
				<label for="file5" class="form-label">보여주고 싶은 이미지 : </label>
			    <input type="file" class="form-control" name="file5" id="file5" >
			</div>					
		</div>
		<div class="row">
			<div class="col-3">
				<label class="fs-5">내용 : </label>
				<textarea rows="5" cols="80" style="resize: none;" name="content" id="content"></textarea>
			</div>
		</div>
		<div class="row">
			<div class="col offset-3 my-3">
				<input type="submit" value="등록하기" class="btn btn-success"/>
				<input type="button" value="취소하기" onclick="location.href='Community'" class="btn btn-success" />
			</div>
		</div>	
	</form>
</div>

    