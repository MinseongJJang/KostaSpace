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
<script type="text/javascript">
       $(function(){
           
          if(${spaceuservo.id==null}){
            location.href="${initParam.root}NewFile1.jsp";
            //$('#loginModal').modal();   
               }
        
          });
</script>
<script>
	$(function() {
		$("#menu").menu();
		$("#tabs").tabs();

	});
</script>
<script type="text/javascript">
	function startRequest(){
	var tel =document.getElementById("tel").value;
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange=callback;
		xhr.open("get",${initParam.root}+"findId.do?tel="+tel,true);
		xhr.send(null);
	}
	
	function callback(){
		if(xhr.readyState==4){
			if(xhr.status==200){
				var jsonData=JSON.parse(xhr.responseText);
			if(jsonData.id==null){
				alert("해당 번호에대한  아이디가 없어요.")
			}else{
				alert(jsonData.id);
			}
		}	
	}
	}
	function findPass(){
		var id =document.getElementById("id").value;
		var name =document.getElementById("name").value;
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange=callback2;
		xhr.open("get",${initParam.root}+"findPassword.do?id="+id+"&&name="+name,true);
		xhr.send(null);
	}
	function callback2(){
		if(xhr.readyState==4){
			if(xhr.status==200){
				var jsonData = JSON.parse(xhr.responseText);
				if(jsonData.password==null){
					alert("해당 아이디에 대한 비밀번호가 없어요!")
				}else{
					alert(jsonData.password);
				}
					 
			}
		}
	}
	
</script>


<style type="text/css">
fieldset {
	border: 0;
}

label {
	margin: 30px 0 0 0;
}

#categoryFrm {
	margin-left: 40%;
}

#banner {
	background-color: #2A2454;
	height: 200px;
}

#logo {
	width: 150px;
	text-align: center;
	background-color: #FDBE02;
}

#menu {
	background-color: #2A2454;
	width: 150px;
	margin: auto;
	margin-right: 0px;
}

.menu1, .menu1_1, .menu1_2, .menu2, .menu3 {
	background-color: #FDBE02;
}

#taps {
	background-color: #2A2454;
}

#tabs li {
	
}

#product_space {
	border: 1px solid;
	text-align: center;
}

#product_space img {
	width: 200px;
}

#content {
	margin-left: 35%;
	width: 30%;
}
</style>

</head>
<body>

<jsp:include page="/header.jsp"/>

	<!-- ==================================content================================== -->
	<div id="content">
		<form action="${initParam.root}findId.do" method="post" name="findid">
			<div class="form-group">
				<label for="label-id">ID찾기</label><br>
				<br> <input type="tel" pattern="\d{3}-\d{3,4}-\d{4}"
					class="form-control" id="tel" name="tel"
					placeholder="휴대폰 번호를 입력하세요. ex(123-4567-8910)" required="required"><br>
				<input type="button" value="찾기" id="findid" onclick="startRequest()">
			</div>

		</form>
		<hr>
		<form action="${initParam.root}findPassword.do" method="post"
			id="password" name="password">
			<div class="form-group">
				<label for="label-id">Password찾기</label><br>
				<br> <input type="text" class="form-control" id="id" name="id"
					placeholder="ID를 입력하세요" required="required"><br> <input
					type="text" class="form-control" id="name" name="name"
					placeholder="이름을 입력하세요" required="required"><br> <input
					type="button" value="찾기" id="findpass" onclick="findPass()">
			</div>

		</form>
	</div>
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
	<footer> footer </footer>
</body>
</html>











