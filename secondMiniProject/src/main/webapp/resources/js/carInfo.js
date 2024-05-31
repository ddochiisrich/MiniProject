$(document).ready(function() {
	//누적 주행거리 추가하는 js
    $(document).on("submit", "#cmileageForm", function(event) {

        var id = $("#sessionId").val();
        var editCmileage = $("#editCmileage").val();
        
     // 유효성 검사
        var isValid = true;
        var mileageValue = parseInt(editCmileage, 10);
        if (isNaN(mileageValue) || mileageValue < 0 || mileageValue > 999999) {
            isValid = false;
            $("#editCmileageHelp").text("0에서 999999 사이의 숫자를 입력해주세요.").css("color", "red");
        } else {
            $("#editCmileageHelp").text("숫자만 입력해주세요.").css("color", "");
        }

        if (!isValid) {
        	$("#editCmileage").text("");
            return false;
        }
        
        console.log(id);
        console.log(editCmileage);

        $.ajax({
            url: "cmileageUpdateProcess.ajax",
            type: "post",
            data: {id: id, editCmileage: editCmileage},
            dataType: "json",
            success: function(resData) {
                   $("#mileageDiv").empty();
                   
                   var result = 
                		   '<span class="fs-1" id="resultCmileage">' + resData.carMileage + '</span><span>km</span>';
                		   
                	$("#mileageDiv").append(result);   

            },
            error: function(xhr, status, error) {
                console.error("Error: " + error);
            }
        });
    });
    
    //엔진오일교체 누적주행거리 추가하는 js
    $(document).on("submit", "#enginOilForm", function(event) {

        var id = $("#sessionId").val();
        var carMileage = $("#carMileage").val();
        var editEngineOil = $("#editEngineOil").val();
        
        console.log(id);
        console.log(editEngineOil);
        console.log(carMileage);
        
     // 유효성 검사
        var isValid = true;
        var enginValue = parseInt(editEngineOil, 10);
        
        if (isNaN(enginValue) || enginValue < 0 || enginValue > 999999) {
            isValid = false;
            $("#editEngineOilHelp").text("0에서 999999 사이의 숫자를 입력해주세요.").css("color", "red");
        } else {
            $("#editEngineOilHelp").text("숫자만 입력해주세요.").css("color", "");
        }

        if (!isValid) {
        	$("#editEngineOil").text("");
            return false;
        }

        $.ajax({
            url: "enginOilUpdateProcess.ajax",
            type: "post",
            data: {id: id, editEngineOil: editEngineOil, carMileage: carMileage},
            dataType: "json",
            success: function(resData) {
                   $("#mileageDiv").empty();
                   
                   var result = 
                		   '<span class="fs-1" id="resultCmileage">' + resData.carMileage + '</span><span>km</span>';
                		   
                	$("#mileageDiv").append(result);   
                	
                    console.log(id);
                    console.log(editEngineOil);
                    console.log(carMileage);

            },
            error: function(xhr, status, error) {
                console.error("Error: " + error);
            }
        });
    });
  //에어컨 필터 누적주행거리 추가하는 js
    $(document).on("submit", "#airFilterForm", function(event) {


        var id = $("#sessionId").val();
        var carMileage = $("#carMileage").val();
        var editairFilter = $("#editairFilter").val(); // 올바르게 변수명 수정

        // 유효성 검사
        var isValid = true;
        var editairFilterValue = parseInt(editairFilter, 10);

        if (isNaN(editairFilterValue) || editairFilterValue < 0 || editairFilterValue > 999999) {
            isValid = false;
            $("#editairFilterHelp").text("0에서 999999 사이의 숫자를 입력해주세요.").css("color", "red");
        } else {
            $("#editairFilterHelp").text("숫자만 입력해주세요.").css("color", "");
        }

        if (!isValid) {
            $("#editairFilter").val(""); // 'val()'을 사용하여 input 필드의 값을 지웁니다.
            return false;
        }

        $.ajax({
            url: "airFilterUpdateProcess.ajax",
            type: "post",
            data: {id: id, editairFilter: editairFilter, carMileage: carMileage}, // data 객체의 변수명 수정
            dataType: "json",
            success: function(resData) {
                $("#mileageDiv").empty();
                var result = '<span class="fs-1" id="resultCmileage">' + resData.carMileage + '</span><span>km</span>';
                $("#mileageDiv").append(result);   
            },
            error: function(xhr, status, error) {
                console.error("Error: " + error);
            }
        });
    });
  //타이어 누적주행거리 추가하는 js
    $(document).on("submit", "#tireForm", function(event) { 

        var id = $("#sessionId").val();
        var carMileage = $("#carMileage").val();
        var editcTire = $("#editcTire").val(); 

        // 유효성 검사
        var isValid = true;
        var editcTireValue = parseInt(editcTire, 10);

        if (isNaN(editcTireValue) || editcTireValue < 0 || editcTireValue > 999999) {
            isValid = false;
            $("#editcTireHelp").text("0에서 999999 사이의 숫자를 입력해주세요.").css("color", "red");
        } else {
            $("#editcTireHelp").text("숫자만 입력해주세요.").css("color", "");
        }

        if (!isValid) {
            $("#editcTire").val(""); 
            return false;
        }

        $.ajax({
            url: "tireUpdateProcess.ajax", 
            type: "post",
            data: {id: id, editcTire: editcTire, carMileage: carMileage},
            dataType: "json",
            success: function(resData) {
                $("#mileageDiv").empty();
                var result = '<span class="fs-1" id="resultCmileage">' + resData.carMileage + '</span><span>km</span>';
                $("#mileageDiv").append(result);   
            },
            error: function(xhr, status, error) {
                console.error("Error: " + error);
            }
        });
    });

});
