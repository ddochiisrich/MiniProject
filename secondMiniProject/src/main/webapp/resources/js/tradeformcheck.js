$(document).ready(function(){
    // 차량 번호 검사
    $('#cnumber').on('keyup', function(){
        var value = $(this).val();
        var pattern = /^[0-9]{2}[가-힣]{1}[0-9]{4}$|^[0-9]{3}[가-힣]{1}[0-9]{4}$/;
        if (!pattern.test(value)) {
            $('#cnumberHelp').html('차량 번호 형식이 올바르지 않습니다.<br>예: 11가1111 또는 111가1111').addClass('error').removeClass('valid');
        } else {
            $('#cnumberHelp').html('차량 번호 형식이 올바릅니다.').addClass('valid').removeClass('error');
        }
    });

    // 주행 거리 숫자만 입력 검사
    $('#cmileage').keyup(function(){
        var input = $(this).val();
        var numericInput = input.replace(/\D/g, '');
        $(this).val(numericInput);
        if (input !== numericInput) {
            alert("숫자만 입력할 수 있습니다.");
        }
    });

    // 판매자 연락처 숫자만 입력 검사
    $('#cseller_contact1, #cseller_contact2, #cseller_contact3').keyup(function(){
        var input = $(this).val();
        var numericInput = input.replace(/\D/g, '');
        $(this).val(numericInput);
        if (input !== numericInput) {
            alert("숫자만 입력할 수 있습니다.");
        }
    });
    
    // 중고차 제조사 선택 시 AJAX 요청
    $('#cmanufacturer li').on('click', function(){
        var type = $('#cmanufacturer').data('type');
        var keyword = $(this).data('value');

        $.ajax({
            url: 'used_car_board',
            type: 'GET',
            data: {
                type: type,
                keyword: keyword
            },
            success: function(response){
                // 중고차 리스트를 갱신하는 코드를 작성합니다.
                $('#usedCarList').html(response);
            },
            error: function(){
                alert('중고차 리스트를 가져오는 데 실패했습니다.');
            }
        });
    });

    // 중고차 등록 폼 제출 검사
    $("#registForm").on("submit", function() {
        if ($("#cname").val().length <= 0) {
            alert("차량이름이 입력되지 않았습니다. \n차량이름을 입력해주세요.");
            $("#cname").focus();
            return false;
        }

        if ($("#cnumber").val().length <= 0) {
            alert("차량 번호가 입력되지 않았습니다. \n차량 번호를 입력해주세요.");
            $("#cnumber").focus();
            return false;
        }

        if ($("#cmanufacturer").val() === "") {
            alert("제조사가 선택되지 않았습니다. \n제조사를 선택해주세요.");
            $("#cmanufacturer").focus();
            return false;
        }

        if ($("#cimg").val().length <= 0) {
            alert("상품 이미지가 선택되지 않았습니다. \n상품 이미지를 선택해주세요.");
            $("#cimg").focus();
            return false;
        }

        if ($("#cyear").val() === "") {
            alert("연식이 선택되지 않았습니다. \n연식을 선택해주세요.");
            $("#cyear").focus();
            return false;
        }

        if ($("#cmileage").val().length <= 0) {
            alert("주행 거리가 입력되지 않았습니다. \n주행 거리를 입력해주세요.");
            $("#cmileage").focus();
            return false;
        }

        if ($("#carea").val() === "") {
            alert("지역이 선택되지 않았습니다. \n지역을 선택해주세요.");
            $("#carea").focus();
            return false;
        }

        if ($("#cprice").val().length <= 0) {
            alert("가격이 입력되지 않았습니다. \n가격을 입력해주세요.");
            $("#cprice").focus();
            return false;
        }

        if ($("#cshortment").val().length <= 0) {
            alert("짧은 설명이 입력되지 않았습니다. \n짧은 설명을 입력해주세요.");
            $("#cshortment").focus();
            return false;
        }

        if ($("#cseller").val().length <= 0) {
            alert("판매자가 입력되지 않았습니다. \n판매자를 입력해주세요.");
            $("#cseller").focus();
            return false;
        }

        if ($("#cseller_contact1").val().length !== 3 || !$("#cseller_contact1").val().match(/^[0-9]{3}$/)) {
            alert("판매자 연락처(앞자리)가 올바르게 입력되지 않았습니다. \n판매자 연락처(앞자리)를 올바르게 입력해주세요.");
            $("#cseller_contact1").focus();
            return false;
        }

        if ($("#cseller_contact2").val().length !== 4 || !$("#cseller_contact2").val().match(/^[0-9]{4}$/)) {
            alert("판매자 연락처(중간자리)가 올바르게 입력되지 않았습니다. \n판매자 연락처(중간자리)를 올바르게 입력해주세요.");
            $("#cseller_contact2").focus();
            return false;
        }

        if ($("#cseller_contact3").val().length !== 4 || !$("#cseller_contact3").val().match(/^[0-9]{4}$/)) {
            alert("판매자 연락처(뒷자리)가 올바르게 입력되지 않았습니다. \n판매자 연락처(뒷자리)를 올바르게 입력해주세요.");
            $("#cseller_contact3").focus();
            return false;
        }

        if ($("#ccomment").val().length <= 0) {
            alert("상세 설명이 입력되지 않았습니다. \n상세 설명을 입력해주세요.");
            $("#ccomment").focus();
            return false;
        }

        if ($("#cfuelType").val() === "") {
            alert("연료 종류가 선택되지 않았습니다. \n연료 종류를 선택해주세요.");
            $("#cfuel_type").focus();
            return false;
        }

        if ($("#ctransmission").val() === "") {
            alert("변속기가 선택되지 않았습니다. \n변속기를 선택해주세요.");
            $("#ctransmission").focus();
            return false;
        }

        if ($("#ccondition").val().length <= 0) {
            alert("차량 상태가 입력되지 않았습니다. \n차량 상태를 입력해주세요.");
            $("#ccondition").focus();
            return false;
        }

        return true;
    });
    
 // 중고차 수정 폼 제출 검사
    $("#tradeUpdateProcess").on("submit", function() {
        if ($("#cname").val().length <= 0) {
            alert("차량이름이 입력되지 않았습니다. \n차량이름을 입력해주세요.");
            $("#cname").focus();
            return false;
        }

        if ($("#cnumber").val().length <= 0) {
            alert("차량 번호가 입력되지 않았습니다. \n차량 번호를 입력해주세요.");
            $("#cnumber").focus();
            return false;
        }

        if ($("#cmanufacturer").val() === "") {
            alert("제조사가 선택되지 않았습니다. \n제조사를 선택해주세요.");
            $("#cmanufacturer").focus();
            return false;
        }

        if ($("#cimg").val().length <= 0) {
            alert("상품 이미지가 선택되지 않았습니다. \n상품 이미지를 선택해주세요.");
            $("#cimg").focus();
            return false;
        }

        if ($("#cyear").val() === "") {
            alert("연식이 선택되지 않았습니다. \n연식을 선택해주세요.");
            $("#cyear").focus();
            return false;
        }

        if ($("#cmileage").val().length <= 0) {
            alert("주행 거리가 입력되지 않았습니다. \n주행 거리를 입력해주세요.");
            $("#cmileage").focus();
            return false;
        }

        if ($("#carea").val() === "") {
            alert("지역이 선택되지 않았습니다. \n지역을 선택해주세요.");
            $("#carea").focus();
            return false;
        }

        if ($("#cprice").val().length <= 0) {
            alert("가격이 입력되지 않았습니다. \n가격을 입력해주세요.");
            $("#cprice").focus();
            return false;
        }

        if ($("#cshortment").val().length <= 0) {
            alert("짧은 설명이 입력되지 않았습니다. \n짧은 설명을 입력해주세요.");
            $("#cshortment").focus();
            return false;
        }

        if ($("#cseller").val().length <= 0) {
            alert("판매자가 입력되지 않았습니다. \n판매자를 입력해주세요.");
            $("#cseller").focus();
            return false;
        }

        if ($("#cseller_contact1").val().length !== 3 || !$("#cseller_contact1").val().match(/^[0-9]{3}$/)) {
            alert("판매자 연락처(앞자리)가 올바르게 입력되지 않았습니다. \n판매자 연락처(앞자리)를 올바르게 입력해주세요.");
            $("#cseller_contact1").focus();
            return false;
        }

        if ($("#cseller_contact2").val().length !== 4 || !$("#cseller_contact2").val().match(/^[0-9]{4}$/)) {
            alert("판매자 연락처(중간자리)가 올바르게 입력되지 않았습니다. \n판매자 연락처(중간자리)를 올바르게 입력해주세요.");
            $("#cseller_contact2").focus();
            return false;
        }

        if ($("#cseller_contact3").val().length !== 4 || !$("#cseller_contact3").val().match(/^[0-9]{4}$/)) {
            alert("판매자 연락처(뒷자리)가 올바르게 입력되지 않았습니다. \n판매자 연락처(뒷자리)를 올바르게 입력해주세요.");
            $("#cseller_contact3").focus();
            return false;
        }

        if ($("#ccomment").val().length <= 0) {
            alert("상세 설명이 입력되지 않았습니다. \n상세 설명을 입력해주세요.");
            $("#ccomment").focus();
            return false;
        }

        if ($("#cfuelType").val() === "") {
            alert("연료 종류가 선택되지 않았습니다. \n연료 종류를 선택해주세요.");
            $("#cfuel_type").focus();
            return false;
        }

        if ($("#ctransmission").val() === "") {
            alert("변속기가 선택되지 않았습니다. \n변속기를 선택해주세요.");
            $("#ctransmission").focus();
            return false;
        }

        if ($("#ccondition").val().length <= 0) {
            alert("차량 상태가 입력되지 않았습니다. \n차량 상태를 입력해주세요.");
            $("#ccondition").focus();
            return false;
        }

        return true;
    });
});
