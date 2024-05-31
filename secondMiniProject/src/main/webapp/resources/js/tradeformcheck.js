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
    $('#cmanufacturer li').on('click', function() {
        var type = $('#cmanufacturer').data('type');
        var keyword = $(this).data('value');

        $.ajax({
            url: 'used_car_board.ajax',
            type: 'GET',
            dataType: 'json',
            data: {
                type: type,
                keyword: keyword,
                pageNum: 1 
            },
            success: function(response) {
                var tradeList = response.tradeBoardList;
                var startPage = response.startPage;
                var endPage = response.endPage;
                var currentPage = response.currentPage;
                var pageGroup = response.pageGroup;
                var pageCount = response.pageCount;
                
                $("#usedCarList").empty();
               
                $.each(tradeList, function(i, v) {
                    let result =
                        '<tr>'
                        + '<td><img src="./resources/upload/' + v.cimg + ' " style="width:200px; height:100px"></td>'
                        + '<td>'
                        + '  <h5>'
                        + '    <a href="TradeBoardDetail?ucno=' + v.ucno + '&pageNum=' + currentPage + '&type=' + type + '&keyword=' + keyword + '" class="text-decoration-none link-secondary">'+ v.cmanufacturer + ' ' + v.cname + '</a>'
                        + '  </h5>'
                        + '  <pre>' + v.cyear + '년식 | ' + v.cmileage + 'km | ' + v.carea + ' | ' + v.ccolor + '\n' + v.cshortment + '</pre>'
                        + '</td>'
                        + '<td>' + (v.cprice / 10000).toFixed(0) + ' 만원</td>'
                        + '<td>' + v.cseller + '</td>'
                        + '</tr>';
                    $("#usedCarList").append(result);
                });
                
                $("#pageNavigation").empty();
                
                let pageNavigation = '<nav aria-label="Page navigation"><ul class="pagination justify-content-center">';
                
                // 이전 버튼
                if (startPage > pageGroup) {
                    pageNavigation += '<li class="page-item">';
                    pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (startPage - pageGroup) + ', \'' + type + '\', \'' + keyword + '\')">Pre</a>';
                    pageNavigation += '</li>';
                }

                // 페이지 번호
                for (let i = startPage; i <= endPage; i++) {
                    if (i === currentPage) {
                        pageNavigation += '<li class="page-item active" aria-current="page">';
                        pageNavigation += '<span class="page-link">' + i + '</span>';
                        pageNavigation += '</li>';
                    } else {
                        pageNavigation += '<li class="page-item">';
                        pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + i + ', \'' + type + '\', \'' + keyword + '\')">' + i + '</a>';
                        pageNavigation += '</li>';
                    }
                }

                // 다음 버튼
                if (endPage < pageCount) {
                    pageNavigation += '<li class="page-item">';
                    pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (startPage + pageGroup) + ', \'' + type + '\', \'' + keyword + '\')">Next</a>';
                    pageNavigation += '</li>';
                }
                
                pageNavigation += '</ul></nav>';
                $("#pageNavigation").append(pageNavigation);
            },
            error: function(xhr, status, error) {
                console.error("AJAX 실패: ", status, error); // 오류 정보를 콘솔에 출력
                alert('중고차 리스트를 가져오는 데 실패했습니다.');
            }
        });
    });

    window.loadPage = function(pageNum, type, keyword) {
        $.ajax({
            url: 'used_car_board.ajax',
            type: 'GET',
            dataType: 'json',
            data: {
                type: type,
                keyword: keyword,
                pageNum: pageNum
            },
            success: function(response) {
                var tradeList = response.tradeBoardList;
                var startPage = response.startPage;
                var endPage = response.endPage;
                var currentPage = response.currentPage;
                var pageGroup = response.pageGroup;
                var pageCount = response.pageCount;
                
                $("#usedCarList").empty();
               
                $.each(tradeList, function(i, v) {
                    let result =
                        '<tr>'
                    	+ '<td><img src="./resources/upload/' + v.cimg + ' " style="width:200px; heigth:100px"></td>'
                        + '<td>'
                        + '  <h5>'
                        + '    <a href="TradeBoardDetail?ucno=' + v.ucno + '&pageNum=' + currentPage + '&type=' + type + '&keyword=' + keyword + '" class="text-decoration-none link-secondary">' + v.cname + '</a>'
                        + '  </h5>'
                        + '  <pre>' + v.cyear + '년식 | ' + v.cmileage + 'km | ' + v.carea + ' | ' + v.ccolor + '\n' + v.cshortment + '</pre>'
                        + '</td>'
                        + '<td>' + (v.cprice / 10000).toFixed(0) + ' 만원</td>'
                        + '<td>' + v.cseller + '</td>'
                        + '</tr>';
                    $("#usedCarList").append(result);
                });
                
                $("#pageNavigation").empty();
                
                let pageNavigation = '<nav aria-label="Page navigation"><ul class="pagination justify-content-center">';
                
                // 이전 버튼
                if (startPage > pageGroup) {
                    pageNavigation += '<li class="page-item">';
                    pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (startPage - pageGroup) + ', \'' + type + '\', \'' + keyword + '\')">Pre</a>';
                    pageNavigation += '</li>';
                }

                // 페이지 번호
                for (let i = startPage; i <= endPage; i++) {
                    if (i === currentPage) {
                        pageNavigation += '<li class="page-item active" aria-current="page">';
                        pageNavigation += '<span class="page-link">' + i + '</span>';
                        pageNavigation += '</li>';
                    } else {
                        pageNavigation += '<li class="page-item">';
                        pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + i + ', \'' + type + '\', \'' + keyword + '\')">' + i + '</a>';
                        pageNavigation += '</li>';
                    }
                }

                // 다음 버튼
                if (endPage < pageCount) {
                    pageNavigation += '<li class="page-item">';
                    pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (startPage + pageGroup) + ', \'' + type + '\', \'' + keyword + '\')">Next</a>';
                    pageNavigation += '</li>';
                }
                
                pageNavigation += '</ul></nav>';
                $("#pageNavigation").append(pageNavigation);
            },
            error: function(xhr, status, error) {
                console.error("AJAX 실패: ", status, error); // 오류 정보를 콘솔에 출력
                alert('중고차 리스트를 가져오는 데 실패했습니다.');
            }
        });
    }
    
 // 중고차 연식 선택 시 AJAX 요청
    $('#year li').on('click', function() {
        var type = $('#year').data('type');
        var keyword = $(this).data('value');

        $.ajax({
            url: 'used_car_board.ajax',
            type: 'GET',
            dataType: 'json',
            data: {
                type: type,
                keyword: keyword,
                pageNum: 1 
            },
            success: function(response) {
                var tradeList = response.tradeBoardList;
                var startPage = response.startPage;
                var endPage = response.endPage;
                var currentPage = response.currentPage;
                var pageGroup = response.pageGroup;
                var pageCount = response.pageCount;
                
                $("#usedCarList").empty();
               
                $.each(tradeList, function(i, v) {
                    let result =
                        '<tr>'
                    	+ '<td><img src="./resources/upload/' + v.cimg + ' " style="width:200px; height:100px"></td>'
                        + '<td>'
                        + '  <h5>'
                        + '    <a href="TradeBoardDetail?ucno=' + v.ucno + '&pageNum=' + currentPage + '&type=' + type + '&keyword=' + keyword + '" class="text-decoration-none link-secondary">'+ v.cmanufacturer + ' ' + v.cname + '</a>'
                        + '  </h5>'
                        + '  <pre>' + v.cyear + '년식 | ' + v.cmileage + 'km | ' + v.carea + ' | ' + v.ccolor + '\n' + v.cshortment + '</pre>'
                        + '</td>'
                        + '<td>' + (v.cprice / 10000).toFixed(0) + ' 만원</td>'
                        + '<td>' + v.cseller + '</td>'
                        + '</tr>';
                    $("#usedCarList").append(result);
                });
                
                $("#pageNavigation").empty();
                
                let pageNavigation = '<nav aria-label="Page navigation"><ul class="pagination justify-content-center">';
                
                // 이전 버튼
                if (startPage > pageGroup) {
                    pageNavigation += '<li class="page-item">';
                    pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (startPage - pageGroup) + ', \'' + type + '\', \'' + keyword + '\')">Pre</a>';
                    pageNavigation += '</li>';
                }

                // 페이지 번호
                for (let i = startPage; i <= endPage; i++) {
                    if (i === currentPage) {
                        pageNavigation += '<li class="page-item active" aria-current="page">';
                        pageNavigation += '<span class="page-link">' + i + '</span>';
                        pageNavigation += '</li>';
                    } else {
                        pageNavigation += '<li class="page-item">';
                        pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + i + ', \'' + type + '\', \'' + keyword + '\')">' + i + '</a>';
                        pageNavigation += '</li>';
                    }
                }

                // 다음 버튼
                if (endPage < pageCount) {
                    pageNavigation += '<li class="page-item">';
                    pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (startPage + pageGroup) + ', \'' + type + '\', \'' + keyword + '\')">Next</a>';
                    pageNavigation += '</li>';
                }
                
                pageNavigation += '</ul></nav>';
                $("#pageNavigation").append(pageNavigation);
            },
            error: function(xhr, status, error) {
                console.error("AJAX 실패: ", status, error); // 오류 정보를 콘솔에 출력
                alert('중고차 리스트를 가져오는 데 실패했습니다.');
            }
        });
    });

    window.loadPage = function(pageNum, type, keyword) {
        $.ajax({
            url: 'used_car_board.ajax',
            type: 'GET',
            dataType: 'json',
            data: {
                type: type,
                keyword: keyword,
                pageNum: pageNum
            },
            success: function(response) {
                var tradeList = response.tradeBoardList;
                var startPage = response.startPage;
                var endPage = response.endPage;
                var currentPage = response.currentPage;
                var pageGroup = response.pageGroup;
                var pageCount = response.pageCount;
                
                $("#usedCarList").empty();
               
                $.each(tradeList, function(i, v) {
                    let result =
                        '<tr>'
                        + '<td><img src="./resources/upload/' + v.cimg + ' " style="width:100px;"></td>'
                        + '<td>'
                        + '  <h5>'
                        + '    <a href="TradeBoardDetail?ucno=' + v.ucno + '&pageNum=' + currentPage + '&type=' + type + '&keyword=' + keyword + '" class="text-decoration-none link-secondary">' + v.cname + '</a>'
                        + '  </h5>'
                        + '  <pre>' + v.cyear + '년식 | ' + v.cmileage + 'km | ' + v.carea + ' | ' + v.ccolor + '\n' + v.cshortment + '</pre>'
                        + '</td>'
                        + '<td>' + (v.cprice / 10000).toFixed(0) + ' 만원</td>'
                        + '<td>' + v.cseller + '</td>'
                        + '</tr>';
                    $("#usedCarList").append(result);
                });
                
                $("#pageNavigation").empty();
                
                let pageNavigation = '<nav aria-label="Page navigation"><ul class="pagination justify-content-center">';
                
                // 이전 버튼
                if (startPage > pageGroup) {
                    pageNavigation += '<li class="page-item">';
                    pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (startPage - pageGroup) + ', \'' + type + '\', \'' + keyword + '\')">Pre</a>';
                    pageNavigation += '</li>';
                }

                // 페이지 번호
                for (let i = startPage; i <= endPage; i++) {
                    if (i === currentPage) {
                        pageNavigation += '<li class="page-item active" aria-current="page">';
                        pageNavigation += '<span class="page-link">' + i + '</span>';
                        pageNavigation += '</li>';
                    } else {
                        pageNavigation += '<li class="page-item">';
                        pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + i + ', \'' + type + '\', \'' + keyword + '\')">' + i + '</a>';
                        pageNavigation += '</li>';
                    }
                }

                // 다음 버튼
                if (endPage < pageCount) {
                    pageNavigation += '<li class="page-item">';
                    pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (startPage + pageGroup) + ', \'' + type + '\', \'' + keyword + '\')">Next</a>';
                    pageNavigation += '</li>';
                }
                
                pageNavigation += '</ul></nav>';
                $("#pageNavigation").append(pageNavigation);
            },
            error: function(xhr, status, error) {
                console.error("AJAX 실패: ", status, error); // 오류 정보를 콘솔에 출력
                alert('중고차 리스트를 가져오는 데 실패했습니다.');
            }
        });
    }
    
 // 중고차 마일리지 선택 시 AJAX 요청
    $('#cmileage li').on('click', function() {
        var type = $('#cmileage').data('type');
        var keyword = $(this).data('value');

        $.ajax({
            url: 'used_car_board.ajax',
            type: 'GET',
            dataType: 'json',
            data: {
                type: type,
                keyword: keyword,
                pageNum: 1 
            },
            success: function(response) {
                var tradeList = response.tradeBoardList;
                var startPage = response.startPage;
                var endPage = response.endPage;
                var currentPage = response.currentPage;
                var pageGroup = response.pageGroup;
                var pageCount = response.pageCount;
                
                $("#usedCarList").empty();
               
                $.each(tradeList, function(i, v) {
                    let result =
                        '<tr>'
                    	+ '<td><img src="./resources/upload/' + v.cimg + ' " style="width:200px; height:100px"></td>'
                        + '<td>'
                        + '  <h5>'
                        + '    <a href="TradeBoardDetail?ucno=' + v.ucno + '&pageNum=' + currentPage + '&type=' + type + '&keyword=' + keyword + '" class="text-decoration-none link-secondary">'+ v.cmanufacturer + ' ' + v.cname + '</a>'
                        + '  </h5>'
                        + '  <pre>' + v.cyear + '년식 | ' + v.cmileage + 'km | ' + v.carea + ' | ' + v.ccolor + '\n' + v.cshortment + '</pre>'
                        + '</td>'
                        + '<td>' + (v.cprice / 10000).toFixed(0) + ' 만원</td>'
                        + '<td>' + v.cseller + '</td>'
                        + '</tr>';
                    $("#usedCarList").append(result);
                });
                
                $("#pageNavigation").empty();
                
                let pageNavigation = '<nav aria-label="Page navigation"><ul class="pagination justify-content-center">';
                
                // 이전 버튼
                if (startPage > pageGroup) {
                    pageNavigation += '<li class="page-item">';
                    pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (startPage - pageGroup) + ', \'' + type + '\', \'' + keyword + '\')">Pre</a>';
                    pageNavigation += '</li>';
                }

                // 페이지 번호
                for (let i = startPage; i <= endPage; i++) {
                    if (i === currentPage) {
                        pageNavigation += '<li class="page-item active" aria-current="page">';
                        pageNavigation += '<span class="page-link">' + i + '</span>';
                        pageNavigation += '</li>';
                    } else {
                        pageNavigation += '<li class="page-item">';
                        pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + i + ', \'' + type + '\', \'' + keyword + '\')">' + i + '</a>';
                        pageNavigation += '</li>';
                    }
                }

                // 다음 버튼
                if (endPage < pageCount) {
                    pageNavigation += '<li class="page-item">';
                    pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (startPage + pageGroup) + ', \'' + type + '\', \'' + keyword + '\')">Next</a>';
                    pageNavigation += '</li>';
                }
                
                pageNavigation += '</ul></nav>';
                $("#pageNavigation").append(pageNavigation);
            },
            error: function(xhr, status, error) {
                console.error("AJAX 실패: ", status, error); // 오류 정보를 콘솔에 출력
                alert('중고차 리스트를 가져오는 데 실패했습니다.');
            }
        });
    });

    window.loadPage = function(pageNum, type, keyword) {
        $.ajax({
            url: 'used_car_board.ajax',
            type: 'GET',
            dataType: 'json',
            data: {
                type: type,
                keyword: keyword,
                pageNum: pageNum
            },
            success: function(response) {
                var tradeList = response.tradeBoardList;
                var startPage = response.startPage;
                var endPage = response.endPage;
                var currentPage = response.currentPage;
                var pageGroup = response.pageGroup;
                var pageCount = response.pageCount;
                
                $("#usedCarList").empty();
               
                $.each(tradeList, function(i, v) {
                    let result =
                        '<tr>'
                        + '<td><img src="./resources/upload/' + v.cimg + ' " style="width:100px;"></td>'
                        + '<td>'
                        + '  <h5>'
                        + '    <a href="TradeBoardDetail?ucno=' + v.ucno + '&pageNum=' + currentPage + '&type=' + type + '&keyword=' + keyword + '" class="text-decoration-none link-secondary">' + v.cname + '</a>'
                        + '  </h5>'
                        + '  <pre>' + v.cyear + '년식 | ' + v.cmileage + 'km | ' + v.carea + ' | ' + v.ccolor + '\n' + v.cshortment + '</pre>'
                        + '</td>'
                        + '<td>' + (v.cprice / 10000).toFixed(0) + ' 만원</td>'
                        + '<td>' + v.cseller + '</td>'
                        + '</tr>';
                    $("#usedCarList").append(result);
                });
                
                $("#pageNavigation").empty();
                
                let pageNavigation = '<nav aria-label="Page navigation"><ul class="pagination justify-content-center">';
                
                // 이전 버튼
                if (startPage > pageGroup) {
                    pageNavigation += '<li class="page-item">';
                    pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (startPage - pageGroup) + ', \'' + type + '\', \'' + keyword + '\')">Pre</a>';
                    pageNavigation += '</li>';
                }

                // 페이지 번호
                for (let i = startPage; i <= endPage; i++) {
                    if (i === currentPage) {
                        pageNavigation += '<li class="page-item active" aria-current="page">';
                        pageNavigation += '<span class="page-link">' + i + '</span>';
                        pageNavigation += '</li>';
                    } else {
                        pageNavigation += '<li class="page-item">';
                        pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + i + ', \'' + type + '\', \'' + keyword + '\')">' + i + '</a>';
                        pageNavigation += '</li>';
                    }
                }

                // 다음 버튼
                if (endPage < pageCount) {
                    pageNavigation += '<li class="page-item">';
                    pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (startPage + pageGroup) + ', \'' + type + '\', \'' + keyword + '\')">Next</a>';
                    pageNavigation += '</li>';
                }
                
                pageNavigation += '</ul></nav>';
                $("#pageNavigation").append(pageNavigation);
            },
            error: function(xhr, status, error) {
                console.error("AJAX 실패: ", status, error); // 오류 정보를 콘솔에 출력
                alert('중고차 리스트를 가져오는 데 실패했습니다.');
            }
        });
    }
    
 // 중고차 지역 선택 시 AJAX 요청
    $('#carea li').on('click', function() {
        var type = $('#carea').data('type');
        var keyword = $(this).data('value');

        $.ajax({
            url: 'used_car_board.ajax',
            type: 'GET',
            dataType: 'json',
            data: {
                type: type,
                keyword: keyword,
                pageNum: 1 
            },
            success: function(response) {
                var tradeList = response.tradeBoardList;
                var startPage = response.startPage;
                var endPage = response.endPage;
                var currentPage = response.currentPage;
                var pageGroup = response.pageGroup;
                var pageCount = response.pageCount;
                
                $("#usedCarList").empty();
               
                $.each(tradeList, function(i, v) {
                    let result =
                        '<tr>'
                    	+ '<td><img src="./resources/upload/' + v.cimg + ' " style="width:200px; height:100px"></td>'
                        + '<td>'
                        + '  <h5>'
                        + '    <a href="TradeBoardDetail?ucno=' + v.ucno + '&pageNum=' + currentPage + '&type=' + type + '&keyword=' + keyword + '" class="text-decoration-none link-secondary">'+ v.cmanufacturer + ' ' + v.cname + '</a>'
                        + '  </h5>'
                        + '  <pre>' + v.cyear + '년식 | ' + v.cmileage + 'km | ' + v.carea + ' | ' + v.ccolor + '\n' + v.cshortment + '</pre>'
                        + '</td>'
                        + '<td>' + (v.cprice / 10000).toFixed(0) + ' 만원</td>'
                        + '<td>' + v.cseller + '</td>'
                        + '</tr>';
                    $("#usedCarList").append(result);
                });
                
                $("#pageNavigation").empty();
                
                let pageNavigation = '<nav aria-label="Page navigation"><ul class="pagination justify-content-center">';
                
                // 이전 버튼
                if (startPage > pageGroup) {
                    pageNavigation += '<li class="page-item">';
                    pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (startPage - pageGroup) + ', \'' + type + '\', \'' + keyword + '\')">Pre</a>';
                    pageNavigation += '</li>';
                }

                // 페이지 번호
                for (let i = startPage; i <= endPage; i++) {
                    if (i === currentPage) {
                        pageNavigation += '<li class="page-item active" aria-current="page">';
                        pageNavigation += '<span class="page-link">' + i + '</span>';
                        pageNavigation += '</li>';
                    } else {
                        pageNavigation += '<li class="page-item">';
                        pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + i + ', \'' + type + '\', \'' + keyword + '\')">' + i + '</a>';
                        pageNavigation += '</li>';
                    }
                }

                // 다음 버튼
                if (endPage < pageCount) {
                    pageNavigation += '<li class="page-item">';
                    pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (startPage + pageGroup) + ', \'' + type + '\', \'' + keyword + '\')">Next</a>';
                    pageNavigation += '</li>';
                }
                
                pageNavigation += '</ul></nav>';
                $("#pageNavigation").append(pageNavigation);
            },
            error: function(xhr, status, error) {
                console.error("AJAX 실패: ", status, error); // 오류 정보를 콘솔에 출력
                alert('중고차 리스트를 가져오는 데 실패했습니다.');
            }
        });
    });

    window.loadPage = function(pageNum, type, keyword) {
        $.ajax({
            url: 'used_car_board.ajax',
            type: 'GET',
            dataType: 'json',
            data: {
                type: type,
                keyword: keyword,
                pageNum: pageNum
            },
            success: function(response) {
                var tradeList = response.tradeBoardList;
                var startPage = response.startPage;
                var endPage = response.endPage;
                var currentPage = response.currentPage;
                var pageGroup = response.pageGroup;
                var pageCount = response.pageCount;
                
                $("#usedCarList").empty();
               
                $.each(tradeList, function(i, v) {
                    let result =
                        '<tr>'
                        + '<td><img src="./resources/upload/' + v.cimg + ' " style="width:100px;"></td>'
                        + '<td>'
                        + '  <h5>'
                        + '    <a href="TradeBoardDetail?ucno=' + v.ucno + '&pageNum=' + currentPage + '&type=' + type + '&keyword=' + keyword + '" class="text-decoration-none link-secondary">' + v.cname + '</a>'
                        + '  </h5>'
                        + '  <pre>' + v.cyear + '년식 | ' + v.cmileage + 'km | ' + v.carea + ' | ' + v.ccolor + '\n' + v.cshortment + '</pre>'
                        + '</td>'
                        + '<td>' + (v.cprice / 10000).toFixed(0) + ' 만원</td>'
                        + '<td>' + v.cseller + '</td>'
                        + '</tr>';
                    $("#usedCarList").append(result);
                });
                
                $("#pageNavigation").empty();
                
                let pageNavigation = '<nav aria-label="Page navigation"><ul class="pagination justify-content-center">';
                
                // 이전 버튼
                if (startPage > pageGroup) {
                    pageNavigation += '<li class="page-item">';
                    pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (startPage - pageGroup) + ', \'' + type + '\', \'' + keyword + '\')">Pre</a>';
                    pageNavigation += '</li>';
                }

                // 페이지 번호
                for (let i = startPage; i <= endPage; i++) {
                    if (i === currentPage) {
                        pageNavigation += '<li class="page-item active" aria-current="page">';
                        pageNavigation += '<span class="page-link">' + i + '</span>';
                        pageNavigation += '</li>';
                    } else {
                        pageNavigation += '<li class="page-item">';
                        pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + i + ', \'' + type + '\', \'' + keyword + '\')">' + i + '</a>';
                        pageNavigation += '</li>';
                    }
                }

                // 다음 버튼
                if (endPage < pageCount) {
                    pageNavigation += '<li class="page-item">';
                    pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (startPage + pageGroup) + ', \'' + type + '\', \'' + keyword + '\')">Next</a>';
                    pageNavigation += '</li>';
                }
                
                pageNavigation += '</ul></nav>';
                $("#pageNavigation").append(pageNavigation);
            },
            error: function(xhr, status, error) {
                console.error("AJAX 실패: ", status, error); // 오류 정보를 콘솔에 출력
                alert('중고차 리스트를 가져오는 데 실패했습니다.');
            }
        });
    }
    
 // 중고차 색상 선택 시 AJAX 요청
    $('#ccolor li').on('click', function() {
        var type = $('#ccolor').data('type');
        var keyword = $(this).data('value');

        $.ajax({
            url: 'used_car_board.ajax',
            type: 'GET',
            dataType: 'json',
            data: {
                type: type,
                keyword: keyword,
                pageNum: 1 
            },
            success: function(response) {
                var tradeList = response.tradeBoardList;
                var startPage = response.startPage;
                var endPage = response.endPage;
                var currentPage = response.currentPage;
                var pageGroup = response.pageGroup;
                var pageCount = response.pageCount;
                
                $("#usedCarList").empty();
               
                $.each(tradeList, function(i, v) {
                    let result =
                        '<tr>'
                    	+ '<td><img src="./resources/upload/' + v.cimg + ' " style="width:200px; height:100px"></td>'
                        + '<td>'
                        + '  <h5>'
                        + '    <a href="TradeBoardDetail?ucno=' + v.ucno + '&pageNum=' + currentPage + '&type=' + type + '&keyword=' + keyword + '" class="text-decoration-none link-secondary">'+ v.cmanufacturer + ' ' + v.cname + '</a>'
                        + '  </h5>'
                        + '  <pre>' + v.cyear + '년식 | ' + v.cmileage + 'km | ' + v.carea + ' | ' + v.ccolor + '\n' + v.cshortment + '</pre>'
                        + '</td>'
                        + '<td>' + (v.cprice / 10000).toFixed(0) + ' 만원</td>'
                        + '<td>' + v.cseller + '</td>'
                        + '</tr>';
                    $("#usedCarList").append(result);
                });
                
                $("#pageNavigation").empty();
                
                let pageNavigation = '<nav aria-label="Page navigation"><ul class="pagination justify-content-center">';
                
                // 이전 버튼
                if (startPage > pageGroup) {
                    pageNavigation += '<li class="page-item">';
                    pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (startPage - pageGroup) + ', \'' + type + '\', \'' + keyword + '\')">Pre</a>';
                    pageNavigation += '</li>';
                }

                // 페이지 번호
                for (let i = startPage; i <= endPage; i++) {
                    if (i === currentPage) {
                        pageNavigation += '<li class="page-item active" aria-current="page">';
                        pageNavigation += '<span class="page-link">' + i + '</span>';
                        pageNavigation += '</li>';
                    } else {
                        pageNavigation += '<li class="page-item">';
                        pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + i + ', \'' + type + '\', \'' + keyword + '\')">' + i + '</a>';
                        pageNavigation += '</li>';
                    }
                }

                // 다음 버튼
                if (endPage < pageCount) {
                    pageNavigation += '<li class="page-item">';
                    pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (startPage + pageGroup) + ', \'' + type + '\', \'' + keyword + '\')">Next</a>';
                    pageNavigation += '</li>';
                }
                
                pageNavigation += '</ul></nav>';
                $("#pageNavigation").append(pageNavigation);
            },
            error: function(xhr, status, error) {
                console.error("AJAX 실패: ", status, error); // 오류 정보를 콘솔에 출력
                alert('중고차 리스트를 가져오는 데 실패했습니다.');
            }
        });
    });

    window.loadPage = function(pageNum, type, keyword) {
        $.ajax({
            url: 'used_car_board.ajax',
            type: 'GET',
            dataType: 'json',
            data: {
                type: type,
                keyword: keyword,
                pageNum: pageNum
            },
            success: function(response) {
                var tradeList = response.tradeBoardList;
                var startPage = response.startPage;
                var endPage = response.endPage;
                var currentPage = response.currentPage;
                var pageGroup = response.pageGroup;
                var pageCount = response.pageCount;
                
                $("#usedCarList").empty();
               
                $.each(tradeList, function(i, v) {
                    let result =
                        '<tr>'
                        + '<td><img src="./resources/upload/' + v.cimg + ' " style="width:100px;"></td>'
                        + '<td>'
                        + '  <h5>'
                        + '    <a href="TradeBoardDetail?ucno=' + v.ucno + '&pageNum=' + currentPage + '&type=' + type + '&keyword=' + keyword + '" class="text-decoration-none link-secondary">' + v.cname + '</a>'
                        + '  </h5>'
                        + '  <pre>' + v.cyear + '년식 | ' + v.cmileage + 'km | ' + v.carea + ' | ' + v.ccolor + '\n' + v.cshortment + '</pre>'
                        + '</td>'
                        + '<td>' + (v.cprice / 10000).toFixed(0) + ' 만원</td>'
                        + '<td>' + v.cseller + '</td>'
                        + '</tr>';
                    $("#usedCarList").append(result);
                });
                
                $("#pageNavigation").empty();
                
                let pageNavigation = '<nav aria-label="Page navigation"><ul class="pagination justify-content-center">';
                
                // 이전 버튼
                if (startPage > pageGroup) {
                    pageNavigation += '<li class="page-item">';
                    pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (startPage - pageGroup) + ', \'' + type + '\', \'' + keyword + '\')">Pre</a>';
                    pageNavigation += '</li>';
                }

                // 페이지 번호
                for (let i = startPage; i <= endPage; i++) {
                    if (i === currentPage) {
                        pageNavigation += '<li class="page-item active" aria-current="page">';
                        pageNavigation += '<span class="page-link">' + i + '</span>';
                        pageNavigation += '</li>';
                    } else {
                        pageNavigation += '<li class="page-item">';
                        pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + i + ', \'' + type + '\', \'' + keyword + '\')">' + i + '</a>';
                        pageNavigation += '</li>';
                    }
                }

                // 다음 버튼
                if (endPage < pageCount) {
                    pageNavigation += '<li class="page-item">';
                    pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (startPage + pageGroup) + ', \'' + type + '\', \'' + keyword + '\')">Next</a>';
                    pageNavigation += '</li>';
                }
                
                pageNavigation += '</ul></nav>';
                $("#pageNavigation").append(pageNavigation);
            },
            error: function(xhr, status, error) {
                console.error("AJAX 실패: ", status, error); // 오류 정보를 콘솔에 출력
                alert('중고차 리스트를 가져오는 데 실패했습니다.');
            }
        });
    }
    
 // 중고차 연료 선택 시 AJAX 요청
    $('#cfuelType li').on('click', function() {
        var type = $('#cfuelType').data('type');
        var keyword = $(this).data('value');

        $.ajax({
            url: 'used_car_board.ajax',
            type: 'GET',
            dataType: 'json',
            data: {
                type: type,
                keyword: keyword,
                pageNum: 1 
            },
            success: function(response) {
                var tradeList = response.tradeBoardList;
                var startPage = response.startPage;
                var endPage = response.endPage;
                var currentPage = response.currentPage;
                var pageGroup = response.pageGroup;
                var pageCount = response.pageCount;
                
                $("#usedCarList").empty();
               
                $.each(tradeList, function(i, v) {
                    let result =
                        '<tr>'
                    	+ '<td><img src="./resources/upload/' + v.cimg + ' " style="width:200px; height:100px"></td>'
                        + '<td>'
                        + '  <h5>'
                        + '    <a href="TradeBoardDetail?ucno=' + v.ucno + '&pageNum=' + currentPage + '&type=' + type + '&keyword=' + keyword + '" class="text-decoration-none link-secondary">'+ v.cmanufacturer + ' ' + v.cname + '</a>'
                        + '  </h5>'
                        + '  <pre>' + v.cyear + '년식 | ' + v.cmileage + 'km | ' + v.carea + ' | ' + v.ccolor + '\n' + v.cshortment + '</pre>'
                        + '</td>'
                        + '<td>' + (v.cprice / 10000).toFixed(0) + ' 만원</td>'
                        + '<td>' + v.cseller + '</td>'
                        + '</tr>';
                    $("#usedCarList").append(result);
                });
                
                $("#pageNavigation").empty();
                
                let pageNavigation = '<nav aria-label="Page navigation"><ul class="pagination justify-content-center">';
                
                // 이전 버튼
                if (startPage > pageGroup) {
                    pageNavigation += '<li class="page-item">';
                    pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (startPage - pageGroup) + ', \'' + type + '\', \'' + keyword + '\')">Pre</a>';
                    pageNavigation += '</li>';
                }

                // 페이지 번호
                for (let i = startPage; i <= endPage; i++) {
                    if (i === currentPage) {
                        pageNavigation += '<li class="page-item active" aria-current="page">';
                        pageNavigation += '<span class="page-link">' + i + '</span>';
                        pageNavigation += '</li>';
                    } else {
                        pageNavigation += '<li class="page-item">';
                        pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + i + ', \'' + type + '\', \'' + keyword + '\')">' + i + '</a>';
                        pageNavigation += '</li>';
                    }
                }

                // 다음 버튼
                if (endPage < pageCount) {
                    pageNavigation += '<li class="page-item">';
                    pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (startPage + pageGroup) + ', \'' + type + '\', \'' + keyword + '\')">Next</a>';
                    pageNavigation += '</li>';
                }
                
                pageNavigation += '</ul></nav>';
                $("#pageNavigation").append(pageNavigation);
            },
            error: function(xhr, status, error) {
                console.error("AJAX 실패: ", status, error); // 오류 정보를 콘솔에 출력
                alert('중고차 리스트를 가져오는 데 실패했습니다.');
            }
        });
    });

    window.loadPage = function(pageNum, type, keyword) {
        $.ajax({
            url: 'used_car_board.ajax',
            type: 'GET',
            dataType: 'json',
            data: {
                type: type,
                keyword: keyword,
                pageNum: pageNum
            },
            success: function(response) {
                var tradeList = response.tradeBoardList;
                var startPage = response.startPage;
                var endPage = response.endPage;
                var currentPage = response.currentPage;
                var pageGroup = response.pageGroup;
                var pageCount = response.pageCount;
                
                $("#usedCarList").empty();
               
                $.each(tradeList, function(i, v) {
                    let result =
                        '<tr>'
                        + '<td><img src="./resources/upload/' + v.cimg + ' " style="width:100px;"></td>'
                        + '<td>'
                        + '  <h5>'
                        + '    <a href="TradeBoardDetail?ucno=' + v.ucno + '&pageNum=' + currentPage + '&type=' + type + '&keyword=' + keyword + '" class="text-decoration-none link-secondary">' + v.cname + '</a>'
                        + '  </h5>'
                        + '  <pre>' + v.cyear + '년식 | ' + v.cmileage + 'km | ' + v.carea + ' | ' + v.ccolor + '\n' + v.cshortment + '</pre>'
                        + '</td>'
                        + '<td>' + (v.cprice / 10000).toFixed(0) + ' 만원</td>'
                        + '<td>' + v.cseller + '</td>'
                        + '</tr>';
                    $("#usedCarList").append(result);
                });
                
                $("#pageNavigation").empty();
                
                let pageNavigation = '<nav aria-label="Page navigation"><ul class="pagination justify-content-center">';
                
                // 이전 버튼
                if (startPage > pageGroup) {
                    pageNavigation += '<li class="page-item">';
                    pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (startPage - pageGroup) + ', \'' + type + '\', \'' + keyword + '\')">Pre</a>';
                    pageNavigation += '</li>';
                }

                // 페이지 번호
                for (let i = startPage; i <= endPage; i++) {
                    if (i === currentPage) {
                        pageNavigation += '<li class="page-item active" aria-current="page">';
                        pageNavigation += '<span class="page-link">' + i + '</span>';
                        pageNavigation += '</li>';
                    } else {
                        pageNavigation += '<li class="page-item">';
                        pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + i + ', \'' + type + '\', \'' + keyword + '\')">' + i + '</a>';
                        pageNavigation += '</li>';
                    }
                }

                // 다음 버튼
                if (endPage < pageCount) {
                    pageNavigation += '<li class="page-item">';
                    pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (startPage + pageGroup) + ', \'' + type + '\', \'' + keyword + '\')">Next</a>';
                    pageNavigation += '</li>';
                }
                
                pageNavigation += '</ul></nav>';
                $("#pageNavigation").append(pageNavigation);
            },
            error: function(xhr, status, error) {
                console.error("AJAX 실패: ", status, error); // 오류 정보를 콘솔에 출력
                alert('중고차 리스트를 가져오는 데 실패했습니다.');
            }
        });
    }
    
 // 중고차 미션 선택 시 AJAX 요청
    $('#ctransmission li').on('click', function() {
        var type = $('#ctransmission').data('type');
        var keyword = $(this).data('value');

        $.ajax({
            url: 'used_car_board.ajax',
            type: 'GET',
            dataType: 'json',
            data: {
                type: type,
                keyword: keyword,
                pageNum: 1 
            },
            success: function(response) {
                var tradeList = response.tradeBoardList;
                var startPage = response.startPage;
                var endPage = response.endPage;
                var currentPage = response.currentPage;
                var pageGroup = response.pageGroup;
                var pageCount = response.pageCount;
                
                $("#usedCarList").empty();
               
                $.each(tradeList, function(i, v) {
                    let result =
                        '<tr>'
                    	+ '<td><img src="./resources/upload/' + v.cimg + ' " style="width:200px; height:100px"></td>'
                        + '<td>'
                        + '  <h5>'
                        + '    <a href="TradeBoardDetail?ucno=' + v.ucno + '&pageNum=' + currentPage + '&type=' + type + '&keyword=' + keyword + '" class="text-decoration-none link-secondary">'+ v.cmanufacturer + ' ' + v.cname + '</a>'
                        + '  </h5>'
                        + '  <pre>' + v.cyear + '년식 | ' + v.cmileage + 'km | ' + v.carea + ' | ' + v.ccolor + '\n' + v.cshortment + '</pre>'
                        + '</td>'
                        + '<td>' + (v.cprice / 10000).toFixed(0) + ' 만원</td>'
                        + '<td>' + v.cseller + '</td>'
                        + '</tr>';
                    $("#usedCarList").append(result);
                });
                
                $("#pageNavigation").empty();
                
                let pageNavigation = '<nav aria-label="Page navigation"><ul class="pagination justify-content-center">';
                
                // 이전 버튼
                if (startPage > pageGroup) {
                    pageNavigation += '<li class="page-item">';
                    pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (startPage - pageGroup) + ', \'' + type + '\', \'' + keyword + '\')">Pre</a>';
                    pageNavigation += '</li>';
                }

                // 페이지 번호
                for (let i = startPage; i <= endPage; i++) {
                    if (i === currentPage) {
                        pageNavigation += '<li class="page-item active" aria-current="page">';
                        pageNavigation += '<span class="page-link">' + i + '</span>';
                        pageNavigation += '</li>';
                    } else {
                        pageNavigation += '<li class="page-item">';
                        pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + i + ', \'' + type + '\', \'' + keyword + '\')">' + i + '</a>';
                        pageNavigation += '</li>';
                    }
                }

                // 다음 버튼
                if (endPage < pageCount) {
                    pageNavigation += '<li class="page-item">';
                    pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (startPage + pageGroup) + ', \'' + type + '\', \'' + keyword + '\')">Next</a>';
                    pageNavigation += '</li>';
                }
                
                pageNavigation += '</ul></nav>';
                $("#pageNavigation").append(pageNavigation);
            },
            error: function(xhr, status, error) {
                console.error("AJAX 실패: ", status, error); // 오류 정보를 콘솔에 출력
                alert('중고차 리스트를 가져오는 데 실패했습니다.');
            }
        });
    });

    window.loadPage = function(pageNum, type, keyword) {
        $.ajax({
            url: 'used_car_board.ajax',
            type: 'GET',
            dataType: 'json',
            data: {
                type: type,
                keyword: keyword,
                pageNum: pageNum
            },
            success: function(response) {
                var tradeList = response.tradeBoardList;
                var startPage = response.startPage;
                var endPage = response.endPage;
                var currentPage = response.currentPage;
                var pageGroup = response.pageGroup;
                var pageCount = response.pageCount;
                
                $("#usedCarList").empty();
               
                $.each(tradeList, function(i, v) {
                    let result =
                        '<tr>'
                        + '<td><img src="./resources/upload/' + v.cimg + ' " style="width:100px;"></td>'
                        + '<td>'
                        + '  <h5>'
                        + '    <a href="TradeBoardDetail?ucno=' + v.ucno + '&pageNum=' + currentPage + '&type=' + type + '&keyword=' + keyword + '" class="text-decoration-none link-secondary">' + v.cname + '</a>'
                        + '  </h5>'
                        + '  <pre>' + v.cyear + '년식 | ' + v.cmileage + 'km | ' + v.carea + ' | ' + v.ccolor + '\n' + v.cshortment + '</pre>'
                        + '</td>'
                        + '<td>' + (v.cprice / 10000).toFixed(0) + ' 만원</td>'
                        + '<td>' + v.cseller + '</td>'
                        + '</tr>';
                    $("#usedCarList").append(result);
                });
                
                $("#pageNavigation").empty();
                
                let pageNavigation = '<nav aria-label="Page navigation"><ul class="pagination justify-content-center">';
                
                // 이전 버튼
                if (startPage > pageGroup) {
                    pageNavigation += '<li class="page-item">';
                    pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (startPage - pageGroup) + ', \'' + type + '\', \'' + keyword + '\')">Pre</a>';
                    pageNavigation += '</li>';
                }

                // 페이지 번호
                for (let i = startPage; i <= endPage; i++) {
                    if (i === currentPage) {
                        pageNavigation += '<li class="page-item active" aria-current="page">';
                        pageNavigation += '<span class="page-link">' + i + '</span>';
                        pageNavigation += '</li>';
                    } else {
                        pageNavigation += '<li class="page-item">';
                        pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + i + ', \'' + type + '\', \'' + keyword + '\')">' + i + '</a>';
                        pageNavigation += '</li>';
                    }
                }

                // 다음 버튼
                if (endPage < pageCount) {
                    pageNavigation += '<li class="page-item">';
                    pageNavigation += '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (startPage + pageGroup) + ', \'' + type + '\', \'' + keyword + '\')">Next</a>';
                    pageNavigation += '</li>';
                }
                
                pageNavigation += '</ul></nav>';
                $("#pageNavigation").append(pageNavigation);
            },
            error: function(xhr, status, error) {
                console.error("AJAX 실패: ", status, error); // 오류 정보를 콘솔에 출력
                alert('중고차 리스트를 가져오는 데 실패했습니다.');
            }
        });
    }




    
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
