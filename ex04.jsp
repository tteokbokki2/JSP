<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int dan = 5;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- ex04.jsp -->
	<h1>구구단</h1>
	
	<%
		//스파게티 코드
		for (int i=1; i<=9; i++) {
	%>
			<div><%= dan %> x <%= i %> = <%= dan * i %></div>
	<%
		}
	%>

</body>
</html>