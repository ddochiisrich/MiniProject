<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, inittial-scale=1">
<title>Bricks</title>
<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet">
<script src="resources/js/jquery-3.7.1.min.js"></script>
<script src="resources/js/trade.js"></script>
<script src="resources/js/member.js"></script>
<script src="resources/js/tradeformcheck.js"></script>
<script src="resources/js/carInfo.js"></script>
<link rel="stylesheet" href="resources/css/style.css">

<style>
body {
	background-image: url('./resources/images/background.png');
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center center;
}

.container {
	position: relative;
	background-color: white;
	padding: 20px;
	box-shadow: 0 0 15px 10px rgba(255, 255, 255, 0.5);
}

.btn_gotop {
	display: none;
	position: fixed;
	bottom: 70px;
	right: 70px;
	z-index: 999;
/* 	border: 1px solid #ccc; */
	outline: none;
	background-color: white;
/* 	color: #333; */
	cursor: pointer;
	padding: 15px 20px;
	border-radius: 10%;
}
</style>







</head>
<body class="page">
	<div class="container">
		<%@ include file="template/header.jsp"%>
		<jsp:include page="${param.body}" />
		<%@ include file="template/footer.jsp"%>
	</div>

<!-- 	<a href="#" class="btn_gotop"> <span
		class="glyphicon glyphicon-chevron-up"> </span>
	</a> -->

	<div style="position: fixed; bottom: 70px; right: 60px; z-index: 99;">
		<a href="#doz_header"> <img src="./resources/images/2240180.png"
			style="width: 100px; transform: scaleY(-1);" class="btn_gotop">
		</a>
	</div>

	<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>

	<script>
		$(window).scroll(function() {
			if ($(this).scrollTop() > 300) {
				$('.btn_gotop').show();
			} else {
				$('.btn_gotop').hide();
			}
		});
		$('.btn_gotop').click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});
	</script>


	<script>
    document.addEventListener('DOMContentLoaded', function() {
      const links = document.querySelectorAll('.link');

      links.forEach(link => {
        link.addEventListener('click', function(event) {
          event.preventDefault(); // 링크 기본 동작을 막음
          const href = this.getAttribute('href');

          document.body.classList.add('fade-out');

          setTimeout(function() {
            window.location.href = href;
          }, 500); // 2초 후에 페이지 전환
        });
      });
    });
  </script>
</body>
</html>