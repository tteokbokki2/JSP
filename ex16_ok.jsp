<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	//<form enctype="multipart/form-data">을 적용하면 인코딩 방식이 변경
	//1. request.getParameter() 동작 불능
	//2. request.getParameterValues() 동작 불능
	
	//cos.jar > MultipartRequest 클래스 > 객체가 request의 수신 기능 대신
	
	//String name = request.getParameter("name");
	//String age = request.getParameter("age");

	
	//업로드 된 파일을 어디에 저장할 지 경로를 지정했었는데 로컬 경로(C:\..)로 지정을 해야됨
	//- C:\class\code\server\JSPTest\src\main\webapp\files
	//- C:\class\code\server\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSPTest\files
	
	//절대 경로(상대 경로) > 로컬 경로 변환
	String path = application.getRealPath("/files");
	
	//System.out.println(path);
	
	//업로드 파일의 최대 크기
	//- 바이트 단위
	int size = 1024 * 1024 * 100; //100MB
	
	//변수 선언
	String name = ""; //이름 저장
	String age = ""; //나이 저장
	String filename = ""; //첨부파일명 저장
	String orgfilename = ""; //첨부파일명 저장
	
	//request > MultipartRequest > 객체 생성
	try {
		//MultipartRequest 객체를 만드는 순간 이미 첨부파일은 files에 복사가 완료된다.
		MultipartRequest multi = new MultipartRequest(
				request,	//원래 request
				path,		//파일 업로드 위치
				size,		//최대 크기
				"UTF-8",	//인코딩
				new DefaultFileRenamePolicy() //파일명 관리(중복시 넘버링)
				);
		
		//데이터 수신
		//name = request.getParameter("name");	//동작X
		name = multi.getParameter("name");		//동작O
		age = multi.getParameter("age");		//동작O
		
		//업로드 파일 정보 > 파일명
		//- <input type="file" name="attach">
		filename = multi.getFilesystemName("attach"); //파일명
		orgfilename = multi.getOriginalFileName("attach"); //파일명
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	
	
%>
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
	<!-- ex16_ok.jsp -->
	
	<h1>결과</h1>
	
	<div>
		이름: <%= name %>
	</div>
	
	<div>
		나이: <%= age %>
	</div>
	
	<div>
		파일명: <%= filename %>
	</div>
	
	<div>
		파일명: <%= orgfilename %>
	</div>
	
	
	<h2>파일 다운로드</h2>
	
	<!--
		장점: 간단함
		단점: 파일 확장자에 따라 다운로드가 되던지 미리보기가 됨
	-->
	<div>
		<a href="/jsp/files/<%= filename %>"><%= orgfilename %></a>
	</div>
	
	<!-- 
		장점: 간단함, 모든 파일을 무조건 다운로드 시키는 옵션
		단점: 파일명이 다를 수 있다.(넘버링)
	-->
	<div>
		<a href="/jsp/files/<%= filename %>" download><%= orgfilename %></a>
	</div>
	
	<!--  
		장점: 무조건 다운로드 처리, 원본 파일명으로 다운로드(권장!!)
		단점: download.jsp를 만드는 비용 발생
	-->
	
	<div>
		<a href="download.jsp?filename=<%= filename %>&orgfilename=<%= orgfilename %>"><%= orgfilename %></a>
	</div>
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
	<script>
		
	</script>
</body>
</html>