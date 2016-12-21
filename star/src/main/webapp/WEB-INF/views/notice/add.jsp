<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
	<form action="/star/notice/insert">
		<p>
			<label for="title">title</label>
			<input type="text" name="title" id="title">
		</p>
		<p>
			<label for="content">content</label>
			<textarea rows="20" cols="80" name="content" id="content"></textarea>
		</p>
		<p>
			<button type="submit">입력</button>
			<button type="reset">취소</button>
		</p>
	</form>
</body>
</html>