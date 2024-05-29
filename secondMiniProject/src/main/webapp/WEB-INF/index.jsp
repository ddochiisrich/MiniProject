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
<script src="resources/js/tradeformcheck.js"></script>
<link rel="stylesheet" href="resources/css/style.css">

</head>
<body>
	<div class="container">
		<%@ include file="template/header.jsp" %>
		<jsp:include page="${param.body}" />
		<%@ include file="template/footer.jsp" %>
	</div>
	
	<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
</body>
</html>