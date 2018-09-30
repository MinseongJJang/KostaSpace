<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Insert title here</title>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	function aa(str){
		alert("asdfsdf");
	    var frm = document.hashFrm;
	    frm.hash.value = str;
	    alert("dddddddd");
	    frm.submit();
	 }	

   $(function() {
      $("#menu").menu();
      $("#tabs_space").tabs();
    /*   $("#tabs_tech").tabs(); */
   });
</script>
<style type="text/css">
#content{
	margin-left : 10%;
}

#product_space {
   border: 1px solid;
   text-align: center;
}

#product_space img {
   width: 200px;
}


#a_div{
	width: 372px;
	height: 500px;
}
#a_box{
	width: 372px;
	height: 500px;
	text-align: center;
}

#product_box{
	margin: auto;
}

</style>
</head>
<body>
<jsp:include page="/header.jsp" flush="true"/>

<!-- ==================================content================================== -->
<div id="content">
	
	<div id="space_box">
		<form action="searchProductByHashtag.do" method="post" name="hashFrm">
		<input type="hidden" value="" name="hash">
			<div id="Search_keyword">
				<h2>
					공간 추천 키워드
					<c:forEach items="${hslist}" var="space" begin="1" end="5">
						<a href="javascript:aa('${space.h_name}')">${space.h_name}</a>
					</c:forEach>
				</h2>
			</div>
			<div id="Search_keyword">
				<h2>휴테크 추천 키워드
					<c:forEach items="${htlist}" var="tech" begin="1" end="5">
						<a href="javascript:aa('${tech.h_name }')">${tech.h_name }</a>
					</c:forEach>
				</h2>
			</div>
		</form>
			
			<div id="tabs_space">
			<ul style="background-color: white">
				<li><a href="#tabs-1">등록순</a></li>
				<li><a href="#tabs-2">평점순</a></li>
			</ul>
		
			<div id="tabs-1" class="w3-col s12">
				<c:forEach items="${plist }" var="space">
				<article id="product_box" class="w3-col s4">
					<div id="a_div">
					<a href="${initParam.root}getProduct.do?no=${space.p_no}" id="a_box">
						<div class="good_count" align="center">★★★★★</div>
						<div class="product_image"><img src="p.upload/${space.newfilename}" width="372px" height="305px"></div>
						<hr>
						<div class="product_title">${space.title}</div>
						<div class="product_hash">${space.hashtag}</div>
						<div class="product_price">${space.price}원/시간</div>
						<div class="product_staravg">평점${space.staravg}</div>
						<hr>
					</a>
					</div>
					
					</article>					
				</c:forEach>
				
			</div>
		
			
			<div id="tabs-2" class="w3-col s12">
				<c:forEach items="${avgList }" var="space">
				<article id="product_box" class="w3-col s4">
					<div id="a_div">
					<a href="${initParam.root}getProduct.do?no=${space.p_no}" id="a_box">
						<div class="good_count" align="center">★★★★★</div>
						<div class="product_image"><img src="p.upload/${space.newfilename}" width="372px" height="305px"></div>
						<hr>
						<div class="product_title">${space.title}</div>
						<div class="product_hash">${space.hashtag}</div>
						<div class="product_price">${space.price}원/시간</div>
						<div class="product_staravg">평점${space.staravg}</div>
						<hr>
					</a>
					</div>
					
					</article>					
				</c:forEach>
				
			</div>
		</div><!-- tabs_space -->
	</div><!-- space_box -->
	<hr><hr>
</div><!-- content -->	



	<!-- 회원탈퇴모달 -->
 
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			Modal content
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
						}
					</script>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>모달 끝 	

	<!-- ==================================footer================================== -->
</body>
</html>















