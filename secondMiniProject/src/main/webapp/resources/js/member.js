$(function(){
	
		// 로그인에 id를 입력을 안 할시!!!
		$(document).ready(function () {
		    $("#userId").on("input", function(){
		        const inputValue = $(this).val().trim(); // 입력란 현재 값 value를 가져와 공백을 제거 한 후 변수에 저장
		        const inputField = $(this)[0]; // 입력란 요소를 가져오는 코드
		        const feedbackDiv = $("#please1")[0]; // 유효하지 않은 코드를 피드백 메시지 요소를 가져와 feedbackDiv 변수 저장 - jQuery
		        
		        let inputText = $(this).val();
		        let regex = /[^A-Za-z0-9]/gi;
		        
		        if(inputValue === '') {
		        	$(inputField).removeClass('is-valid').addClass('is-invalid');
		        	$(feedbackDiv).show().text("please enter a username.");
		        	return;
		        }
		        
		        // 문자열이 입력되었을 때 테두리를 초록색으로 변경
		        if (! regex.test(inputValue)) {
		            $(inputField).removeClass('is-invalid').addClass('is-valid');
		            $(feedbackDiv).hide(); // 유효한 입력이므로 피드백 숨기기
		        } else {
		            $(inputField).removeClass('is-valid').addClass('is-invalid');
		            $(feedbackDiv).show(); // 유효하지 않은 입력이므로 피드백 보이기
		        }
		    });
		});
		// 로그인에 password를 입력을 안 할시!!!
		$(document).ready(function () {
			$("#userPass").on("input", function(){
				const inputValue = $(this).val().trim(); // 입력란 현재 값 value를 가져와 공백을 제거 한 후 변수에 저장
				const inputField = $(this)[0]; // 입력란 요소를 가져오는 코드
				const feedbackDiv = $("#please2")[0]; // 유효하지 않은 코드를 피드백 메시지 요소를 가져와 feedbackDiv 변수 저장 - jQuery
				
				let inputText = $(this).val();
				let regex = /[^A-Za-z0-9]/gi;
				
				if(inputValue === '') {
					$(inputField).removeClass('is-valid').addClass('is-invalid');
					$(feedbackDiv).show().text("please enter a userpassword.");
					return;
				}
				
				// 문자열이 입력되었을 때 테두리를 초록색으로 변경
				if (! regex.test(inputValue)) {
					$(inputField).removeClass('is-invalid').addClass('is-valid');
					$(feedbackDiv).hide(); // 유효한 입력이므로 피드백 숨기기
				} else {
					$(inputField).removeClass('is-valid').addClass('is-invalid');
					$(feedbackDiv).show() // 유효하지 않은 입력이므로 피드백 보이기
				}
			});
		});

	
	// 회원 정보 수정 폼
	$("#memberUpdateForm").on("submit", function(){
		
		// 비밀번호가 체크되었는지 확인
		if(!$("#btnPassCheck").attr("disabled")) {
			alert("기존 비밀번호를 확인해주세요.");
			return false;
		}
		
		return joinFormCheck();
		
	});
	
	// 회원 정보 수정 폼에서 비밀번호 확인 버튼이 클릭되면
	$("#btnPassCheck").click(function(){
		
		let oldPass = $("#oldPass").val();
		let oldId = $("#id").val();
		
		if($.trim(oldPass).length == 0) {
			alert("기존 비밀번호를 입력해주세요.");
			return false;
		}
		let data = "id=" + oldId + "&pass=" + oldPass;
		console.log("data : " + data);
		
		// AJAX 구현 방법
		// XMLHttpRequest 객체, 
		// JQuery의 AJax 지원 메서드 $.ajax();
		// ES6+ Fetch API
		// AXIOS의 라이브러리
		$.ajax({
			url: "passCheck.ajax", 	// 요청 주소
			type: "get", 			// 요청 방식 폼 method
			data: data, 			// 서버로 보내는 데이터
			dataType: "json",		// 응답으로 받을 결과 데이터 형식
			success: function(resData){ 
				// 단순 성공이 아닌 ajax가 성공되고 응답 데이터(서버로부터 받은 데이터)를 dataType에 맞게 parsing이 완료 되면 호출되는 callback
				console.log(resData); 
				if(resData.result) { // 비밀번호가 맞으면
					// 비밀번호 확인 버튼을 비활성화 - disabled
					$("#oldPassComment").text("비밀번호가 확인 되었습니다!");
					$("#btnPassCheck").attr("disabled", true);
					$("#oldPass").attr("readonly", true);
					$("#pass1").focus();
				} else { // 비밀번호가 틀리면
					$("#oldPassComment").text("비밀번호가 틀립니다! 다시 시도해주세요.");
					$("#oldPass").val("").focus();
				}
				
				
				
				
			},
			error: function(){
				// ajax 작업 중에 오류가 발생되면 호출되는 callback
				console.log("error");
			}
		});
		
	});
	
	// 회원 가입 폼
	$("#joinForm").on("submit", function(){

		let isIdCheck=$("#isIdCheck").val();
		
		if(isIdCheck == 'false') {
			alert("아이디 중복검사가 되지 않았습니다.");
			return false;
		}
		
		return joinFormCheck();
	});
	
	
	// 이메일 도메인 셀렉트 박스가 선택하면
	$("#selectDomain").on("change", function(){
		let str = $(this).val(); // this = #selectDomain
		
		if(str == '직접입력') {
		$("#emailDomain").val("");
		$("#emailDomain").attr("readonly", false);
		$("#emailDomain").focus("");
		
		}else if(str == '네이버') {
			$("#emailDomain").val("naver.com");
			$("#emailDomain").attr("readonly", true);
		}else if(str == '다음') {
			$("#emailDomain").val("daum.net");
			$("#emailDomain").attr("readonly", true);
		}else if(str == '구글') {
			$("#emailDomain").val("google.co.kr");
			$("#emailDomain").attr("readonly", true);
		}
	});
	
	// 우편번호 찾기 버튼이 클릭되면 - 다음 우편번호 찾기 실행
	$("#btnZipcode").click(findZipCode);
	
	//아이디 중복 폼이 submit이 될 때
	$("#idCheckForm").on("submit", function(){
		let id=$("#checkId") +val();
		if(id.length == 0) {
			alert("아이디를 입력해주세요.");
		return false;
		}
	
		if(id.length < 5) {
		
		alert("아이디는 5자 이상이어야 합니다.")
		
		return false;
	}
		
	});
	
	// id를 아이디로 사용하기 버튼이 클릭되면
	$("#btnIdCheckClose").on("click", function(){
		let id=$(this).attr("data-id-value");
		opener.document.joinForm.id.value=id;
		opener.document.joinForm.isIdCheck.value=true;
		window.close();
		
	});
	
	$("#btnOverlapId").on("click", function(){
		let id = $("#id").val();
		if(id.length == 0) {
			alert("아이디를 입력해 주세요.");
			
			return false;
		}
		if(id.length < 5) {
			alert("아이디는 5자 이상이어야 합니다.");
			
			return false;
		}
		
		let url="overlapIdCheck?id=" + id;
		window.open(url, "_blank", "toolbar=no, location=no, "
				+ "status=no, menubar=no, width=400, height=300, left=400, top=300");
	});
	
	
	// 회원가입 폼 아이디 중복
	$("#id").on("keyup", function(){
	
		let regExp = /[^A-Za-z0-9]/gi; // 정규표현식 객체
		if(regExp.test($(this).val())) { // 영문 대소문자, 숫자가 아니면
			alert("아이디는 영문 대소문자와 숫자만 가능합니다.");
			$(this).val($(this).val().replace(regExp, "")); // 영문 대소문자나 숫자가 아닌 것들은 전부 삭제(빈 공백) 
		}
	});
	// 이름에는 한글만 입력할 수 있는 정규표현식
	$("#name").on("input", function(){
	    let inputText = $(this).val();
	    let regex = /^[ㄱ-ㅎ|가-힣|ㅏ-ㅣ]*$/;
	    
	    if (!regex.test(inputText)) {
	        let filteredText = inputText.replace(/[^ㄱ-ㅎ|가-힣|ㅏ-ㅣ]/g, '');
	        $(this).val(filteredText);
	        alert("한글만 입력해주세요.");
	    }
	});
	
//	$(".btn-primary[type='reset']").on("click", function() {
//	    $("html, body").animate({scrollTop: 0}, "slow");
//	});
	$("#reset").on("click", function(){
		$("html, body").animate({scrollTop:0}, "slow");
	});
	
	$("#pass1").on("keyup", inputCharReplace); // 
	$("#pass2").on("keyup", inputCharReplace); // 
	$("#emailId").on("keyup", inputCharReplace); // 
	$("#emailDomain").on("keyup", inputEmailDomainReplace); // 
	
	
	
	// 로그인폼 유효성 검사
	$("#loginForm").on("submit", function(){
		
		let id=$("#userId").val();
		let pass=$("#userPass").val();
		
		if(id.length <= 0) {
			alert("아이디를 입력해주세요.");
			$("#userId").focus();
			
			return false;
		}
		if(pass.length <= 0) {
			alert("비밀번호를 입력해주세요.");
			$("#userPass").focus();
			
			return false;
		}
	});
	
	function joinFormCheck() {
		let name=$("#name").val();
		let id=$("#id").val();
		let pass1=$("#pass1").val();
		let pass2=$("#pass2").val();
		let zipcode=$("#zipcode").val();
		let emailId=$("#emailId").val();
		let emailDomain=$("#emailDomain").val();
		let mobile2=$("#mobile2").val();
		let mobile3=$("#mobile3").val();
		
		if(name.length == 0) {
			alert("이름이 입력되지 않았습니다.");
			return false;
		}
		if(id.length < 5) {
			alert("아이디는 5자 이상입니다.");
			return false;
		}
		if(pass1.length == 0) {
			alert("비밀번호가 입력되지 않았습니다.");
			return false;
		}
		if(pass2.length == 0) {
			alert("비밀번호 확인이 입력되지 않았습니다.");
			return false;
		}
		if(pass1 != pass2) {
			alert("비밀번호와 비밀번호 확인이 같지 않습니다.");
			return false;
		}
		if(zipcode.length == 0) {
			alert("우편번호가 입력되지 않았습니다.");
			return false;
		}
		if(address1.length == 0) {
			alert("주소가 입력되지 않았습니다.");
			return false;
		}
		if(emailId.length == 0) {
			alert("이메일 아이디가 입력되지 않았습니다.");
			return false;
		}
		if(emailDomain.length == 0) {
			alert("이메일 도메인이 입력되지 않았습니다.");
			return false;
		}
		if(mobile2.length == 0 || mobile3.length == 0) {
			alert("휴대폰 번호가 입력되지 않았습니다.");
			return false;
		}
	}
	
});
function inputEmailDomainReplace() {
	let regExp = /[^a-z0-9\.]/g; // 정규표현식 객체
	if(regExp.test($(this).val())) { // 영문 대소문자, 숫자가 아니면
		alert("이메일 도메인은 영문 소문자, 숫자, 점(.)만 가능합니다.");
		$(this).val($(this).val().replace(regExp, "")); // 영문 대소문자나 숫자가 아닌 것들은 전부 삭제(빈 공백) 

	}};

function inputCharReplace() {
	let regExp = /[^A-Za-z0-9]/gi; // 정규표현식 객체
	if(regExp.test($(this).val())) { // 영문 대소문자, 숫자가 아니면
		alert("아이디는 영문 대소문자와 숫자만 가능합니다.");
		$(this).val($(this).val().replace(regExp, "")); // 영문 대소문자나 숫자가 아닌 것들은 전부 삭제(빈 공백) 

	}};

	
function findZipCode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.roadAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드를 주소 뒤에 넣는다.
	                   addr += extraAddr;
	                
	                }
	                
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                $("#zipcode").val(data.zonecode);
	                $("#address1").val(addr);
	                // 커서를 상세주소 필드로 이동한다.
	                $("#address2").focus();
	            }
	        }).open();
	    }