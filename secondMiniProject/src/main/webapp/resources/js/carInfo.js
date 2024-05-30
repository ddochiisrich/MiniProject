$(document).ready(function() {
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
    
//    $(document).on("submit", "#carForm", function(event) {
//
//        var id = $("#sessionId").val();
//        
//
//        $.ajax({
//            url: "cmileageUpdateProcess.ajax",
//            type: "post",
//            data: {id: id, editCmileage: editCmileage},
//            dataType: "json",
//            success: function(resData) {
//                   $("#mileageDiv").empty();
//                   
//                   var result = 
//                		   
//                		   
//                	$("#mileageDiv").append(result);   
//
//            },
//            error: function(xhr, status, error) {
//                console.error("Error: " + error);
//            }
//        });
//    });
});
