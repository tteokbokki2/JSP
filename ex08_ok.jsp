
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

   //POST > 한글 인코딩
   request.setCharacterEncoding("UTF-8");

	//텍스트 박스
	//1. 텍스트를 입력하면 입력값 반환
	//2. 해당 컨트롤이 존재하는데 텍스트를 입력하지 않으면 빈문자열 반환
	//3. 해당 컨트롤이 없으면(Key 오류) null 반환
   String txt1 = request.getParameter("txt1");
   
   //System.out.println(txt1 == null);      //false
   //System.out.println(txt1.equals(""));   //true
   
   
   //암호 박스
   String txt2 = request.getParameter("txt2");
   
   
   //다중 텍스트
   String txt3 = request.getParameter("txt3");

   //다중 텍스트 - 엔터 넣기
   txt3 = txt3.replace("\r\n", "<br>");
   
   //체크 박스
   //1. value 없을 때는 체크하면 "on", 체크 하지 않으면 null
   //2. value 있을 때(태그 내에 값을 입력)는 체크하면 값이 반환, 체크 하지 않으면 null 
   String cb1 = request.getParameter("cb1");
   
   //체크 박스들
   /* String cb2 = request.getParameter("cb2");
   String cb3 = request.getParameter("cb3");
   String cb4 = request.getParameter("cb4");
   
   String temp = "";
   temp += cb2 + ",";
   temp += cb3 + ",";
   temp += cb4 + ","; */
   
   //체크 박스들 일괄처리
   /* String temp = "";
   
   for (int i=2; i<=4; i++) {
   temp += request.getParameter("cb" + i) + ",";	   
   } */
   
	//String cb5 = request.getParameter("cb5"); //독서만 넘어감, name이 1개일 때
   
	//동일한 name의 컨트롤이 여러개 전송될 때
	String[] cb5 = request.getParameterValues("cb5");

	//라디오 버튼
	String rb = request.getParameter("rb");
	
	//셀렉트 박스
	String sel1 = request.getParameter("sel1");
	
	
	//다중 셀렉트 박스
	String[] sel2 = request.getParameterValues("sel2");
	
	//히든 태그
	String txt4 = request.getParameter("txt4");
	
	String count = request.getParameter("count");
	
	String regdate = request.getParameter("regdate");
	
	String min = request.getParameter("min");
	
	String color = request.getParameter("color");
	
	
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
<style>
	body {
		padding
	}
</style>
</head>
<body>
   <!-- ex08_ok.jsp -->
   <h1>결과</h1>
   
   <h2>텍스트 박스</h2>
   <div><%= txt1 %></div>

   <h2>암호 박스</h2>
   <div><%= txt2 %></div>
   
   <h2>다중 텍스트</h2>
   <div><%= txt3 %></div>
   
   <h2>체크 박스</h2>
   <div><%= cb1 %></div>
   
   <%-- 
   <h2>체크 박스들</h2>
   <div><%= temp %></div> 
   --%>   
   
   <h2>체크 박스들</h2>
   <div><%= Arrays.toString(cb5) %></div>   
   
   <h2>라디오 버튼</h2>
   <div><%= rb %></div>

	<h2>셀렉트 박스</h2>
	<div><%= sel1 %></div>
	
	<h2>셀렉트 박스</h2>
	<div><%= Arrays.toString(sel2) %></div>
	
	<h2>히든 태그</h2>
	<div><%= txt4 %></div>
	
	<h2>히든 태그</h2>
	<div><%= count %>번 클릭!</div>
	 
	<h2>날짜</h2>
	<div><%= regdate %></div>
	
	<h2>범위</h2>
	<div><%= min %></div>
	
	<!-- #8c2c2c -->
	<h2>색상</h2>
	<div style="background-color: <%= color %>;"><%= color %></div>
	
	<h2>아이디, 암호</h2>
	<div><%= id %>, <%= pw %></div>
   
   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
   <script>
      

   </script>

</body>
</html>