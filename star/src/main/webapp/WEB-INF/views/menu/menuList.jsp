<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>starbucks</title>

    <!-- 부트스트랩 -->
    <link href="/star/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/star/resources/css/star.css" rel="stylesheet">
	<style type="text/css">
		.all{
			width: 100%;
		}
		.s_menu{
			clear: both;
		}
		.m_menu>div{
			float: left;
		}
		.s_title{
			width: 100%;
			background-color: #eeeeee;
			clear: both;
		}
		.con{
			float: left;
			margin-right: 20px;
		}
		.con img{
			width: 250px;
			height: auto;
			border: 1px solid red;
		}
		.button{
			clear: both;
		}
	</style>
	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="/star/resources/js/bootstrap.min.js"></script>
    <script src="/star/resources/js/star.js"></script>
    <script>
    	$(document).ready(function(){
    		$.ajax({
    			type:"POST", url:"/star/menu/coffee", dataType:"html", async:false, success:function(data){
    				$("#st1").html(data);
    			}
    		});
			$.ajax({
    			type:"POST", url:"/star/menu/beverage", dataType:"html", async:false, success:function(data){
    				$("#st2").html(data);
    			}
    		});
			$.ajax({
    			type:"POST", url:"/star/menu/food", dataType:"html", async:false, success:function(data){
    				$("#st3").html(data);
    			}
    		});
    		$("#all").click(function(){
    			if(!($("#all").attr("checked"))){
    				$("#coffee, #beverage, #food").removeAttr("checked");
    				$("#all").attr("checked","checked");
    				$.ajax({
            			type:"POST", url:"/star/menu/coffee", dataType:"html", async:false, success:function(data){
            				$("#st1").html(data);
            			}
            		});
    				$.ajax({
            			type:"POST", url:"/star/menu/beverage", dataType:"html", async:false, success:function(data){
            				$("#st2").html(data);
            			}
            		});
    				$.ajax({
            			type:"POST", url:"/star/menu/food", dataType:"html", async:false, success:function(data){
            				$("#st3").html(data);
            			}
            		});
    			}else{
    				$("#st1 *, #st2 *, #st3 *").remove();
    				$("#all").removeAttr("checked");
    			}
    		});
    		
    		$("#coffee").click(function(){
    			if(!($("#coffee").attr("checked"))){
    				if($("#all").attr("checked")){
	    				$("#all").removeAttr("checked");
    					$("#st2 *, #st3 *").remove();
    					
    				}
    				$.ajax({
            			type:"POST", url:"/star/menu/coffee", dataType:"html", async:false, success:function(data){
            				$("#st1").html(data);
            			}
            		});
    				$("#coffee").attr("checked","checked");
    			}else{
    				$("#st1 *").remove();
    				$("#coffee").removeAttr("checked");
    			}
    			
    		});
    		
    		$("#beverage").click(function(){
    			if(!($("#beverage").attr("checked"))){
    				if($("#all").attr("checked")){
	    				$("#all").removeAttr("checked");
    					$("#st1 *, #st3 *").remove();
    					
    				}
    				$("#all").removeAttr("checked");
    				$.ajax({
            			type:"POST", url:"/star/menu/beverage", dataType:"html", async:false, success:function(data){
            				$("#st2").html(data);
            			}
            		});
    				$("#beverage").attr("checked","checked");
    			}else{
    				$("#st2 *").remove();
    				$("#beverage").removeAttr("checked");
    			}
    		});
    		
    		$("#food").click(function(){
    			if(!($("#food").attr("checked"))){
    				if($("#all").attr("checked")){
	    				$("#all").removeAttr("checked");
    					$("#st1 *, #st2 *").remove();
    					
    				}
    				$("#all").removeAttr("checked");
    				$.ajax({
            			type:"POST", url:"/star/menu/food", dataType:"html", async:false, success:function(data){
            				$("#st3").html(data);
            			}
            		});
    				$("#food").attr("checked","checked");
    			}else{
    				$("#st3 *").remove();
    				$("#food").removeAttr("checked");
    			}
    		});
    		
    		$("#insert").click(function(){
    			location.href="/star/menu/write";
    		});
    		
    		$("#delete").click(function(){
    			var chk=$("input[name='delchk']:checked").size();
    			var no=[];
    			for(var i=0; i<chk; i++ ){
    				no[i]=$("input[name='delchk']:checked").eq(i).val();
    			}
    			location.href="/star/menu/delete?no="+no;
    		});
    		
    	});
    </script>	

</head>
<body>
<!-- header link -->
    <%@ include file="/resources/templates/header.jsp" %>
   
   <!-- 여기부터 본문 -->
    <div class="container content">
		<!-- 여기부터 입력합니다 -->
      	<div class="row">
			<div class="all">
				<h1>Coffee</h1>
				<div class="m_menu">
					<p>분류 보기</p>
					<div>
						<input type="checkbox" checked="checked" name="category" id="all" value="전체 상품보기" />
						<label for="all">전체 상품보기</label>
					</div>
					<div>
						<input type="checkbox" name="category" id="coffee" value="커피"/>
						<label for="coffee">커피</label>
					</div>
					<div>
						<input type="checkbox" name="category" id="beverage" value="음료"/>
						<label for="beverage">음료</label>
					</div>
					<div>
						<input type="checkbox" name="category" id="food" value="식품"/>
						<label for="food">식품</label>
					</div>
				</div>
					<div class="s_menu">
						<div id="st1"></div>
						<div id="st2"></div>
						<div id="st3"></div>
					</div>
					<div class="button">
						<input type="button" id="insert" value="등록">
						<input type="button" id="delete" value="삭제">
					</div>			
			</div>
	  <!-- 여기까지 입력합니다. -->
	  </div>
      <!-- /.row -->
      
    </div><!-- /.container -->
    <!-- 여기까지 본문 -->


    
   
   <!-- footer link -->
   <jsp:include page="/resources/templates/footer.jsp"></jsp:include>
   
    
</body>
</html>