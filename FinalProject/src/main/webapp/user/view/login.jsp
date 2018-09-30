<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>

<!-- Bootstrap -->
<link href="../../bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- custom css  -->
<link href="../../css/real-estate.css" rel="stylesheet" type="text/css"
	media="screen">
<!-- font awesome for icons -->
<link href="../../font-awesome/css/font-awesome.min.css"
	rel="stylesheet">

<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,900,700,500,400italic,300italic,300,100italic,100'
	rel='stylesheet' type='text/css'>
<!--owl carousel css-->
<link href="../../owl-carousel/assets/owl.carousel.css" rel="stylesheet"
	type="text/css" media="screen">
<link href="../../owl-carousel/assets/owl.theme.default.css"
	rel="stylesheet" type="text/css" media="screen">
<!--mega menu -->
<link href="../../css/yamm.css" rel="stylesheet" type="text/css">
<link href="../../css/select.css" rel="stylesheet" type="text/css">
<!--Revolution slider css-->
<link href="../../rs-plugin/css/settings.css" rel="stylesheet"
	type="text/css" media="screen">
<link href="../../css/rev-style.css" rel="stylesheet" type="text/css"
	media="screen">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.js"></script>
		<link href="${initParam.root }css/mask.css" rel="stylesheet" type="text/css" media="screen">
		<link href="${initParam.root }css/topBar.css" rel="stylesheet" type="text/css" media="screen">

<script>
	$(function() { //loginResult
		$('#check').click(function() {
			var id = $('#id').val();
			var password = $('#password').val();

			$.ajax({
				type : "post",
				url : "${initParam.root}loginCheck.do",
				data : "id=" + id + "&&password=" + password,
				success : function(data) {
					if (data.l == null) {
						$('#loginResult').html("<font color='red'>아이디와 비밀번호를 다시한번 확인해보세요.</font>");
						return true;
					} else {
						var form = document.getElementById("loginForm");
						form.submit();
					}
				} //success
			}) //ajax
		}) //click
		//findIdResult findPasswordResult
		//find-mId // find-mPass
		$('#find-mId').click(function(){//findidView
			var tel = $('#mtel').val();
			$.ajax({
				type:"post",
				url:"${initParam.root}findId.do",
				data:"tel="+tel,
				success : function(data){
	
					if(data.id==null){
						alert("dddd");
						$('label[id=resultView]').html("<font color='red'>입력하신 정보에 부합하는 ID가 존재하지 않습니다.</font>");
						
					}else{
						
						$('label[id=resultView]').html("<font color='green'>"+data.id+"</font>");
						
					}
				}
			})
		})//click
		$('#find-mPass').click(function(){//findidView
			var id = $('#mid').val();
		var name = $('#mname').val();
			$.ajax({
				type:"post",
				url:"${initParam.root}findPassword.do",
				data:"id="+id+"&&name="+name,
				success : function(data){
					
					if(data.password==null){
						
						$('label[id=resultView]').html("<font color='red'>정보에 부합하는 비밀번호가 존재하지 않습니다.</font>");
						
					}else{
						
						$('label[id=resultView]').html("<font color='green'>"+data.password+"</font>");
						
					}
				}
			})
		})//click
	});
</script>
<style type="text/css">
.navbar{
   background-color: #004b8b;
}
#logo {
   font-family: "Open Sans", sans-serif;
   font-size: 40px;
   color: white;
}   
.btn-red {
  background-color: #004b8b;
  color: #fff;
}
.btn-red:hover, .btn-red:focus {
  color: #fff;
  background-color: #333;
}
.title-section .link-arrow {
  padding: 2px 8px;
  background-color: #f2d636;
  color: #fff;
  float: right;
  display: inline-block;
  font-size: 11px;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  -ms-border-radius: 3px;
  border-radius: 3px;
}
.search-field {
  margin-right:70px;
  -webkit-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  background-color: transparent;
  border: none;
  border-bottom: 1px solid rgba(255, 255, 255, 0.5) !important;
  box-sizing: border-box;
  color: rgba(255, 255, 255, 0.5);
  cursor: pointer;
  font-size: 2.25rem;
  font-weight: 300;
  opacity: 0;
  padding-right: 3.75rem;
  width: 0;
  z-index: 3;
}

.btn-search{
  background-color: #f2d636;
  color: #fff;
}
.btn-search:hover, .btn-search:focus {
  color: #fff;
  background-color: #333;
}
.btn-register{
  color: #fff;
}
.btn-register:hover, .btn-register:focus {
  color: black;
  background-color: white;
}
.btn-all{
  border-radius: 3px;
  background-color: #f2d636;
  color: #fff;
}
.btn-all:hover, .btn-all:focus {
  border-radius: 3px;
  color: white;
  background-color: #333;
}
</style>
</head>
<body>

<div id="mask"></div>
<div class="window"></div>
	<nav class="navbar navbar-inverse navbar-static-top sticky yamm">
			<div id="navbar" class="navbar-collapse collapse" style="background-color: #004b8b">
				<div class="col-sm-4" style="margin-top: 15px;">
					<a href="${initParam.root }home.jsp"><img alt="" src="${initParam.root }img/logo.png" style="width: 250px; height: 60px;"></a>
				</div>
				<div class="col-sm-4" style="text-align: center; heigth : 100px; padding-top: 40px; position: relative; ">
					<h3 style="color: white;"><c:out value="${param.pageName}"/></h3>
				</div>
				<div class="col-sm-4">
					<div class="col-sm-3">
						<a href="${initParam.root}product/view/registerSpace0.jsp" class="btn btn-register btn-block"
						style="width: 87px; margin-top: 15px; border: 2px solid; border-color: white;">
							공간 등록</a>
					</div>
					<div class="col-sm-3">
						<a href="${initParam.root}product/view/registerTech0.jsp" class="btn btn-register btn-block"
						style="width: 98px; margin-top: 15px; border: 2px solid; border-color: white;">
							휴테크 등록</a>
					</div>
					
					<div class="col-sm-5" style="margin-top: 15px;">
							<form action="${initParam.root}searchProduct.do" style="width: 200px;">
								<input class="search-field" id="search-field" type="text" name="search" value="" aria-required="false" autocomplete="off"
									placeholder="Search&hellip;" style="width: 200px; position: absolute;">
								<button class="search-submit">
								<i class="fa fa-search" style=""></i>
								</button>
							</form>
					</div>
					<div class="col-sm-1" style="margin-top: 15px;">
						<a href="#" class="openMask">
							<div class="btn btn-default" id="menu-toggle">
								<img src="${initParam.root }img/icon/menuToggle.png" style="margin-bottom: auto;">
							</div>
						</a>
					</div>
						<%-- <div class="top-search">
							<form action="${initParam.root}searchProduct.do">
								<input class="search-field" id="search-field" type="text" name="search" value="" aria-required="false" autocomplete="off"
									placeholder="Search&hellip;" style="width: 150px;">
								<button class="search-submit">
									<span class="screen-reader-text">Search</span>
										<i class="fa fa-search" style=""></i>
								</button>
							</form>
						</div>
						<!-- 상단 사이드바 버튼 -->
						<a href="#" class="openMask">
						<div class="btn btn-default" id="menu-toggle" style="margin-top: 15px;">
							<img src="${initParam.root }img/icon/menuToggle.png" style="margin-bottom: auto;">
						</div>
						</a> --%>
							
					<!-- 사이드바  -->
					<div id="mySidenav" class="sidenav"	style="background-color: white">
						<div class="btn btn-default" id="menu-toggle" style="margin-left: 80%; background-color: white; height: 40px;">
							<img id="close" src="${initParam.root }img/icon/menuToggle.png">
						</div>
						<ul class="nav nav-pills nav-stacked">
							<c:choose>
								<c:when test="${spaceuservo==null }">
									<li
										style="background-color: #32c5d2; height: 130px; font-style: italic;"><h3
											align="center" style="padding-top: 50px;">로그인이 필요합니다</h3></li>
								</c:when>
								<c:when test="${spaceusevo.id=='admin' }">
									<li
										style="background-color: #32c5d2; height: 130px; font-style: italic;"><h3
											align="center" style="padding-top: 50px;">관리자 페이지입니다.</h3></li>
								</c:when>
								<c:otherwise>
									<li
										style="background-color: #32c5d2; height: 130px; font-style: italic;"><h3
											align="center" style="padding-top: 50px;">${spaceuservo.name }</h3></li>
								</c:otherwise>
							</c:choose>
							<div style="height: 120px; margin-top: 10px;">
								<a href="${initParam.root}getPoint.do" style="border: none;">
									<font>보유 포인트</font><br>
									<span>${spaceuservo.point}</span>
									<img alt="" src="${initParam.root}img/icon/point.png" style="width: 40px; margin-bottom: 10px;"><br>
									<h5>자세히 보기 >></h5>
								</a>
								<hr>
							</div>
							<c:choose>
								<c:when test="${spaceuservo==null}">
									<li class="dropdown"><a
										href="${initParam.root }user/view/registerSpaceUser.jsp"
										class="btn-default" style="heigt: 80px;">회원가입</a></li>
									<li class="dropdown"><a
										href="${initParam.root}user/view/login.jsp"
										class="btn-default">로 그 인</a></li>
									<li class="dropdown"><a
										href="${initParam.root }getAllFAQInfo.do?notice=false&&pageNo=1"
										class="btn-default">F A Q</a></li>
									<li class="dropdown"><a
										href="${initParam.root }getAllNotice.do?notice=true&&pageNo=1"
										class="btn-default">공지사항</a></li>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${spaceuservo.id == 'admin'}">
											<li class="dropdown"><a href="user/view/findUser.jsp">회원
													검색</a></li>
											<li class="dropdown"><a
												href="${initParam.root}getAllNotice.do?notice=true&&pageNo=1">공지사항
													관리</a></li>
											<li class="dropdown"><a
												href="${initParam.root}getAllFAQInfo.do?notice=false&&pageNo=1">FAQ관리</a></li>
											<li class="dropdown"><a href="#">상품관리</a></li>
											<li class="dropdown"><a
												href="${initParam.root}getAllComplain.do?pageNo=1">상품신고
													관리</a></li>
											<li class="dropdown"><a
												href="${initParam.root}getAllAuctionTemp.do">경매관리</a></li>
											<li class="dropdown"><a
												href="${initParam.root}logout.do">로그아웃</a></li>
										</c:when>

										<c:otherwise>

											<li class="dropdown" >
											<a class="dropdown-toggle" data-toggle="dropdown" href="#" style="border: none;">
											My Page<span class="caret"></span>
											</a>
												<ul class="dropdown-menu" >
													<li><a href="${initParam.root }getUserInfo.do?id=${spaceuservo.id}">내정보수정</a></li>
													<li><a href="${initParam.root}getAllProductById.do">
													내 공간 / 휴테크 보기</a>
													</li>
													<li><a href="${initParam.root }getAllDealInfo.do">내
															거래내역 보기</a>
													</li>
													<li><a data-toggle="modal" data-target="#myModal">탈퇴하기</a>
													</li>
												</ul>
											</li>
											<li class="dropdown"><a
												href="${initParam.root }getAllNotice.do?notice=true&&pageNo=1" style="border: none;">공지사항</a></li>
											<li class="dropdown" ><a
												href="${initParam.root }getAllFAQInfo.do?notice=false&&pageNo=1" style="border: none;">FAQ</a></li>
											<li class="dropdown" ><a
												href="${initParam.root }getOnSaleAuction.do?flag=index" style="border: none;">경매</a></li>
											<li class="dropdown" ><a
												href="${initParam.root }findComplainById.do" style="border: none;">상품신고내역</a></li>
											<li class="dropdown" ><a
												href="${initParam.root }logout.do" style="border: none;">로그아웃</a></li>


										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
							
						</ul>
						<div style="margin-top: 200px;">
							<a href="${initParam.root }home.jsp" class="btn btn-outlined btn-info">
							<img src="${initParam.root}img/icon/index_arrow.png" 
							style="margin-bottom: 7px; margin-right: 20px;">공간기동대 홈 이동</a>
							
						</div>
					</div>
					
					
				
					
					
				</div>
				</div>
		</nav>
	
	<div style="height: 100px"></div>
	<div class="container">
		<div class="row">
			<div class="col-sm-5  col-md-5 margin30" style="margin-left: 28%;">
				<div class="login-reg-box" style="background-color: #e6e6e6">
					<h4>로그인</h4>
					<form id="loginForm" action="${initParam.root }loginUser.do">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-user"></i></span>
							<input type="text" id="id" name="id" class="form-control"
								placeholder="ID">
						</div>
						<br>
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-lock"></i></span>
							<input type="password" id="password" name="password"
								class="form-control" placeholder="Password">
						</div>
						<br>
						<!-- <div class="checkbox">
                                <input type="checkbox"> Remember Me!
                            </div> -->
						<div class="clearfix">
							<input type="button" id="check" class="btn btn-red btn-lg"
								data-toggle="modal" data-target="#checkLogin"
								style="margin-left: 40%" value="로그인"> <br> <a
								data-toggle="modal" data-target="#findId" class="pull-right">ID
								/ Password 찾기</a>
						</div>
						<div class="divide15"></div>

					</form>
				</div>

			</div>

		</div>
	</div>
	<div id="checkLogin" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">로그인실패</h4>
				</div>
				<div class="modal-body">
					<p>
						<label id="loginResult"></label>
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-red" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>


	<div id="findId" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">아이디 / 비밀번호 찾기</h4>
				</div>
				<ul class="nav nav-tabs">
					<li><a data-toggle="tab" href="#menu1">아이디 찾기</a></li>
					<li><a data-toggle="tab" href="#menu2">비밀번호 찾기</a></li>
				</ul>
				<div class="modal-body">
					<div class="tab-content">
						<div id="menu1" class="tab-pane fade">
															<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-mobile-phone"></i></span> <input type="text"
										class="form-control" id="mtel" name="tel" placeholder="Tel">
								</div>
								
								<br> <br> <input type="button"
								class="btn btn-red btn-lg pull-right" id="find-mId" value="ID찾기">
						
							
						</div>
						<br>
						<div id="menu2" class="tab-pane fade">
							
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user"></i></span>
									<input type="text" class="form-control" id="mid"
										placeholder="ID">
								</div>
								<br>
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user"></i></span>
									<input type="text" class="form-control" id="mname"
										placeholder="Username">
								</div>
								<br>
								
								<input type="button" id="find-mPass" class="btn btn-red btn-lg pull-right"
									value="Password찾기">
							
						</div>
						<br> <br>
						<p>
					</div>
					<br>
				</div>
				<div  class="modal-footer">
					<label id="resultView"></label><p>
				</div>

			</div>
		</div>
	</div>
  <div style="height: 120px"></div>
	<!--scripts and plugins -->
	<!--must need plugin jquery-->
	<script src="../../js/jquery.min.js"></script>
	<script src="../../js/jquery-migrate.min.js"></script>
	<!--bootstrap js plugin-->
	<script src="../../bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<!--easing plugin for smooth scroll-->
	<script src="../../js/jquery.easing.1.3.min.js" type="text/javascript"></script>
	<!--flex slider plugin-->
	<script src="../../js/jquery.flexslider-min.js" type="text/javascript"></script>
	<!--sticky header-->
	<script type="text/javascript" src="../../js/jquery.sticky.js"></script>
	<!--parallax background plugin-->
	<script src="../../js/jquery.stellar.min.js" type="text/javascript"></script>
	<!--owl carousel slider-->
	<script src="../../owl-carousel/owl.carousel.min.js"
		type="text/javascript"></script>
	<script src="../../js/classie.js" type="text/javascript"></script>
	<script src="../../js/selectFx.js" type="text/javascript"></script>
	<!--revolution slider plugins-->
	<script src="../../rs-plugin/js/jquery.themepunch.tools.min.js"
		type="text/javascript"></script>
	<script src="../../rs-plugin/js/jquery.themepunch.revolution.min.js"
		type="text/javascript"></script>
	<script src="../../js/tweetie.min.js" type="text/javascript"></script>
	<!--on scroll animation-->
	<script src="../../js/wow.min.js" type="text/javascript"></script>
	<!--customizable plugin edit according to your needs-->
	<script src="../../js/real-estate-custom.js" type="text/javascript"></script>
	
<jsp:include page="/footer.jsp"/>

</body>
</html>
