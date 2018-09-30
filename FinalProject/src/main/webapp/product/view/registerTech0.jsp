<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<script type="text/javascript"
   src="http://code.jquery.com/jquery-3.2.1.js"></script>

<title>공간기동대</title>

<link rel="stylesheet"
	href="${initParam.root }css/allTemp.css"
	>

<style>
label{
	background-color: white;
	text-align: center;
	border-bottom: 1px solid aqua;
}

input[type="radio"] {
	height: 100%%;
}
.button2 {
	background-color: white;
	color: black;
	border: 2px solid #004B8D;
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
#button_select{
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function (){
		
		$('#licenceFrm').submit(function(){
			var category = $('input[name=licence]:checked');
			if(category.length==0){
				alert("사업자인지 비사업자인지 선택하세요~~");
				return false;
			}else if(category.length>1){
				alert("한가지만 고르세용~~");
				return false;
			}
			
		});
		
	
		$("#licence1").click(function(){
			
			$("#licenceInsert").html("<form action='#' enctype='multipart/form-data'>"
			+"사업자 등록 번호<br>"
			+"<input type='text' name='crnNo' placeholder='사업자등록번호' size='5'><br><br><br><br>"
			+"<input type='file' name='upload' placeholder='Upload' size='5'>"
			+"</form>");
			
			
		});
		
		$("#licence2").click(function(){
			
			$("#licenceInsert").html("");
			
			
		});
		$('#cancle').click(function(){
			location.href="${initParam.root}home.jsp";
		});
	
	});
	

</script>

<body style="background-color: #F6F6F6;">
<jsp:include page="/header.jsp" >
   <jsp:param value="사업자/비사업자" name="pageName"/>
</jsp:include>
<c:if test="${spaceuservo==null}"><script type="text/javascript">
location.href="${initParam.root}NewFile2.jsp";
</script></c:if>
<c:if test="${spaceuservo!=null}">
<div class="container" style="height: 700px;" >
	<!-- Check Box -->
	<form action="registerTech1.jsp" id="licenceFrm" method="post">
		<input type="hidden" value="휴테크" name="type" >
		<br><br><br>
		<div class="row" id="button_select" style="margin-top: 150px;">
			<ul style="list-style: none; margin-left: 290px;">
				<li><input type="radio" class="radio-inline__input" name="licence" id="licence1" value="사업자" onclick="myFunction('licenceInsert')">
					<label for="licence1" class="radio-inline__label"><h3>사업자</h3></label></li>
				
				<li><input type="radio" name="licence" id="licence2" value="비사업자" class="radio-inline__input">
					<label for="licence2" class="radio-inline__label"><h3>비사업자</h3></label></li>
			</ul>
		<br><br>
		</div>
		<ul>
		<div id="licenceInsert" style="margin-left: 290px;">
		
		</div>
		</ul>
		<hr><p><hr><p>
			<div class="col-sm-6" style="padding-left: 410px; ">
		<span id="buttons" >
			 &nbsp;  <!-- checkCancel() 아직 구현안됨 -->
			<button class="button button2" onsubmit="">다음</button>
		</span>
		</div>
	</form>
	<div class="col-sm-6" style="margin-top: 20px">
	<button class="button button3" id="cancle">취소</button>
	</div>
</div>
</c:if>
<c:import url="/footer.jsp"></c:import>
</body>

</html>