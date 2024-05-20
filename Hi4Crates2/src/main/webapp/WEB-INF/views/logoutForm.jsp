<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>LOGOUT FORM 로그아웃 폼</h2>
	
	<form action="/logout" method="post">
		<button>로그아웃</button>
		<sec:csrfInput/>
	</form>
	
</body>
</html>