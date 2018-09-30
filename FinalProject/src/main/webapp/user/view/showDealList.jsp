<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">

<title>Insert title here</title>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<script>
	$(function() {
		$("#menu").menu();
		$("#tabs").tabs();

	});
</script>
<script type="text/javascript">
       $(function(){
           
          if(${spaceuservo.id==null}){
            location.href="${initParam.root}NewFile1.jsp";
            //$('#loginModal').modal();   
               }
        
          });
</script>
</head>
<body>

<jsp:include page="/header.jsp"/>

	<!-- ==================================content================================== -->
	<div id="content">
	<!-- 구매자 id 판매자 id 가격 타이틀  -->
	<c:choose>
	<c:when test="${dealList=='[]'}">
	<h2>거래내역이 없어용!!!!!!!!!</h2>
	</c:when>
	<c:otherwise>
	<table>
	<tr>
	<th>구매자 ID</th><th>판매자 ID</th><th>가격</th><th>타이틀</th>
	</tr>
	<c:forEach items="${dealList}" var="d">
	<tr>
	<td>${d.sId }</td><td>${d.bId }</td><td>${d.price }</td><td>${d.title }</td>
	</tr>
	</c:forEach>
	</table>
	</c:otherwise>
	</c:choose>
	</div><!-- content -->
	
	
	<!-- 회원탈퇴모달 -->

	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">회원탈퇴</h4>
				</div>
				<div class="modal-body">
					<p>회원탈퇴를 진행하시면 회원님의 모든 정보(포인트포함)가 삭제됩니다.</p>
					<p>계속진행하시려면 패스워드를 입력해주세요</p>
					password :: <input type="password" id="password" name="password">
					<button type="button" class="confirm" id="confirm"
						onclick="removeUser()">탈퇴</button>
					<script type="text/javascript">
                  function removeUser() {
                     
                     var password = $('#password').val();
                     if (password=="") {
                        alert("패스워드를 입력하십시오.");
                        return false;
                     }else{
                        if(${spaceuservo.password}!= password){
                           alert("패스워드를 확인하십시오");
                           password.focus();   
                        }else {
                           location.href ="${initParam.root}deleteUser.do?id=${spaceuservo.id}";
                        }
                     }
                     };
               </script>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div><!-- 모달 끝 -->	
	<!-- ==================================footer================================== -->
	<footer> footer </footer>
</body>
</html>











