<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
	<div class="s_title">${title }</div>
	<c:forEach items="${alist}" var="bean">
		<div class="con">
			<div>
				<input type="checkbox" name="delchk" value="${bean.no }">
			</div>
			<a href="/star/menu/detail?no=${bean.no }">
				<div><img src="C:/spring/file/${bean.newfilename }"></div>
				<div>${bean.title }</div>
			</a>
		</div>
	</c:forEach>
</body>
</html>