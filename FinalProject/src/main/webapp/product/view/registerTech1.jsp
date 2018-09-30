<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>registerSpace1</title>
<script>
	closeSidebar();
	function openSidebar() {
		document.getElementById("mySidebar").style.display = "block";
	}
	function closeSidebar() {
		document.getElementById("mySidebar").style.display = "none";
	}
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/w3css/4/w3mobile.css">
<link rel="stylesheet" href="/lib/w3-theme-teal.css">
<link rel="stylesheet" href="/lib/w3-colors-2017.css">
<meta name="description" content="slick Login">
<meta name="author" content="Webdesigntuts+">
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://www.modernizr.com/downloads/modernizr-latest.js"></script>
<script type="text/javascript" src="placeholder.js"></script>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta http-equiv="cache-control"
	content="no-store, no-cache, must-revalidate" />
<meta http-equiv="Pragma" content="no-store, no-cache" />
<meta http-equiv="Expires" content="0" />

<title>registerTech</title>

<link rel="stylesheet"
	href="https://ssl.pstatic.net/spacecloud/static/center/css/deploy/20170615064709/min/host.min.css"
	type="text/css">

<style>
.w3-2017-lapis-blue {
	color: #fff;
	background-color: #004b8d;
}

h1 {
	font-size: xx-large;
}

h2 {
	font-size: larger;
}

.button2 {
	background-color: white;
	color: black;
	border: 2px solid #008CBA;
	width: 4cm;
	height: 1.5cm;
}

.button2:hover {
	background-color: #004B8D;
	color: white;
}

.button3 {
	background-color: white;
	color: black;
	border: 2px solid #f44336;
	width: 4cm;
	height: 1.5cm;
}

.button3:hover {
	background-color: #f44336;
	color: white;
}
label{
	background-color: white;
	text-align: center;
	border-bottom: 1px solid aqua;
}

input[type="radio"] {
	height: 100%%;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function (){
		
		$('#checkSpaceFrm').submit(function(){
			var category = $('input[name=tech]:checked');
			if(category.length==0){
				alert("카테고리 선택하세용~~");
				return false;
			}else if(category.length>1){
				alert("1개만 선택하세용~~");
				return false;
			}
			
		});
	});
	
	function checkCancel(){
		location.href="home.jsp";
	}
</script>
<script type="text/javascript">
       $(function(){
           
          if(${spaceuservo.id==null}){
            location.href="${initParam.root}NewFile1.jsp";
            //$('#loginModal').modal();   
               }
        
          });
</script>
<body>

<jsp:include page="../../header.jsp">
	<jsp:param value="카테고리를 선택하세요" name="pageName"/>
</jsp:include>
<div style="width: 50%; margin-left: 28% ">
	<!-- Check Box -->
	<form action="registerTech2.jsp" id="checkTechFrm" method="post" style="padding-top: 10%">
		<input type="hidden" value="${param.type}" name="type">
		<input type="hidden" value="${param.licence}" name="licence">
		
		<div class="box_form"  style="padding-left: 30px;">
			<div class="title"><h2>휴테크 카테고리</h2></div><br><br>
			<span class="option" style="padding-right: 50px;">
			
				<span class="txt_guide" style="color: blue; right: 10px;"> 중복선택 불가능 </span>
			</span>
		</div>
				<div class="row">
			
			<ul style="list-style: none;">
				
				<li><input type="radio" name="space" class="radio-inline__input" id="cate1" value="IT">
					<label for="cate1" class="radio-inline__label"><h4>IT</h4></label></li>

				<li><input type="radio" name="space" class="radio-inline__input" id="cate2" value="스포츠">
					<label for="cate2" class="radio-inline__label"><h4>스포츠</h4></label></li>

				<li><input type="radio" name="space" class="radio-inline__input" id="cate3" value="패션">
					<label for="cate3" class="radio-inline__label"><h4>패션</h4></label></li>

				<li><input type="radio" name="space" class="radio-inline__input" id="cate4" value="음악">
					<label for="cate4" class="radio-inline__label"><h4>음악</h4></label></li>

				<li><input type="radio" name="space" class="radio-inline__input" id="cate5" value="뷰티">
					<label for="cate5" class="radio-inline__label"><h4>뷰티</h4></label></li>

				<li><input type="radio" name="space" class="radio-inline__input" id="cate6" value="음식">
					<label for="cate6" class="radio-inline__label"><h4>음식</h4></label></li>

				<li><input type="radio" name="space" class="radio-inline__input" id="cate7" value="공예">
					<label for="cate7" class="radio-inline__label"><h4>공예</h4></label></li>

				<li><input type="radio" name="space" class="radio-inline__input" id="cate8" value="역사">
					<label for="cate8" class="radio-inline__label"><h4>역사</h4></label></li>

				<li><input type="radio" name="space" class="radio-inline__input" id="cate9" value="자연">
					<label for="cate9" class="radio-inline__label"><h4>자연</h4></label></li>

				<li><input type="radio" name="space" class="radio-inline__input" id="cate10" value=엔터테인먼트>
					<label for="cate10" class="radio-inline__label"><h4>엔터테인먼트</h4></label></li>

				<li><input type="radio" name="space" class="radio-inline__input" id="cate11" value="바/클럽">
					<label for="cate11" class="radio-inline__label"><h4>바/클럽</h4></label></li>
				<li><input type="radio" name="space" class="radio-inline__input" id="cate12" value="웰빙">
					<label for="cate12" class="radio-inline__label"><h4>웰빙</h4></label></li>
				
			</ul>
			
		</div>
		
		<hr>
		<p>
		<hr>
		<p>
			
			<div class="col-sm-5" style="padding-left: 265px; ">
		<span id="buttons" >
			 &nbsp;  <!-- checkCancel() 아직 구현안됨 -->
			<button class="button button2" onsubmit="">다음</button>
		</span>
		</div>
	</form>
	<div class="col-sm-7" style="margin-top: 20px;padding-left: 45px">
	<button class="button button3" id="cancle">취소</button>
	</div>
	</div>
	<br><br><br><br><br><br><br><br><br>
<jsp:include page="../../footer.jsp"></jsp:include>
</body>

</html>