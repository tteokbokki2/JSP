<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
<style>

</style>
</head>
<body>
	<!-- ex15_set.jsp -->
	<h1>세션값 저장하기</h1>
	<%
		
		session.setAttribute("data", "홍길동");
		
	%>
	<div><a href="ex15_session.jsp">돌아가기</a></div>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
	<script>
		
		
	
	</script>

</body>
</html>