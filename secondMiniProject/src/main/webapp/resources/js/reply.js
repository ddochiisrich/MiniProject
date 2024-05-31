$(function(){
	// 상세보기 버튼이 클릭되면
	$("#btnToggleDetailForm").on("click", function(){		
		
		if($("#detailForm").is(":visible")) {
			$("#detailForm").slideUp(300);	
			
		} else { // 화면에 보이지 않을때
			$("#detailForm").removeClass("d-none")
			.css("display","none").slideDown(300);
		}
	});
	//<-------- 정규 표현식 구간 -------->
	// cnumber 정규표현식
	$("#cnumber").on("input", function(){
		let inputText = $(this).val();
		let regex = /^[ㄱ-ㅎ|가-힣|ㅏ-ㅣ|0-9]*$/;
		
		if (!regex.test(inputText)) {
			let filteredText = inputText.replace(/[^ㄱ-ㅎ|가-힣|ㅏ-ㅣ|0-9]/g, '');
			$(this).val(filteredText);
			alert("한글하고 숫자만 입력해주세요.");
		}
	});
	// km 정규표현식
	$("#km").on("input", function(){
		let inputText = $(this).val();
		let regex = /^[0-9]*$/;
		
		if (!regex.test(inputText)) {
			let filteredText = inputText.replace(/[^0-9]/g, '');
			$(this).val(filteredText);
			alert("숫자만 입력해주세요.");
		}
	});
	//<-------- 정규 표현식 구간 end -------->
	
	$("#writeForm").on("submit", function(){
		if($("#cname").val().length <= 0) {
			alert("차종을 입력해주세요");
			$("#cname").focus();
			return false;
		}
		if($("#cnumber").val().length <= 0) {
			alert("차량번호를 등록해주세요");
			$("#cnumber").focus();
			return false;
		}
		if($("#km").val().length <= 0) {
			alert("주행거리를 등록해주세요");
			$("#km").focus();
			return false;
		}
	})
	
	
			
});