<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div id="global-content">
	<div class="row text-center">
		<div class="col">
			<h2 class="fs-3 fw-bold">간단한 차량 정보등록</h2>
		</div>
	</div>
	<form name="writeForm" action="writeProcess" id="writeForm" class="border-primary offset-2" method="post"
		enctype="multipart/form-data">
		<div class="row">
			<div class="col-3">
				<label for="cname" class="form-label">차종</label> <input type="text" class="form-control" name="cname" id="cname"
					placeholder="차종을 입력해 주세요">
			</div>
			<div class="col-3">
				<label for="cnumber" class="form-label">차량번호</label>
				<input type="text" class="form-control" name="cnumber" id="cnumber" placeholder="차량번호를 입력해주세요">
			</div>
			<div class="col-3">
				<label for="km" class="form-label">주행거리</label>
				<input type="text" class="form-control" name="km" id="km" placeholder="km 를 입력해주세요">
			</div>
		</div>
		<div class="row">
			<div class="col offset-4 my-3">
				<input type="button" class="btn btn-secondary" value="상세 등록하기" id="btnToggleDetailForm" />
			</div>
		</div>
<!-- hidden 으로 숨기는 구역 -->
	<div class="row my-3 d-none" id="detailForm">
	    <div class="col">
	        <div class="row bg-light my-3 p-3 board">
	            <div class="col">
	                <div class="row">
	                    <div class="col-4">
	                        <label for="wiper" class="form-label my-0">와이퍼</label>
	                        <input type="text" class="form-control" name="wiper" id="wiper" placeholder="">
	                    </div>
	                    <div class="col-4">
	                        <label for="coolan" class="form-label my-0">냉각수</label>
	                        <input type="text" class="form-control" name="coolan" id="coolan" placeholder="">
	                    </div>
	                    <div class="row">
	                        <div class="col-4">
	                            <label for="battery" class="form-label my-0">배터리</label>
	                            <input type="text" class="form-control" name="battery" id="battery" placeholder="">
	                        </div>
	                        <div class="col-4">
	                            <label for="aircon" class="form-label my-0">에어컨</label>
	                            <input type="text" class="form-control" name="aircon" id="aircon" placeholder="">
	                        </div>
	                    </div>
	                    <div class="row">
	                        <div class="col-4">
	                            <label for="tire" class="form-label my-0">타이어</label>
	                            <input type="text" class="form-control" name="tire" id="tire" placeholder="">
	                        </div>
	                        <div class="col-4">
	                            <label for="file2" class="form-label my-0">사진</label>
	                            <input type="file" class="form-control" name="file2" id="file2" placeholder="">
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<div class="row">
		<div class="col offset-3 my-3">
			<input type="submit" value="등록하기" class="btn btn-secondary"/>
			<input type="button" value="취소하기" onclick="location.href='main'" class="btn btn-secondary" />
		</div>
	</div>	
	</form>
</div>

    