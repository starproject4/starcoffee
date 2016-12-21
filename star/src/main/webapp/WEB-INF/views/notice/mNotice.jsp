<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

    <script type="text/javascript">
    var size=${asize};
     $(document).ready(function(){
    	 for(var i=0; i<size; i++){
    		 if(i==0){
                 $("#page").html("<a href='#'>1</a>");
             }else{
                 $("#page>a:last-child").after("<a href='#'>"+(i+1)+"</a>");
             }
    	 }
    	 
    	 $("#page>a").click(function(){
    		 location.href="/star/notice?no="+$(this).text();
        	 alert($(this).text());
        	 
         });
     });
    </script>
</head>
<body>
	<h1>공지사항</h1>
	<table>
		<tr>
			<th>NO</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회수</th>
			<th>고유번호</th>
		</tr>
		<c:forEach items="${alist }" var="bean" varStatus="a" begin="${abegin }" end="${abegin+9 }">
			<tr>
				<td>${size-a.index}</td>
				<td><a href="/star/notice/detail?idx=${bean.no }&cnt=${bean.count}">${bean.title }</a></td>
				<td>${bean.nalja }</td>
				<td>${bean.count }</td>			
				<td>${bean.no }</td>			
			</tr>
		</c:forEach>
	</table>
	<p id="page"></p>
	<p>
		<a href="/star/notice/add">글쓰기</a>
		<a>삭제</a>
	</p>
</body>
</html>