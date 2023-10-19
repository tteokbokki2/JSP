<%@page import="com.test.jsp.Score"%>
<%@page import="java.util.HashMap"%>
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
	<!-- ex20_el.jsp -->
	<h1>EL</h1>
	
	<%
		int a = 10;
		pageContext.setAttribute("b", 20);
		request.setAttribute("c", 30);
	%>
	
	<h2>표현식</h2>
	<div>a: <%= a %></div>
	<div>b: <%= pageContext.getAttribute("b") %></div>
	<div>c: <%= request.getAttribute("c") %></div>
	
	<!-- 
		*** EL은 일반 자원(지역변수, 멤버변수)은 출력할 수 없다.
		*** EL은 내장 객체(pageContext, request, session, application)안에 있는 데이터만 전용으로 출력하는 표현식임
	-->
	
	<h2>EL</h2>
	<div>a: ${a}</div>
	<div>b: ${pageContext.getAttribute("b")}</div>
	<div>c: ${request.getAttribute("c")}</div>
	
	<div>b: ${b}</div>
	<div>c: ${c}</div>
	
	<hr>
	
	<h3>EL 연산 기능</h3>
	<div>b + 10 = ?</div>
	<div>b + 10 = <%= (int)pageContext.getAttribute("b") + 10 %></div>
	<div>b + 10 = ${b} + 10</div>
	<div>b + 10 = ${b + 10}</div>

	<div>b + 10 = ${b + 10}</div>
	<div>b - 10 = ${b - 10}</div>
	<div>b * 10 = ${b * 10}</div>
	<div>b / 10 = ${b / 10}</div>
	<div>b % 10 = ${b % 10}</div>
	<div>b mod 10 = ${b mod 10}</div>
	
	<hr>
	
	<div>b > 10 = ${b > 10}</div>
	<div>b < 10 = ${b < 10}</div>
	
	<div>b &gt; 10 = ${b > 10}</div>
	<div>b &lt; 10 = ${b < 10}</div>
	
	<div>b &gt; 10 = ${b gt 10}</div>
	<div>b &lt; 10 = ${b lt 10}</div>

	<div>b &gt;= 10 = ${b >= 10}</div>
	<div>b &gt;= 10 = ${b ge 10}</div>
	
	<div>b == 20 = ${b == 20}</div>
	<div>b != 20 = ${b != 20}</div>

	<div>b == 20 = ${b eq 20}</div>
	<div>b != 20 = ${b ne 20}</div>
	
	<hr>
	
	<!--  
		쇼트 서킷(Short-circuit)
		- true && true
		- false && true
		
	-->
	
	<div>${true && true}</div>
	<div>${true || true}</div> <!-- DeadCode -->
	<div>${!true}</div>

	<div>${false and true}</div>
	<div>${true or true}</div> <!-- DeadCode -->
	<div>${not true}</div>
	
	<hr>
	
	<div>${b > 0 ? "양수" : "음수"}</div>
	
	<hr>
	
	<div>${"문자열".equals("문자열")}</div>
	<div>${"문자열" == "문자열"}</div>
	
	<div>${"문자열" == '문자열'}</div>
	
	<hr>
	
	<%
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("kor", 100);
		map.put("eng", 90);
		map.put("math", 80);
		
		pageContext.setAttribute("map", map);	
	%>
	
	<h3>객체 출력(HashMap)</h3>
	<div>국어: <%= map.get("kor") %></div>
	<div>영어: <%= map.get("eng") %></div>
	<div>수학: <%= map.get("math") %></div>
	
	<div>국어: ${map.get("kor")}</div>
	<div>국어: ${map["kor"]}</div>
	<div>국어: ${map.kor}</div> <!-- 주로 사용 -->
	<div>영어: ${map.eng}</div>
	<div>수학: ${map.math}</div>
	
	<%
		// Score.java 파일 참고
		Score score = new Score(); 
	
		score.setKor(99);
		score.setEng(88);
		score.setMath(77);
		
		pageContext.setAttribute("score", score);
	%>
	
	<h3>객체 출력(일반 객체)</h3>
	
	<div>국어: <%= score.getKor() %></div>
	<div>국어: ${score.getKor()}</div>
	
	<!--  
		kor > get + kor > getKor > getKor()
		
		javax.el.PropertyNotFoundException: [com.test.jsp.Score] 유형에서 [kor] 특성을 읽을 수 없습니다.
	-->
	<div>국어: ${score.kor}</div>
	<div>국어: ${score["kor"]}</div>
	<div>영어: ${score.eng}</div>
	<div>수학: ${score.math}</div>
	
	<div>총점: ${score.kor} + ${score.eng} + ${score.math}</div> <!-- + 문자열 취급 -->
	<div>총점: ${score.kor + score.eng +score.math}</div>
	
	<%
	
		/*  
			*** 무언가와 충돌 할 때
			- 부모 vs 자식 > 자식
			- 넓은 범위 vs 좁은 범위 > 좁은범위
			- 두리뭉실 vs 구체적 > 구체적
		*/
		
		pageContext.setAttribute("color", "tomato"); //가장 범위가 좁은 객체
		request.setAttribute("color", "gold");
		session.setAttribute("color", "cornflowerblue");
		application.setAttribute("color", "yellowgreen");
	%>
	
	<!-- 객체가 여러가지일 경우 우선 순위? 생명주기!
	
		동일한 객체가 있을경우 EL은 순차적(생명주기 순)으로 탐색을 함
		pageContext > request >session > application -->
	<div style="background-color: ${color};">${color}</div>
	<div style="background-color: ${requestScope.color};">${requestScope.color}</div> <!-- 원하는 객체를 지정하는 코드 -->
	
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
	<script>
		
	</script>
</body>
</html>