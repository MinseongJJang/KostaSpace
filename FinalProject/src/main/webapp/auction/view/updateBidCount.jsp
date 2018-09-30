<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
	$(function() {
		if(${spaceuservo.id == null}){
			location.href="${initParam.root}NewFile1.jsp";
		}
		if(${spaceuservo.id == 'admin'}){
			alert("관리자 기능이 아닙니다.");
			location.href="${initParam.root}home.jsp";
		}
	});	//function
	
function closeWindow(){
		var of = window.opener.document.updateBidCountForm.price;
		of.value="";
		of.focus();
		window.opener.document.getElementById("auctionPrice").innerHTML = ${bidVO.price} + " 원";
		self.close();	
	}
	
</script>

</head>
<body>
	
	<h4>${spaceuservo.name}의 입찰 정보</h4>
		${bidVO}
		
		<input class="btn btn-default" type="button" id="confirm" value="확인" onclick="closeWindow()">
</body>
</html>


