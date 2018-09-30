<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>assan - Real Estate</title>

<!-- Bootstrap -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- custom css  -->
<link href="css/real-estate.css" rel="stylesheet" type="text/css"
	media="screen">
<!-- font awesome for icons -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,900,700,500,400italic,300italic,300,100italic,100'
	rel='stylesheet' type='text/css'>
<!--owl carousel css-->
<link href="owl-carousel/assets/owl.carousel.css" rel="stylesheet"
	type="text/css" media="screen">
<link href="owl-carousel/assets/owl.theme.default.css" rel="stylesheet"
	type="text/css" media="screen">
<!--mega menu -->
<link href="css/yamm.css" rel="stylesheet" type="text/css">
<link href="css/select.css" rel="stylesheet" type="text/css">
<!--Revolution slider css-->
<link href="rs-plugin/css/settings.css" rel="stylesheet" type="text/css"
	media="screen">
<link href="css/rev-style.css" rel="stylesheet" type="text/css"
	media="screen">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 사용자정의 css -->
<link href="css/mask.css" rel="stylesheet" type="text/css"
	media="screen">
<link href="css/topBar.css" rel="stylesheet" type="text/css"
	media="screen">
<link href="css/checkLabel.css" rel="stylesheet" type="text/css"
	media="screen">
<link rel="stylesheet" type="text/css"
	href="${initParam.root }css/header.css" />

<script type="text/javascript">
  $(document).ready(function(){ $("#property-slider1").owlCarousel(); });
  $(document).ready(function(){ $("#property-slider2").owlCarousel(); });
   $(document).ready(function(){ $("#property-slider3").owlCarousel(); });
  $(document).ready(function(){ $("#property-slider4").owlCarousel(); });
  </script>

<script type="text/javascript">   
   var headerImg = new Array()

   headerImg[0] = "img/index/h0.jpg";
   headerImg[1] = "img/index/h1.jpg";
   headerImg[2] = "img/index/h2.jpg";

   setInterval("changeImage()", 10000);
	
   var x=0;

   function changeImage(){
      $("#image1").attr("src","img/index/h"+x+".jpg");
      x++;
      if(x>=3)
         x=0;

   }
   </script>

<style type="text/css">
.navbar {
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
	margin-right: 70px;
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

.btn-search {
	background-color: #f2d636;
	color: #fff;
}

.btn-search:hover, .btn-search:focus {
	color: #fff;
	background-color: #333;
}

.btn-register {
	color: #fff;
}

.btn-register:hover, .btn-register:focus {
	color: black;
	background-color: white;
}

.btn-all {
	border-radius: 3px;
	background-color: #f2d636;
	color: #fff;
}

.btn-all:hover, .btn-all:focus {
	border-radius: 3px;
	color: white;
	background-color: #333;
}

#circle {
	width: 100px;
	height: 50px;
	background: #004b8b;
	-moz-border-radius: 50px/25px;
	-webkit-border-radius: 50px/25px;
	border-radius: 50px/25px;
}
</style>
</head>
<body style="background-color: #F6F6F6;">
	<!-- 회원탈퇴모달 -->
	<div class="modal fade" id="myModal" role="dialog"
		style="position: relative;">
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
                     if(${spaceuservo.password} != password){
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
	</div>
	<!-- 모달 end -->
	<div id="mask"></div>
	<div class="window"></div>
	<nav class="navbar navbar-inverse navbar-static-top sticky yamm">
		<div id="navbar" class="navbar-collapse collapse"
			style="background-color: #004b8b">
			<div class="col-sm-4" style="margin-top: 15px;">
				<a href="${initParam.root }home.jsp"><img alt=""
					src="${initParam.root }img/logo.png"
					style="width: 250px; height: 60px;"></a>
			</div>
			<div class="col-sm-4"
				style="text-align: center; heigth: 100px; padding-top: 40px; position: relative;">
				<h3 style="color: white;">
					<c:out value="${param.pageName}" />
				</h3>
			</div>
			<div class="col-sm-4">
				<div class="col-sm-3">
					<a href="${initParam.root}product/view/registerSpace0.jsp"
						class="btn btn-register btn-block"
						style="width: 87px; margin-top: 15px; border: 2px solid; border-color: white;">
						공간 등록</a>
				</div>
				<div class="col-sm-3">
					<a href="${initParam.root}product/view/registerTech0.jsp"
						class="btn btn-register btn-block"
						style="width: 98px; margin-top: 15px; border: 2px solid; border-color: white;">
						휴테크 등록</a>
				</div>

				<div class="col-sm-5" style="margin-top: 15px;">
					<form action="${initParam.root}searchProduct.do"
						style="width: 200px;">
						<input class="search-field" id="search-field" type="text"
							name="search" value="" aria-required="false" autocomplete="off"
							placeholder="Search&hellip;"
							style="width: 200px; position: absolute;">
						<button class="search-submit">
							<i class="fa fa-search" style=""></i>
						</button>
					</form>
				</div>
				<div class="col-sm-1" style="margin-top: 15px;">
					<a href="#" class="openMask">
						<div class="btn btn-default" id="menu-toggle">
							<img src="${initParam.root }img/icon/menuToggle.png"
								style="margin-bottom: auto;">
						</div>
					</a>
				</div>

				<!-- 사이드바  -->
				<div id="mySidenav" class="sidenav" style="background-color: white">
					<div class="btn btn-default" id="menu-toggle"
						style="margin-left: 80%; background-color: white; height: 40px;">
						<img id="close" src="${initParam.root }img/icon/menuToggle.png">
					</div>
					<ul class="nav nav-pills nav-stacked">
						<c:choose>
							<c:when test="${spaceuservo==null }">
								<li
									style="background-color: #fed733; height: 130px; font-style: italic;"><h3
										align="center" style="padding-top: 50px;">로그인이 필요합니다</h3></li>
							</c:when>
							<c:when test="${spaceusevo.id=='admin' }">
								<li
									style="background-color: #fed733; height: 130px; font-style: italic;"><h3
										align="center" style="padding-top: 50px;">관리자 페이지입니다.</h3></li>
							</c:when>
							<c:otherwise>

								<li
									style="background-color: #fed733; height: 130px; font-style: italic; margin-top: 15px;">
									<div class="row">
										<div class="col-sm-2">
											<div id="circle"
												style="margin-top: 40px; margin-left: 15px; position: absolute;">
												<img src="${initParam.root}img/sidelogo.png"
													style="width: 100px; margin-top: 6px;">
											</div>

										</div>
										<div class="col-sm-10">
											<h3 align="center" style="padding-top: 50px;">${spaceuservo.name }</h3>
										</div>
									</div>

								</li>
							</c:otherwise>
						</c:choose>
						<div style="height: 120px; margin-top: 10px;">
							<a href="${initParam.root}getPoint.do" style="border: none;">
								<font>보유 포인트</font><br> <span>${spaceuservo.point}</span> <img
								alt="" src="img/icon/point.png"
								style="width: 40px; margin-bottom: 10px;"><br>
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
									href="${initParam.root}user/view/login.jsp" class="btn-default">로
										그 인</a></li>
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
										<li class="dropdown"><a href="${initParam.root}logout.do">로그아웃</a></li>
									</c:when>

									<c:otherwise>

										<li class="dropdown"><a class="dropdown-toggle"
											data-toggle="dropdown" href="#" style="border: none;"> My
												Page<span class="caret"></span>
										</a>
											<ul class="dropdown-menu">
												<li><a
													href="${initParam.root }getUserInfo.do?id=${spaceuservo.id}">내정보수정</a></li>
												<li><a href="${initParam.root}getAllProductById.do">
														내 공간 / 휴테크 보기</a></li>
												<li><a href="${initParam.root }getAllDealInfo.do">내
														거래내역 보기</a></li>
												<li><a data-toggle="modal" data-target="#myModal">탈퇴하기</a>
												</li>
											</ul></li>
										<li class="dropdown"><a
											href="${initParam.root }getAllNotice.do?notice=true&&pageNo=1"
											style="border: none;">공지사항</a></li>
										<li class="dropdown"><a
											href="${initParam.root }getAllFAQInfo.do?notice=false&&pageNo=1"
											style="border: none;">FAQ</a></li>
										<li class="dropdown"><a
											href="${initParam.root }getOnSaleAuction.do?flag=index"
											style="border: none;">경매</a></li>
										<li class="dropdown"><a
											href="${initParam.root }findComplainById.do"
											style="border: none;">상품신고내역</a></li>
										<li class="dropdown"><a
											href="${initParam.root }logout.do" style="border: none;">로그아웃</a></li>


									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>

					</ul>
					<div style="margin-top: 130px;">
						<a href="${initParam.root }home.jsp"
							class="btn btn-outlined btn-info"> <img
							src="${initParam.root}img/icon/index_arrow.png"
							style="margin-bottom: 7px; margin-right: 20px;">공간기동대 홈 이동
						</a>

					</div>
				</div>

			</div>
		</div>
	</nav>


	<!--====================== content========================== -->
	<div>
		<img id="image1" src="img/index/first.jpg"
			style="position: absolute; width: 100%; height: 650px;">
	</div>
	<div class="container">
		<!-- class container는 가운데 정렬해주는 클래스 -->
		<div id="content">

			<div class="fullwidthbanner" style="position: fixed;">

				<div class="tp-banner">
					<ul>
						<!-- SLIDE -->
						<li data-transition="fade" data-slotamount="5"
							data-masterspeed="1000" data-title="Good Morning">
							<!-- 우상단 검색바, 메뉴바 버튼 -->
							<form action="${initParam.root}searchProductByCondition.do"
								method="post" name="searchByConditionFrm"
								id="searchByConditionFrm">
								<!-- 첫번째 검색 -->
								<div class="caption sft" data-x="50" data-y="80"
									data-speed="1000" data-start="1000" data-easing="easeOutExpo">

									<div class="col-md-2 col-sm-6 margin20  select-option"
										style="width: 200px; position: fixed; line-height: 100%">
										<a class="btn btn-default btn-block" id="i"
											data-toggle="modal" data-target="#modal-area"
											style="font-size: 20px;"> <font id="Select-Area"
											style="color: black;">전체지역</font></a> <input type="hidden"
											id="rar" name="area">
									</div>

								</div>
								<div class="caption sft" data-x="230" data-y="80"
									data-speed="1000" data-start="1000" data-easing="easeOutExpo">
									<div class="col-md-2 col-sm-6 margin20  select-option"
										style="width: 200px;">
										<h2>
											<font style="color: white;">에서</font>
										</h2>
									</div>
								</div>

								<!-- 2번째 검색 -->
								<div class="caption sfl" data-x="50" data-y="150"
									data-speed="1000" data-start="1800" data-easing="easeOutExpo">
									<div class="col-md-2 col-sm-6 margin20  select-option"
										style="width: 200px;">
										<a class="btn btn-default btn-block" style="font-size: 20px;">
											<font id="Select-Accomodation" style="color: black;"
											data-toggle="modal" data-target="#modal-accomodation">
												전체인원</font>
										</a> <input type="hidden" id="rac" name="accomodation">
									</div>
								</div>
								<div class="caption sfl" data-x="230" data-y="150"
									data-speed="1000" data-start="1800" data-easing="easeOutExpo">
									<div class="col-md-2 col-sm-6 margin20  select-option"
										style="width: 200px;">
										<h2>
											<font style="color: white;">이 사용할</font>
										</h2>
									</div>
								</div>
								<!-- 3번째 검색 -->
								<div class="caption sfl" data-x="50" data-y="220"
									data-speed="1000" data-start="1800" data-easing="easeOutExpo">
									<div class="col-md-2 col-sm-6 margin20  select-option"
										style="width: 200px;">
										<a class="btn btn-default btn-block" style="font-size: 20px;">
											<font id="Select-Type" style="color: black;"
											data-toggle="modal" data-target="#modal-type">전체유형</font>
										</a> <input type="hidden" id="rty" name="type">
									</div>
								</div>
								<div class="caption sfl" data-x="230" data-y="220"
									data-speed="1000" data-start="1800" data-easing="easeOutExpo">
									<div class="col-md-2 col-sm-6 margin20  select-option"
										style="width: 200px;">
										<h2>
											<font style="color: white;">공간 / 휴테크</font>
										</h2>
									</div>
								</div>

								<!-- 위 조건으로 검색하기 -->
								<div class="caption sfb" data-x="50" data-y="300"
									data-speed="1000" data-start="2600" data-easing="easeOutExpo">
									<div class="col-md-2 col-sm-6 margin20  select-option"
										style="width: 200px;">
										<h2>
											<font style="color: white;">위 조건으로 검색하기</font>
										</h2>
									</div>
								</div>
								<!-- 검색버튼 -->
								<div class="caption sfb" data-x="50" data-y="350"
									data-speed="1000" data-start="2600" data-easing="easeOutExpo">
									<div class="col-md-2 col-sm-6 margin20" style="width: 200px;">
										<a class="btn btn-search btn-block" style="font-size: 20px;">
											<i class="fa fa-search" style="color: white;"></i> <font
											style="color: white;" id="searchButton"> 검색</font>
										</a>
									</div>
								</div>
							</form>
						</li>
					</ul>
				</div>
			</div>
			<!--full width banner-->
			<!-- 지역정보 모달  -->
			<div id="modal-area" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<!-- AREA Modal content-->
					<div class="modal-content">
						<div class="modal-body">
							<h4>지역선택하기</h4>
							<form action="registerSpace1.jsp" id="licenceFrm" method="post"
								style="padding-top: 3%;">
								<input type="hidden" value="space" name="type">
								<div class="row">
									<ul style="list-style: none;">
										<li><input type="radio" class="radio-inline__input"
											name="licence1" class="radio-inline__input" value="전체지역"
											style="height: 70%" id="area0"><label for="area0"
											style="height: 70%" id="s1" class="radio-inline__label">전체지역</label></li>

										<li><input type="radio" name="licence1"
											class="radio-inline__input" value="서울" style="height: 70%"
											id="area1"><label for="area1" style="height: 70%"
											class="radio-inline__label" id="s1">서울시</label></li>
										<li><input type="radio" name="licence1"
											class="radio-inline__input" value="경기" style="height: 70%"
											id="area2"><label for="area2" id="s2"
											class="radio-inline__label" style="height: 70%">경기도</label></li>
										<li><input type="radio" name="licence1"
											class="radio-inline__input" value="인천" style="height: 70%"
											id="area3"><label for="area3" id="s3"
											class="radio-inline__label" style="height: 70%">인천시</label></li>
										<li><input type="radio" name="licence1"
											class="radio-inline__input" value="부산" style="height: 70%"
											id="area4"><label for="area4" id="s4"
											class="radio-inline__label" style="height: 70%">부산시</label></li>
										<li><input type="radio" name="licence1"
											class="radio-inline__input" value="대전" style="height: 70%"
											id="area5"><label for="area5" id="s5"
											class="radio-inline__label" style="height: 70%">대전시</label></li>
										<li><input type="radio" name="licence1"
											class="radio-inline__input" value="대구" style="height: 70%"
											id="area6"><label for="area6" id="s6"
											class="radio-inline__label" style="height: 70%">대구시</label></li>
										<li><input type="radio" name="licence1"
											class="radio-inline__input" value="울산" style="height: 70%"
											id="area7"><label for="area7" id="s7"
											class="radio-inline__label" style="height: 70%">울산시</label></li>
										<li><input type="radio" name="licence1"
											class="radio-inline__input" value="광주" style="height: 70%"
											id="area9"><label for="area9" id="s9"
											class="radio-inline__label" style="height: 70%">광주시</label></li>
										<li><input type="radio" name="licence1"
											class="radio-inline__input" value="강원" style="height: 70%"
											id="area10"><label for="area10" id="s10"
											class="radio-inline__label" style="height: 70%">강원도</label></li>
										<li><input type="radio" name="licence1"
											class="radio-inline__input" value="충북" style="height: 70%"
											id="area11"><label for="area11" id="s11"
											class="radio-inline__label" style="height: 70%">충청북도</label></li>
										<li><input type="radio" name="licence1"
											class="radio-inline__input" value="충남" style="height: 70%"
											id="area12"><label for="area12" id="s12"
											class="radio-inline__label" style="height: 70%">충청남도</label></li>
										<li><input type="radio" name="licence1"
											class="radio-inline__input" value="경북" style="height: 70%"
											id="area13"><label for="area13" id="s13"
											class="radio-inline__label" style="height: 70%">경상북도</label></li>
										<li><input type="radio" name="licence1"
											class="radio-inline__input" value="경남" style="height: 70%"
											id="area14"><label for="area14" id="s14"
											class="radio-inline__label" style="height: 70%">경상남도</label></li>
										<li><input type="radio" name="licence1"
											class="radio-inline__input" value="전북" style="height: 70%"
											id="area15"><label for="area15" id="s15"
											class="radio-inline__label" style="height: 70%">전라북도</label></li>
										<li><input type="radio" name="licence1"
											class="radio-inline__input" value="전남" style="height: 70%"
											id="area16"><label for="area16" id="s16"
											class="radio-inline__label" style="height: 70%">전라남도</label></li>
										<li><input type="radio" name="licence1"
											class="radio-inline__input" value="제주특별자치도"
											style="height: 70%" id="area17"><label for="area17"
											id="s17" class="radio-inline__label" style="height: 70%">제주도</label></li>
									</ul>
								</div>

								<div></div>

								<div align="center">

									<button type="button" class="btn btn-red" data-dismiss="modal"
										id="checkArea">확인</button>


								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
			<div id="modal-area1-1" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<!-- AREA Modal content-->
					<div class="modal-content">
						<div class="modal-body">
							<h4>지역선택하기</h4>
							<form action="registerSpace1.jsp" id="licenceFrm" method="post"
								style="padding-top: 3%;">
								<input type="hidden" value="space" name="type">
								<div class="row">
									<ul style="list-style: none;">
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="강남구" style="height: 70%"
											id="area1-1"><label for="area1-1"
											class="radio-inline__label" style="height: 70%" id="s">강남구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="강동구" style="height: 70%"
											id="area1-2"><label for="area1-2" id="s2"
											class="radio-inline__label" style="height: 70%">강동구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="강북구" style="height: 70%"
											id="area1-3"><label for="area1-3" id="s3-1"
											class="radio-inline__label" style="height: 70%">강북구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="강서구" style="height: 70%"
											id="area1-4"><label for="area1-4" id="s4-1"
											class="radio-inline__label" style="height: 70%">강서구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="관악구" style="height: 70%"
											id="area1-5"><label for="area1-5" id="s5-1"
											class="radio-inline__label" style="height: 70%">관악구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="광진구" style="height: 70%"
											id="area1-6"><label for="area1-6" id="s6-1"
											class="radio-inline__label" style="height: 70%">광진구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="구로구" style="height: 70%"
											id="area1-7"><label for="area1-7" id="s7-1"
											class="radio-inline__label" style="height: 70%">구로구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="금천구" style="height: 70%"
											id="area1-8"><label for="area1-8"
											class="radio-inline__label" id="s8" style="height: 70%">금천구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="노원구" style="height: 70%"
											id="area1-9"><label for="area1-9" id="s9"
											class="radio-inline__label" style="height: 70%">노원구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="도봉구" style="height: 70%"
											id="area1-10"><label for="area1-10" id="s10"
											class="radio-inline__label" style="height: 70%">도봉구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="동대문구" style="height: 70%"
											id="area1-11"><label for="area1-11" id="s11"
											class="radio-inline__label" style="height: 70%">동대문구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="동작구" style="height: 70%"
											id="area1-12"><label for="area1-12" id="s12"
											class="radio-inline__label" style="height: 70%">동작구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="마포구" style="height: 70%"
											id="area1-13"><label for="area1-13" id="s13"
											class="radio-inline__label" style="height: 70%">마포구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="서대문구" style="height: 70%"
											id="area1-14"><label for="area1-14" id="s14"
											class="radio-inline__label" style="height: 70%">서대문구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="서초구" style="height: 70%"
											id="area1-15"><label for="area1-15" id="s15"
											class="radio-inline__label" style="height: 70%">서초구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="성동구" style="height: 70%"
											id="area1-16"><label for="area1-16" id="s16"
											class="radio-inline__label" style="height: 70%">성동구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="송파구" style="height: 70%"
											id="area1-17"><label for="area1-17" id="s17"
											class="radio-inline__label" style="height: 70%">송파구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="양천구" style="height: 70%"
											id="area1-18"><label for="area1-18" id="s17"
											class="radio-inline__label" style="height: 70%">양천구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="영등포구" style="height: 70%"
											id="area1-19"><label for="area1-19" id="s17"
											class="radio-inline__label" style="height: 70%">영등포구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="용산구" style="height: 70%"
											id="area1-20"><label for="area1-20" id="s17"
											class="radio-inline__label" style="height: 70%">용산구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="은평구" style="height: 70%"
											id="area1-21"><label for="area1-21" id="s"
											class="radio-inline__label" style="height: 70%">은평구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="종로구" style="height: 70%"
											id="area1-22"><label for="area1-22" id="s"
											class="radio-inline__label" style="height: 70%">종로구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="중구" style="height: 70%"
											id="area1-23"><label for="area1-23" id="s"
											class="radio-inline__label" style="height: 70%">중구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="중랑구" style="height: 70%"
											id="area1-24"><label for="area1-24" id="s"
											class="radio-inline__label" style="height: 70%">중랑구</label></li>
									</ul>
								</div>

								<div></div>

								<div align="center">
									<button type="button" class="btn btn-red" id="finalAreaCheck"
										data-dismiss="modal">확인</button>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>


			<div id="modal-area2" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<!-- AREA Modal content-->
					<div class="modal-content">
						<div class="modal-body">
							<h4>지역선택하기</h4>
							<form action="registerSpace1.jsp" id="licenceFrm" method="post"
								style="padding-top: 3%;">
								<input type="hidden" value="space" name="type">
								<div class="row">
									<ul style="list-style: none;">
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="가평군" style="height: 70%"
											id="area2-1"><label for="area2-1"
											class="radio-inline__label" style="height: 70%" id="s">가평군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="고양시 덕양구"
											style="height: 70%" id="area2-2"><label for="area2-2"
											id="s2" class="radio-inline__label" style="height: 70%">고양시
												덕양구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="고양시 일산동구"
											style="height: 70%" id="area2-3"><label for="area2-3"
											id="s3-1" class="radio-inline__label" style="height: 70%">고양시
												일산동구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="과천시" style="height: 70%"
											id="area2-4"><label for="area2-4" id="s4-1"
											class="radio-inline__label" style="height: 70%">과천시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="광명시" style="height: 70%"
											id="area2-5"><label for="area2-5" id="s5-1"
											class="radio-inline__label" style="height: 70%">광명시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="광주시" style="height: 70%"
											id="area2-6"><label for="area2-6" id="s6-1"
											class="radio-inline__label" style="height: 70%">광주시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="구리시" style="height: 70%"
											id="area2-7"><label for="area2-7" id="s7-1"
											class="radio-inline__label" style="height: 70%">구리시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="군포시" style="height: 70%"
											id="area2-8"><label for="area2-8"
											class="radio-inline__label" id="s8" style="height: 70%">군포시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="남양주시" style="height: 70%"
											id="area2-9"><label for="area2-9" id="s9"
											class="radio-inline__label" style="height: 70%">남양주시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="동두천시" style="height: 70%"
											id="area2-10"><label for="area2-10" id="s10"
											class="radio-inline__label" style="height: 70%">동두천시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="부천시" style="height: 70%"
											id="area2-11"><label for="area2-11" id="s11"
											class="radio-inline__label" style="height: 70%">부천시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="성남시 분당구"
											style="height: 70%" id="area2-12"><label
											for="area2-12" id="s12" class="radio-inline__label"
											style="height: 70%">성남시 분당구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="성남시 중원구"
											style="height: 70%" id="area2-13"><label
											for="area2-13" id="s13" class="radio-inline__label"
											style="height: 70%">성남시 중원구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="수원시 권선구"
											style="height: 70%" id="area2-14"><label
											for="area2-14" id="s14" class="radio-inline__label"
											style="height: 70%">수원시 권선구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="수원시 영통구"
											style="height: 70%" id="area2-15"><label
											for="area2-15" id="s15" class="radio-inline__label"
											style="height: 70%">수원시 영통구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="수원시 장안구"
											style="height: 70%" id="area2-16"><label
											for="area2-16" id="s16" class="radio-inline__label"
											style="height: 70%">수원시 장안구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="수원시 팔달구"
											style="height: 70%" id="area2-17"><label
											for="area2-17" id="s17" class="radio-inline__label"
											style="height: 70%">수원시 팔달구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="시흥시" style="height: 70%"
											id="area2-18"><label for="area2-18" id="s17"
											class="radio-inline__label" style="height: 70%">시흥시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="안산시 단원구"
											style="height: 70%" id="area2-19"><label
											for="area2-19" id="s17" class="radio-inline__label"
											style="height: 70%">안산시 단원구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="안산시 상록구"
											style="height: 70%" id="area2-20"><label
											for="area2-20" id="s17" class="radio-inline__label"
											style="height: 70%">안산시 상록구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="안성시" style="height: 70%"
											id="area2-21"><label for="area2-21" id="s"
											class="radio-inline__label" style="height: 70%">안성시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="안양시 동안구"
											style="height: 70%" id="area2-22"><label
											for="area2-22" id="s" class="radio-inline__label"
											style="height: 70%">안양시 동안구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="안양시 만안구"
											style="height: 70%" id="area2-23"><label
											for="area2-23" id="s" class="radio-inline__label"
											style="height: 70%">안양시 만안구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="양주시" style="height: 70%"
											id="area2-24"><label for="area2-24" id="s"
											class="radio-inline__label" style="height: 70%">양주시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="양평군" style="height: 70%"
											id="area2-25"><label for="area2-25" id="s"
											class="radio-inline__label" style="height: 70%">양평군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="여주시" style="height: 70%"
											id="area2-26"><label for="area2-26" id="s"
											class="radio-inline__label" style="height: 70%">여주시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="연천군" style="height: 70%"
											id="area2-27"><label for="area2-27" id="s"
											class="radio-inline__label" style="height: 70%">연천군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="오산시" style="height: 70%"
											id="area2-28"><label for="area2-28" id="s"
											class="radio-inline__label" style="height: 70%">오산시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="양주시" style="height: 70%"
											id="area2-29"><label for="area2-29" id="s"
											class="radio-inline__label" style="height: 70%">양주시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="용인시 기흥구"
											style="height: 70%" id="area2-30"><label
											for="area2-30" id="s" class="radio-inline__label"
											style="height: 70%">용인시 기흥구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="용인시 수지구"
											style="height: 70%" id="area2-31"><label
											for="area2-31" id="s" class="radio-inline__label"
											style="height: 70%">용인시 수지구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="용인시 처인구"
											style="height: 70%" id="area2-32"><label
											for="area2-32" id="s" class="radio-inline__label"
											style="height: 70%">용인시 처인구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="의왕시" style="height: 70%"
											id="area2-33"><label for="area2-33" id="s"
											class="radio-inline__label" style="height: 70%">의왕시</label></li>
									</ul>
								</div>
								<div align="center">
									<button type="button" class="btn btn-red" id="finalAreaCheck2"
										data-dismiss="modal">확인</button>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
			<div id="modal-area3" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<!-- AREA Modal content-->
					<div class="modal-content">
						<div class="modal-body">
							<h4>지역선택하기</h4>
							<form action="registerSpace1.jsp" id="licenceFrm" method="post"
								style="padding-top: 3%;">
								<input type="hidden" value="space" name="type">
								<div class="row">
									<ul style="list-style: none;">
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="강화군" style="height: 70%"
											id="area3-1"><label for="area3-1"
											class="radio-inline__label" style="height: 70%" id="s">강화군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="계양구" style="height: 70%"
											id="area3-2"><label for="area3-2" id="s3-1"
											class="radio-inline__label" style="height: 70%">계양구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="남구" style="height: 70%"
											id="area3-3"><label for="area3-3" id="s4-1"
											class="radio-inline__label" style="height: 70%">남구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="남동구" style="height: 70%"
											id="area3-4"><label for="area3-4" id="s5-1"
											class="radio-inline__label" style="height: 70%">남동구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="동구" style="height: 70%"
											id="area3-5"><label for="area3-5" id="s6-1"
											class="radio-inline__label" style="height: 70%">동구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="부평구" style="height: 70%"
											id="area3-6"><label for="area3-6" id="s7-1"
											class="radio-inline__label" style="height: 70%">부평구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="서구" style="height: 70%"
											id="area3-7"><label for="area3-7"
											class="radio-inline__label" id="s8" style="height: 70%">서구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="연수구" style="height: 70%"
											id="area3-8"><label for="area3-8" id="s9"
											class="radio-inline__label" style="height: 70%">연수구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="옹진군" style="height: 70%"
											id="area3-9"><label for="area3-9" id="s10"
											class="radio-inline__label" style="height: 70%">옹진군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="중구" style="height: 70%"
											id="area3-10"><label for="area3-10" id="s11"
											class="radio-inline__label" style="height: 70%">중구</label></li>

									</ul>
								</div>
								<div align="center">
									<button type="button" class="btn btn-red" id="finalAreaCheck3"
										data-dismiss="modal">확인</button>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>

			<div id="modal-area4" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<!-- AREA Modal content-->
					<div class="modal-content">
						<div class="modal-body">
							<h4>지역선택하기</h4>
							<form action="registerSpace1.jsp" id="licenceFrm" method="post"
								style="padding-top: 3%;">
								<input type="hidden" value="space" name="type">
								<div class="row">
									<ul style="list-style: none;">
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="강서구" style="height: 70%"
											id="area4-1"><label for="area4-1"
											class="radio-inline__label" style="height: 70%" id="s">강서구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="금정구" style="height: 70%"
											id="area4-2"><label for="area4-2" id="s2"
											class="radio-inline__label" style="height: 70%">금정구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="기장군" style="height: 70%"
											id="area4-3"><label for="area4-3" id="s3-1"
											class="radio-inline__label" style="height: 70%">기장군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="남구" style="height: 70%"
											id="area4-4"><label for="area4-4" id="s4-1"
											class="radio-inline__label" style="height: 70%">남구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="동구" style="height: 70%"
											id="area4-5"><label for="area4-5" id="s5-1"
											class="radio-inline__label" style="height: 70%">동구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="동래구" style="height: 70%"
											id="area4-6"><label for="area4-6" id="s6-1"
											class="radio-inline__label" style="height: 70%">동래구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="부산진구" style="height: 70%"
											id="area4-7"><label for="area4-7" id="s7-1"
											class="radio-inline__label" style="height: 70%">부산진구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="북구" style="height: 70%"
											id="area4-8"><label for="area4-8"
											class="radio-inline__label" id="s8" style="height: 70%">북구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="사상구" style="height: 70%"
											id="area4-9"><label for="area4-9" id="s9"
											class="radio-inline__label" style="height: 70%">사상구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="사하구" style="height: 70%"
											id="area4-10"><label for="area4-10" id="s10"
											class="radio-inline__label" style="height: 70%">사하구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="서구" style="height: 70%"
											id="area4-11"><label for="area4-11" id="s11"
											class="radio-inline__label" style="height: 70%">서구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="수영구" style="height: 70%"
											id="area4-12"><label for="area4-12" id="s12"
											class="radio-inline__label" style="height: 70%">수영구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="연제구" style="height: 70%"
											id="area4-13"><label for="area4-13" id="s13"
											class="radio-inline__label" style="height: 70%">연제구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="영도구" style="height: 70%"
											id="area4-14"><label for="area4-14" id="s14"
											class="radio-inline__label" style="height: 70%">영도구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="중구" style="height: 70%"
											id="area4-15"><label for="area4-15" id="s15"
											class="radio-inline__label" style="height: 70%">중구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="해운대구" style="height: 70%"
											id="area4-16"><label for="area4-16" id="s16"
											class="radio-inline__label" style="height: 70%">해운대구</label></li>

									</ul>
								</div>
								<div align="center">
									<button type="button" class="btn btn-red" id="finalAreaCheck4"
										data-dismiss="modal">확인</button>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
			<div id="modal-area5" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<!-- AREA Modal content-->
					<div class="modal-content">
						<div class="modal-body">
							<h4>지역선택하기</h4>
							<form action="registerSpace1.jsp" id="licenceFrm" method="post"
								style="padding-top: 3%;">
								<input type="hidden" value="space" name="type">
								<div class="row">
									<ul style="list-style: none;">
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="대덕구" style="height: 70%"
											id="area5-1"><label for="area5-1"
											class="radio-inline__label" style="height: 70%" id="s">대덕구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="동구" style="height: 70%"
											id="area5-2"><label for="area5-2" id="s2"
											class="radio-inline__label" style="height: 70%">동구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="서구" style="height: 70%"
											id="area5-3"><label for="area5-3" id="s3-1"
											class="radio-inline__label" style="height: 70%">서구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="유섣구" style="height: 70%"
											id="area5-4"><label for="area5-4" id="s4-1"
											class="radio-inline__label" style="height: 70%">유성구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="중구" style="height: 70%"
											id="area5-5"><label for="area5-5" id="s5-1"
											class="radio-inline__label" style="height: 70%">중구</label></li>


									</ul>
								</div>
								<div align="center">
									<button type="button" class="btn btn-red" id="finalAreaCheck5"
										data-dismiss="modal">확인</button>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
			<div id="modal-area6" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<!-- AREA Modal content-->
					<div class="modal-content">
						<div class="modal-body">
							<h4>지역선택하기</h4>
							<form action="registerSpace1.jsp" id="licenceFrm" method="post"
								style="padding-top: 3%;">
								<input type="hidden" value="space" name="type">
								<div class="row">
									<ul style="list-style: none;">
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="남구" style="height: 70%"
											id="area6-1"><label for="area6-1"
											class="radio-inline__label" style="height: 70%" id="s">남구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="달서구" style="height: 70%"
											id="area6-2"><label for="area6-2" id="s2"
											class="radio-inline__label" style="height: 70%">달서구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="달성군" style="height: 70%"
											id="area6-3"><label for="area6-3" id="s3-1"
											class="radio-inline__label" style="height: 70%">달성군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="동구" style="height: 70%"
											id="area6-4"><label for="area6-4" id="s4-1"
											class="radio-inline__label" style="height: 70%">동구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="북구" style="height: 70%"
											id="area6-5"><label for="area6-5" id="s5-1"
											class="radio-inline__label" style="height: 70%">북구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="서구" style="height: 70%"
											id="area6-6"><label for="area6-6" id="s6-1"
											class="radio-inline__label" style="height: 70%">서구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="수성구" style="height: 70%"
											id="area6-7"><label for="area6-7" id="s7-1"
											class="radio-inline__label" style="height: 70%">수성구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="중구" style="height: 70%"
											id="area6-8"><label for="area6-8"
											class="radio-inline__label" id="s8" style="height: 70%">중구</label></li>
									</ul>
								</div>
								<div align="center">
									<button type="button" class="btn btn-red" id="finalAreaCheck6"
										data-dismiss="modal">확인</button>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
			<div id="modal-area7" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<!-- AREA Modal content-->
					<div class="modal-content">
						<div class="modal-body">
							<h4>지역선택하기</h4>
							<form action="registerSpace1.jsp" id="licenceFrm" method="post"
								style="padding-top: 3%;">
								<input type="hidden" value="space" name="type">
								<div class="row">
									<ul style="list-style: none;">
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="남구" style="height: 70%"
											id="area7-1"><label for="area7-1"
											class="radio-inline__label" style="height: 70%" id="s">남구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="동구" style="height: 70%"
											id="area7-2"><label for="area7-2" id="s2"
											class="radio-inline__label" style="height: 70%">동구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="북구" style="height: 70%"
											id="area7-3"><label for="area7-3" id="s3-1"
											class="radio-inline__label" style="height: 70%">북구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="울주군" style="height: 70%"
											id="area7-4"><label for="area7-4" id="s4-1"
											class="radio-inline__label" style="height: 70%">울주군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="중구" style="height: 70%"
											id="area7-5"><label for="area7-5" id="s5-1"
											class="radio-inline__label" style="height: 70%">중구</label></li>
									</ul>
								</div>
								<div align="center">
									<button type="button" class="btn btn-red" id="finalAreaCheck7"
										data-dismiss="modal">확인</button>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
			<div id="modal-area8" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<!-- AREA Modal content-->
					<div class="modal-content">
						<div class="modal-body">
							<h4>지역선택하기</h4>
							<form action="registerSpace1.jsp" id="licenceFrm" method="post"
								style="padding-top: 3%;">
								<input type="hidden" value="space" name="type">
								<div class="row">
									<ul style="list-style: none;">
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="광산구" style="height: 70%"
											id="area8-1"><label for="area8-1"
											class="radio-inline__label" style="height: 70%" id="s">광산구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="남구" style="height: 70%"
											id="area8-2"><label for="area8-2" id="s2"
											class="radio-inline__label" style="height: 70%">남구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="동구" style="height: 70%"
											id="area8-3"><label for="area8-3" id="s3-1"
											class="radio-inline__label" style="height: 70%">동구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="복구" style="height: 70%"
											id="area8-4"><label for="area8-4" id="s4-1"
											class="radio-inline__label" style="height: 70%">북구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="서구" style="height: 70%"
											id="area8-5"><label for="area8-5" id="s5-1"
											class="radio-inline__label" style="height: 70%">서구</label></li>
									</ul>
								</div>
								<div align="center">
									<button type="button" class="btn btn-red" id="finalAreaCheck8"
										data-dismiss="modal">확인</button>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
			<div id="modal-area9" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<!-- AREA Modal content-->
					<div class="modal-content">
						<div class="modal-body">
							<h4>지역선택하기</h4>
							<form action="registerSpace1.jsp" id="licenceFrm" method="post"
								style="padding-top: 3%;">
								<input type="hidden" value="space" name="type">
								<div class="row">
									<ul style="list-style: none;">
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="강릉시" style="height: 70%"
											id="area9-1"><label for="area9-1"
											class="radio-inline__label" style="height: 70%" id="s">강릉시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="고성군" style="height: 70%"
											id="area9-2"><label for="area9-2" id="s2"
											class="radio-inline__label" style="height: 70%">고성군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="동해시" style="height: 70%"
											id="area9-3"><label for="area9-3" id="s3-1"
											class="radio-inline__label" style="height: 70%">동해시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="삼척시" style="height: 70%"
											id="area9-4"><label for="area9-4" id="s4-1"
											class="radio-inline__label" style="height: 70%">삼척시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="속초시" style="height: 70%"
											id="area9-5"><label for="area9-5" id="s5-1"
											class="radio-inline__label" style="height: 70%">속초시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="양구군" style="height: 70%"
											id="area9-6"><label for="area9-6" id="s6-1"
											class="radio-inline__label" style="height: 70%">양구군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="양양군" style="height: 70%"
											id="area9-7"><label for="area9-7" id="s7-1"
											class="radio-inline__label" style="height: 70%">양양군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="영월군" style="height: 70%"
											id="area9-8"><label for="area9-8"
											class="radio-inline__label" id="s8" style="height: 70%">영월군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="원주시" style="height: 70%"
											id="area9-9"><label for="area9-9" id="s9"
											class="radio-inline__label" style="height: 70%">원주시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="인제군" style="height: 70%"
											id="area9-10"><label for="area9-10" id="s10"
											class="radio-inline__label" style="height: 70%">인제군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="정선군" style="height: 70%"
											id="area9-11"><label for="area9-11" id="s11"
											class="radio-inline__label" style="height: 70%">정선군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="철원군" style="height: 70%"
											id="area9-12"><label for="area9-12" id="s12"
											class="radio-inline__label" style="height: 70%">철원군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="춘천시" style="height: 70%"
											id="area9-13"><label for="area9-13" id="s13"
											class="radio-inline__label" style="height: 70%">춘천시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="태백시" style="height: 70%"
											id="area9-14"><label for="area9-14" id="s14"
											class="radio-inline__label" style="height: 70%">태백시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="평창군" style="height: 70%"
											id="area9-15"><label for="area9-15" id="s15"
											class="radio-inline__label" style="height: 70%">평창군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="홍천군" style="height: 70%"
											id="area9-16"><label for="area9-16" id="s16"
											class="radio-inline__label" style="height: 70%">홍천군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="화천군" style="height: 70%"
											id="area9-17"><label for="area9-17" id="s17"
											class="radio-inline__label" style="height: 70%">화천군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="횡성군" style="height: 70%"
											id="area9-18"><label for="area9-18" id="s17"
											class="radio-inline__label" style="height: 70%">횡성군</label></li>
									</ul>
								</div>

								<div></div>

								<div align="center">
									<button type="button" class="btn btn-red" id="finalAreaCheck9"
										data-dismiss="modal">확인</button>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
			<div id="modal-area10" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<!-- AREA Modal content-->
					<div class="modal-content">
						<div class="modal-body">
							<h4>지역선택하기</h4>
							<form action="registerSpace1.jsp" id="licenceFrm" method="post"
								style="padding-top: 3%;">
								<input type="hidden" value="space" name="type">
								<div class="row">
									<ul style="list-style: none;">
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="괴산군" style="height: 70%"
											id="area10-1"><label for="area10-1"
											class="radio-inline__label" style="height: 70%" id="s">괴산군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="단양군" style="height: 70%"
											id="area10-2"><label for="area10-2" id="s2"
											class="radio-inline__label" style="height: 70%">단양군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="보은군" style="height: 70%"
											id="area10-3"><label for="area10-3" id="s3-1"
											class="radio-inline__label" style="height: 70%">보은군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="영동군" style="height: 70%"
											id="area10-4"><label for="area10-4" id="s4-1"
											class="radio-inline__label" style="height: 70%">영등군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="옥천군" style="height: 70%"
											id="area10-5"><label for="area10-5" id="s5-1"
											class="radio-inline__label" style="height: 70%">옥천시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="음성군" style="height: 70%"
											id="area10-6"><label for="area10-6" id="s6-1"
											class="radio-inline__label" style="height: 70%">음성군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="제천시" style="height: 70%"
											id="area10-7"><label for="area10-7" id="s7-1"
											class="radio-inline__label" style="height: 70%">제천시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="증평군" style="height: 70%"
											id="area10-8"><label for="area10-8"
											class="radio-inline__label" id="s8" style="height: 70%">증평군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="진천군" style="height: 70%"
											id="area10-9"><label for="area10-9" id="s9"
											class="radio-inline__label" style="height: 70%">진천군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="청주시 상당구"
											style="height: 70%" id="area10-10"><label
											for="area10-10" id="s10" class="radio-inline__label"
											style="height: 70%">청주시 상당구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="청주시 서원구"
											style="height: 70%" id="area10-11"><label
											for="area10-11" id="s11" class="radio-inline__label"
											style="height: 70%">청주시 서원구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="청주시 청원구"
											style="height: 70%" id="area10-12"><label
											for="area10-12" id="s12" class="radio-inline__label"
											style="height: 70%">청주시 청원구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="청주시 흥덕구"
											style="height: 70%" id="area10-13"><label
											for="area10-13" id="s13" class="radio-inline__label"
											style="height: 70%">청주시 흥덕구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="충주시" style="height: 70%"
											id="area10-14"><label for="area10-14" id="s14"
											class="radio-inline__label" style="height: 70%">충주시</label></li>
									</ul>
								</div>

								<div></div>

								<div align="center">
									<button type="button" class="btn btn-red" id="finalAreaCheck10"
										data-dismiss="modal">확인</button>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
			<div id="modal-area11" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<!-- AREA Modal content-->
					<div class="modal-content">
						<div class="modal-body">
							<h4>지역선택하기</h4>
							<form action="registerSpace1.jsp" id="licenceFrm" method="post"
								style="padding-top: 3%;">
								<input type="hidden" value="space" name="type">
								<div class="row">
									<ul style="list-style: none;">
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="계룡시" style="height: 70%"
											id="area11-1"><label for="area11-1"
											class="radio-inline__label" style="height: 70%" id="s">계룡시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="공주시" style="height: 70%"
											id="area11-2"><label for="area11-2" id="s2"
											class="radio-inline__label" style="height: 70%">공주시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="금산군" style="height: 70%"
											id="area11-3"><label for="area11-3" id="s3-1"
											class="radio-inline__label" style="height: 70%">금산군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="논산시" style="height: 70%"
											id="area11-4"><label for="area11-4" id="s4-1"
											class="radio-inline__label" style="height: 70%">논산시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="당진시" style="height: 70%"
											id="area11-5"><label for="area11-5" id="s5-1"
											class="radio-inline__label" style="height: 70%">당진시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="보령시" style="height: 70%"
											id="area11-6"><label for="area11-6" id="s6-1"
											class="radio-inline__label" style="height: 70%">보령시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="부여군" style="height: 70%"
											id="area11-7"><label for="area11-7" id="s7-1"
											class="radio-inline__label" style="height: 70%">부여군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="서산시" style="height: 70%"
											id="area11-8"><label for="area11-8"
											class="radio-inline__label" id="s8" style="height: 70%">서산시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="서천군" style="height: 70%"
											id="area11-9"><label for="area11-9" id="s9"
											class="radio-inline__label" style="height: 70%">서천군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="아산시" style="height: 70%"
											id="area11-10"><label for="area11-10" id="s10"
											class="radio-inline__label" style="height: 70%">아산시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="예산군" style="height: 70%"
											id="area11-11"><label for="area11-11" id="s11"
											class="radio-inline__label" style="height: 70%">예산군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="천안시 동남구"
											style="height: 70%" id="area11-12"><label
											for="area11-12" id="s12" class="radio-inline__label"
											style="height: 70%">천안시 동남구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="천안시 서북구"
											style="height: 70%" id="area11-13"><label
											for="area11-13" id="s13" class="radio-inline__label"
											style="height: 70%">천안시 서북구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="청양군" style="height: 70%"
											id="area11-14"><label for="area11-14" id="s14"
											class="radio-inline__label" style="height: 70%">청양군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="태안군" style="height: 70%"
											id="area11-15"><label for="area11-15" id="s14"
											class="radio-inline__label" style="height: 70%">태안군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="홍성군" style="height: 70%"
											id="area11-16"><label for="area11-16" id="s14"
											class="radio-inline__label" style="height: 70%">홍성군</label></li>
									</ul>
								</div>

								<div></div>

								<div align="center">
									<button type="button" class="btn btn-red" id="finalAreaCheck11"
										data-dismiss="modal">확인</button>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
			<div id="modal-area12" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<!-- AREA Modal content-->
					<div class="modal-content">
						<div class="modal-body">
							<h4>지역선택하기</h4>
							<form action="registerSpace1.jsp" id="licenceFrm" method="post"
								style="padding-top: 3%;">
								<input type="hidden" value="space" name="type">
								<div class="row">
									<ul style="list-style: none;">
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="경산시" style="height: 70%"
											id="area12-1"><label for="area12-1"
											class="radio-inline__label" style="height: 70%" id="s">경산시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="경주시" style="height: 70%"
											id="area12-2"><label for="area12-2"
											class="radio-inline__label" style="height: 70%" id="s">경주시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="고령군" style="height: 70%"
											id="area12-3"><label for="area12-3"
											class="radio-inline__label" style="height: 70%" id="s">고령군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="구미시" style="height: 70%"
											id="area12-4"><label for="area12-4"
											class="radio-inline__label" style="height: 70%" id="s">구미시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="군위군" style="height: 70%"
											id="area12-5"><label for="area12-5"
											class="radio-inline__label" style="height: 70%" id="s">군위시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="김천시" style="height: 70%"
											id="area12-6"><label for="area12-6"
											class="radio-inline__label" style="height: 70%" id="s">김천시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="문경시" style="height: 70%"
											id="area12-7"><label for="area12-7"
											class="radio-inline__label" style="height: 70%" id="s">문경시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="봉화군" style="height: 70%"
											id="area12-8"><label for="area12-8"
											class="radio-inline__label" style="height: 70%" id="s">봉화군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="상주시" style="height: 70%"
											id="area12-9"><label for="area12-9"
											class="radio-inline__label" style="height: 70%" id="s">상주시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="성주군" style="height: 70%"
											id="area12-10"><label for="area12-10"
											class="radio-inline__label" style="height: 70%" id="s">성주군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="안동시" style="height: 70%"
											id="area12-11"><label for="area12-11"
											class="radio-inline__label" style="height: 70%" id="s">안동시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="영덕군" style="height: 70%"
											id="area12-12"><label for="area12-12"
											class="radio-inline__label" style="height: 70%" id="s">영덕군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="영양군" style="height: 70%"
											id="area12-13"><label for="area12-13"
											class="radio-inline__label" style="height: 70%" id="s">영양군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="영주시" style="height: 70%"
											id="area12-14"><label for="area12-14"
											class="radio-inline__label" style="height: 70%" id="s">영주시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="영천시" style="height: 70%"
											id="area12-15"><label for="area12-15"
											class="radio-inline__label" style="height: 70%" id="s">영천시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="예천군" style="height: 70%"
											id="area12-16"><label for="area12-16"
											class="radio-inline__label" style="height: 70%" id="s">여천군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="울릉군" style="height: 70%"
											id="area12-17"><label for="area12-17"
											class="radio-inline__label" style="height: 70%" id="s">울릉군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="울진군" style="height: 70%"
											id="area12-18"><label for="area12-18"
											class="radio-inline__label" style="height: 70%" id="s">울진군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="의성군" style="height: 70%"
											id="area12-19"><label for="area12-19"
											class="radio-inline__label" style="height: 70%" id="s">의성군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="청도군" style="height: 70%"
											id="area12-20"><label for="area12-20"
											class="radio-inline__label" style="height: 70%" id="s">청도군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="청송군" style="height: 70%"
											id="area12-21"><label for="area12-21"
											class="radio-inline__label" style="height: 70%" id="s">청송군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="칠곡군" style="height: 70%"
											id="area12-22"><label for="area12-22"
											class="radio-inline__label" style="height: 70%" id="s">칠곡군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="포항시 남구"
											style="height: 70%" id="area12-23"><label
											for="area12-23" class="radio-inline__label"
											style="height: 70%" id="s">포항시 남구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="포항시 북구"
											style="height: 70%" id="area12-24"><label
											for="area12-24" class="radio-inline__label"
											style="height: 70%" id="s">포항시 북구</label></li>
									</ul>
								</div>

								<div></div>

								<div align="center">
									<button type="button" class="btn btn-red" id="finalAreaCheck12"
										data-dismiss="modal">확인</button>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
			<div id="modal-area13" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<!-- AREA Modal content-->
					<div class="modal-content">
						<div class="modal-body">
							<h4>지역선택하기</h4>
							<form action="registerSpace1.jsp" id="licenceFrm" method="post"
								style="padding-top: 3%;">
								<input type="hidden" value="space" name="type">
								<div class="row">
									<ul style="list-style: none;">
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="거제시" style="height: 70%"
											id="area13-1"><label for="area13-1"
											class="radio-inline__label" style="height: 70%" id="s">거제시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="거창군" style="height: 70%"
											id="area13-2"><label for="area13-2"
											class="radio-inline__label" style="height: 70%" id="s">거창군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="고성군" style="height: 70%"
											id="area13-3"><label for="area13-3"
											class="radio-inline__label" style="height: 70%" id="s">고성군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="김해시" style="height: 70%"
											id="area13-4"><label for="area13-4"
											class="radio-inline__label" style="height: 70%" id="s">김해시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="남해군" style="height: 70%"
											id="area13-5"><label for="area13-5"
											class="radio-inline__label" style="height: 70%" id="s">남해군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="밀양시" style="height: 70%"
											id="area13-6"><label for="area13-6"
											class="radio-inline__label" style="height: 70%" id="s">일양시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="사천시" style="height: 70%"
											id="area13-7"><label for="area13-7"
											class="radio-inline__label" style="height: 70%" id="s">사천시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="산청군" style="height: 70%"
											id="area13-8"><label for="area13-8"
											class="radio-inline__label" style="height: 70%" id="s">산청군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="양산시" style="height: 70%"
											id="area13-9"><label for="area13-9"
											class="radio-inline__label" style="height: 70%" id="s">양산시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="의령군" style="height: 70%"
											id="area13-10"><label for="area13-10"
											class="radio-inline__label" style="height: 70%" id="s">의령군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="진주시" style="height: 70%"
											id="area13-11"><label for="area13-11"
											class="radio-inline__label" style="height: 70%" id="s">진주시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="창녕군" style="height: 70%"
											id="area13-12"><label for="area13-12"
											class="radio-inline__label" style="height: 70%" id="s">창녕군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="창원시 마산합포구"
											style="height: 70%" id="area13-13"><label
											for="area13-13" class="radio-inline__label"
											style="height: 70%" id="s">창원 마산합포구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="창원시 마산회원구"
											style="height: 70%" id="area13-14"><label
											for="area13-14" class="radio-inline__label"
											style="height: 70%" id="s">창원 마산회원구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="창원시 성산구"
											style="height: 70%" id="area13-15"><label
											for="area13-15" class="radio-inline__label"
											style="height: 70%" id="s"> 창원 마산성산구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="창원시 의창구"
											style="height: 70%" id="area13-16"><label
											for="area13-16" class="radio-inline__label"
											style="height: 70%" id="s"> 창원 의창구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="창원시 진해구"
											style="height: 70%" id="area13-17"><label
											for="area13-17" class="radio-inline__label"
											style="height: 70%" id="s"> 창원 진해구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="통영시" style="height: 70%"
											id="area13-18"><label for="area13-18"
											class="radio-inline__label" style="height: 70%" id="s">통영군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="하동군" style="height: 70%"
											id="area13-19"><label for="area13-19"
											class="radio-inline__label" style="height: 70%" id="s">하동군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="함안군" style="height: 70%"
											id="area13-20"><label for="area13-20"
											class="radio-inline__label" style="height: 70%" id="s">함안군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="함양군" style="height: 70%"
											id="area13-21"><label for="area13-21"
											class="radio-inline__label" style="height: 70%" id="s">함양군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="합천군" style="height: 70%"
											id="area13-22"><label for="area13-22"
											class="radio-inline__label" style="height: 70%" id="s">합천군</label></li>
									</ul>
								</div>

								<div></div>

								<div align="center">
									<button type="button" class="btn btn-red" id="finalAreaCheck13"
										data-dismiss="modal">확인</button>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
			<div id="modal-area14" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<!-- AREA Modal content-->
					<div class="modal-content">
						<div class="modal-body">
							<h4>지역선택하기</h4>
							<form action="registerSpace1.jsp" id="licenceFrm" method="post"
								style="padding-top: 3%;">
								<input type="hidden" value="space" name="type">
								<div class="row">
									<ul style="list-style: none;">
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="고창군" style="height: 70%"
											id="area14-1"><label for="area14-1"
											class="radio-inline__label" style="height: 70%" id="s">고창군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="군산시" style="height: 70%"
											id="area14-2"><label for="area14-2"
											class="radio-inline__label" style="height: 70%" id="s">군산시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="김제시" style="height: 70%"
											id="area14-3"><label for="area14-3"
											class="radio-inline__label" style="height: 70%" id="s">김제시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="남원시" style="height: 70%"
											id="area14-4"><label for="area14-4"
											class="radio-inline__label" style="height: 70%" id="s">남원시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="무주군" style="height: 70%"
											id="area14-5"><label for="area14-5"
											class="radio-inline__label" style="height: 70%" id="s">무주군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="부안군" style="height: 70%"
											id="area14-6"><label for="area14-6"
											class="radio-inline__label" style="height: 70%" id="s">부안군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="순창군" style="height: 70%"
											id="area14-7"><label for="area14-7"
											class="radio-inline__label" style="height: 70%" id="s">순창군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="완주군" style="height: 70%"
											id="area14-8"><label for="area14-8"
											class="radio-inline__label" style="height: 70%" id="s">완주군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="익산시" style="height: 70%"
											id="area14-9"><label for="area14-9"
											class="radio-inline__label" style="height: 70%" id="s">익산시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="임실군" style="height: 70%"
											id="area14-10"><label for="area14-10"
											class="radio-inline__label" style="height: 70%" id="s">임실군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="장수군" style="height: 70%"
											id="area14-11"><label for="area14-11"
											class="radio-inline__label" style="height: 70%" id="s">장수군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="전주시 진덕구"
											style="height: 70%" id="area14-12"><label
											for="area14-12" class="radio-inline__label"
											style="height: 70%" id="s"> 전주시 진덕구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="전주시 완산구"
											style="height: 70%" id="area14-13"><label
											for="area14-13" class="radio-inline__label"
											style="height: 70%" id="s"> 전주시 완산구</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="정읍시" style="height: 70%"
											id="area14-14"><label for="area14-14"
											class="radio-inline__label" style="height: 70%" id="s">정읍시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="진안군" style="height: 70%"
											id="area14-15"><label for="area14-15"
											class="radio-inline__label" style="height: 70%" id="s">진안군</label></li>
									</ul>
								</div>

								<div></div>

								<div align="center">
									<button type="button" class="btn btn-red" id="finalAreaCheck14"
										data-dismiss="modal">확인</button>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
			<div id="modal-area15" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<!-- AREA Modal content-->
					<div class="modal-content">
						<div class="modal-body">
							<h4>지역선택하기</h4>
							<form action="registerSpace1.jsp" id="licenceFrm" method="post"
								style="padding-top: 3%;">
								<input type="hidden" value="space" name="type">
								<div class="row">
									<ul style="list-style: none;">
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="강진군" style="height: 70%"
											id="area15-1"><label for="area15-1"
											class="radio-inline__label" style="height: 70%" id="s">강진군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="고흥군" style="height: 70%"
											id="area15-2"><label for="area15-2"
											class="radio-inline__label" style="height: 70%" id="s">고흥군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="곡성군" style="height: 70%"
											id="area15-3"><label for="area15-3"
											class="radio-inline__label" style="height: 70%" id="s">곡성군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="광양시" style="height: 70%"
											id="area15-4"><label for="area15-4"
											class="radio-inline__label" style="height: 70%" id="s">광양시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="구례군" style="height: 70%"
											id="area15-5"><label for="area15-5"
											class="radio-inline__label" style="height: 70%" id="s">구례군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="나주시" style="height: 70%"
											id="area15-6"><label for="area15-6"
											class="radio-inline__label" style="height: 70%" id="s">나주시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="담양군" style="height: 70%"
											id="area15-7"><label for="area15-7"
											class="radio-inline__label" style="height: 70%" id="s">덤양군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="목포시" style="height: 70%"
											id="area15-8"><label for="area15-8"
											class="radio-inline__label" style="height: 70%" id="s">목포시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="무안군" style="height: 70%"
											id="area15-9"><label for="area15-9"
											class="radio-inline__label" style="height: 70%" id="s">무안군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="보성군" style="height: 70%"
											id="area15-10"><label for="area15-10"
											class="radio-inline__label" style="height: 70%" id="s">보성군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="순천시" style="height: 70%"
											id="area15-11"><label for="area15-11"
											class="radio-inline__label" style="height: 70%" id="s">순천시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="신안군" style="height: 70%"
											id="area15-12"><label for="area15-12"
											class="radio-inline__label" style="height: 70%" id="s">신안군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="여수시" style="height: 70%"
											id="area15-13"><label for="area15-13"
											class="radio-inline__label" style="height: 70%" id="s">여수시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="영광군" style="height: 70%"
											id="area15-14"><label for="area15-14"
											class="radio-inline__label" style="height: 70%" id="s">영광군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="영암군" style="height: 70%"
											id="area15-15"><label for="area15-15"
											class="radio-inline__label" style="height: 70%" id="s">영양군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="완도군" style="height: 70%"
											id="area15-16"><label for="area15-16"
											class="radio-inline__label" style="height: 70%" id="s">완도군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="장성군" style="height: 70%"
											id="area15-17"><label for="area15-17"
											class="radio-inline__label" style="height: 70%" id="s">장성군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="장흥군" style="height: 70%"
											id="area15-18"><label for="area15-18"
											class="radio-inline__label" style="height: 70%" id="s">장흥군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="진도군" style="height: 70%"
											id="area15-19"><label for="area15-19"
											class="radio-inline__label" style="height: 70%" id="s">진도군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="함평군" style="height: 70%"
											id="area15-20"><label for="area15-20"
											class="radio-inline__label" style="height: 70%" id="s">함평군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="해남군" style="height: 70%"
											id="area15-21"><label for="area15-21"
											class="radio-inline__label" style="height: 70%" id="s">해남군</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="화순군" style="height: 70%"
											id="area15-22"><label for="area15-22"
											class="radio-inline__label" style="height: 70%" id="s">화순군</label></li>
									</ul>
								</div>

								<div></div>

								<div align="center">
									<button type="button" class="btn btn-red" id="finalAreaCheck15"
										data-dismiss="modal">확인</button>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
			<div id="modal-area16" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<!-- AREA Modal content-->
					<div class="modal-content">
						<div class="modal-body">
							<h4>지역선택하기</h4>
							<form action="registerSpace1.jsp" id="licenceFrm" method="post"
								style="padding-top: 3%;">
								<input type="hidden" value="space" name="type">
								<div class="row">
									<ul style="list-style: none;">
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="서귀포시" style="height: 70%"
											id="area16-1"><label for="area16-1"
											class="radio-inline__label" style="height: 70%" id="s">서귀포시</label></li>
										<li><input type="radio" name="licence2"
											class="radio-inline__input" value="제주시" style="height: 70%"
											id="area16-2"><label for="area16-2"
											class="radio-inline__label" style="height: 10%" id="s">제주시</label></li>

									</ul>
								</div>

								<div></div>

								<div align="center">
									<button type="button" class="btn btn-red" id="finalAreaCheck16"
										data-dismiss="modal">확인</button>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
			<!-- 지역 정보 모달끝 -->
			<!--full width banner-->
			<!-- 인원정보 모달 -->
			<div id="modal-accomodation" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<!-- AREA Modal content-->
					<div class="modal-content">
						<div class="modal-body">
							<h4>예약인원을 선택하세요.</h4>
							<form action="registerSpace1.jsp" id="licenceFrm" method="post"
								style="padding-top: 3%;">
								<input type="hidden" value="space" name="type">
								<div class="row">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="fa fa-arrow-circle-down" id="downAcmo"></i></span> <input
											type="text" id="accomodation" name="accomodation" value="1"
											style="text-align: center; font-size: 2em"
											class="form-control" pattern="[0-9]" max="9999"> <span
											class="input-group-addon"><i
											class="fa fa-arrow-circle-up" id="upAcmo"></i></span>
									</div>
								</div>

								<div></div>
								<br> <br>
								<div align="center">
									<button type="button" class="btn btn-red"
										id="checkAccomodation1">전체인원</button>
									<button type="button" class="btn btn-red" data-dismiss="modal"
										id="checkAccomodation2">확인</button>


								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
			<!-- 인원정보모달 끝  -->
			<!-- 타입정보 모달  -->

			<div id="modal-type" class="modal fade" role="dialog">
				<div class="modal-dialog">
					AREA Modal content
					<div class="modal-content">
						<div class="modal-body">
							<h4>공간 / 휴테크 선택하기</h4>
							<form>
								<div class="row">

									<ul style="list-style: none;">
										<li><input type="radio" name="licence3"
											class="radio-inline__input" value="공간" style="height: 70%"
											id="space"><label for="space"
											class="radio-inline__label" style="height: 70%" id="s">공간</label></li>
										<li><input type="radio" name="licence3"
											class="radio-inline__input" value="휴테크" style="height: 70%"
											id="tech"><label for="tech"
											class="radio-inline__label" style="height: 10%" id="s">휴테크</label></li>
									</ul>
								</div>

								<div></div>

								<div align="center">
									<button type="button" class="btn btn-red" id="checkType"
										data-dismiss="modal">확인</button>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
			<!--  타임 정보모달 끝 -->
		</div>
	</div>
	<!-- 공간 추천 키워드 -->
	<div class="container"
		style="background-color: white; height: 59px; margin-top: 240px; border-bottom: 2px solid #DCDCDC; border-right: 2px solid #DCDCDC; border-radius: 5px;">
		<form action="${initParam.root}searchProductByHashtag.do"
			method="post" name="hashFrm" style="margin-top: 20px;" id="hashFrm">
			<input type="hidden" value="" name="hash" id="hash">
			<h3 class="title-section clearfix" style="float: left;">
				공간 추천 키워드
				<c:forEach items="${hslist}" var="space" begin="1" end="5">
					<a class="link-arrow"
						style="margin-left: 15px; font-size: 15px; background-color: #f2d636"
						" href="javascript:aa('${space.h_name}')">${space.h_name}</a>
				</c:forEach>
			</h3>
		</form>
	</div>



	<script type="text/javascript">
$(function () {
	$("#item1").click(function () {
		$("#property-slider1").css("display","block");
		
	});
	$("#item2").click(function () {
		$("#property-slider1").css("display","none");
		
		
	});
	$("#item3").click(function () {
		$("#property-slider3").css("display","block");
	});
	$("#item4").click(function () {
		$("#property-slider3").css("display","none");
	});
	
})
</script>

	<div class="container">
		<!-- 상품목록 -->
		<ul class="nav nav-tabs">
			<li class="nav-item" style="position: absolute;"><a id="item1"
				data-toggle="tab" href="#panel31">최신순</a></li>
			<li class="nav-item" style="position: absolute; margin-left: 70px;">
				<a id="item2" data-toggle="tab" href="#panel32">평점순</a>
			</li>

		</ul>

		<div class="tab-content" style="margin-left: 90px;">
			<div style="margin-left: 970px;">
				<a href="${initParam.root}searchProduct.do?search="
					class="btn btn-all btn-block"
					style="width: 87px; border: 2px solid; border-color: white; border-radius: 5px;">
					전체보기 > </a>

			</div>
			<br>
			<!--Panel 1-->


			<div class="tab-pane fade in show active" id="panel31"
				role="tabpanel">

				<div id="property-slider1" class="owl-carousel owl-theme">
					<c:forEach items="${plist }" var="space">

						<c:if test="${space.type=='공간'}">
							<div class="item" style="width: 250px;">
								<div class="property clearfix"
									style="background-color: white; border-bottom: 2px solid #DCDCDC;">
									<div class="image">
										<div class="content">
											<a href="${initParam.root}getProduct.do?no=${space.p_no}"><i
												class="fa fa-search-plus"></i></a> <img
												src="p.upload/${space.newfilename}" class="img-responsive"
												alt="propety" style="width: 250px; height: 300px;"> <span
												class="label-property">${space.type }</span> <span
												class="label-price"> <c:if
													test="${space.staravg>'4.5' && space.staravg<='5.0' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'4.0' && space.staravg<='4.5' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/halfstar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'3.5' && space.staravg<='4.0' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'3.0' && space.staravg<='3.5' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/halfstar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'2.5' && space.staravg<='3.0' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'2.0' && space.staravg<='2.5' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/halfstar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'1.5' && space.staravg<='2.0' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'1.0' && space.staravg<='1.5' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/halfstar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'0.5' && space.staravg<='1.0' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'0.0' && space.staravg<='0.5' }">
													<img src="img/halfstar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if test="${space.staravg=='0.0' }">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if>
											</span>
										</div>
										<!--content-->
									</div>
									<!--image-->

									<div class="property-detail">
										<a href="${initParam.root}getProduct.do?no=${space.p_no}">${space.title}(${space.area2 })
											<span class="location">${space.hashtag}</span>
											<div class="pull-left">
												<p>
													<b>${space.price}</b>원/시간
												</p>
											</div>

											<div class="pull-right">
												<span><img src="img/icon/review3.png" alt="">${space.reviewcount}</span>
												<span><img src="img/icon/good.png" alt="">${space.goodcount}</span>
											</div>
										</a>
									</div>
									<!--property details-->

								</div>
								<!--property-->
							</div>
						</c:if>

					</c:forEach>
				</div>
				<!--owl slider-->

			</div>
			<!--/.Panel 1-->

			<!--Panel 2-->
			<div class="tab-pane fade" id="panel32" role="tabpanel">


				<div id="property-slider2" class="owl-carousel owl-theme">
					<c:forEach items="${avgList }" var="space">

						<c:if test="${space.type=='공간' }">
							<div class="item" style="width: 250px;">
								<div class="property clearfix"
									style="background-color: white; border-bottom: 2px solid #DCDCDC;">
									<div class="image">
										<div class="content">

											<a href="${initParam.root}getProduct.do?no=${space.p_no}"><i
												class="fa fa-search-plus"></i></a> <img
												src="p.upload/${space.newfilename}" class="img-responsive"
												alt="propety" style="width: 250px; height: 300px;"> <span
												class="label-property">${space.type }</span> <span
												class="label-price"> <c:if
													test="${space.staravg>'4.5' && space.staravg<='5.0' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'4.0' && space.staravg<='4.5' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/halfstar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'3.5' && space.staravg<='4.0' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'3.0' && space.staravg<='3.5' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/halfstar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'2.5' && space.staravg<='3.0' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'2.0' && space.staravg<='2.5' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/halfstar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'1.5' && space.staravg<='2.0' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'1.0' && space.staravg<='1.5' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/halfstar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'0.5' && space.staravg<='1.0' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'0.0' && space.staravg<='0.5' }">
													<img src="img/halfstar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if test="${space.staravg=='0.0' }">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if>
											</span>
										</div>
										<!--content-->
									</div>
									<!--image-->

									<div class="property-detail">
										<a href="${initParam.root}getProduct.do?no=${space.p_no}">${space.title}(${space.area2 })
											<span class="location">${space.hashtag}</span>

											<div class="pull-left">
												<p>
													<b>${space.price}</b>원/시간
												</p>
											</div>

											<div class="pull-right">
												<span><img src="img/icon/review3.png" alt="">${space.reviewcount}</span>
												<span><img src="img/icon/good.png" alt="">${space.goodcount}</span>
											</div>
										</a>
									</div>
									<!--property details-->

								</div>
								<!--property-->
							</div>
						</c:if>

					</c:forEach>
				</div>
				<!--owl slider-->

			</div>



			<!--/.Panel 2-->
		</div>

	</div>
	<!-- container -->




	<div class="container"
		style="background-color: white; height: 59px; margin-top: 100px; border-bottom: 2px solid #DCDCDC; border-right: 2px solid #DCDCDC; border-radius: 5px;">
		<form action="${initParam.root }searchProductByHashtag.do"
			method="post" name="hashFrm" style="margin-top: 20px;">
			<input type="hidden" value="" name="hash" id="hash">
			<h3 class="title-section clearfix" style="float: left;">
				휴테크 추천 키워드
				<c:forEach items="${htlist}" var="space" begin="1" end="5">
					<a class="link-arrow"
						style="margin-left: 15px; font-size: 15px; background-color: #f2d636"
						" href="javascript:aa('${space.h_name}')">${space.h_name}</a>
				</c:forEach>
			</h3>
		</form>
	</div>

	<div class="container">
		<!-- 상품목록 -->
		<ul class="nav nav-tabs">
			<li class="nav-item" style="position: absolute;"><a id="item3"
				data-toggle="tab" href="#panel33">최신순</a></li>
			<li class="nav-item" style="position: absolute; margin-left: 70px;">
				<a id="item4" data-toggle="tab" href="#panel34">평점순</a>
			</li>

		</ul>

		<div class="tab-content" style="margin-left: 90px;">
			<div style="margin-left: 970px;">
				<a href="${initParam.root}searchProduct.do?search="
					class="btn btn-all btn-block"
					style="width: 87px; border: 2px solid; border-color: white; border-radius: 5px;">
					전체보기 > </a>

			</div>
			<br>
			<!--Panel 1-->

			<div class="tab-pane fade in show active" id="panel33"
				role="tabpanel">


				<div id="property-slider3" class="owl-carousel owl-theme">
					<c:forEach items="${plist }" var="space">

						<c:if test="${space.type=='휴테크'}">
							<div class="item" style="width: 250px;">
								<div class="property clearfix"
									style="background-color: white; border-bottom: 2px solid #DCDCDC;">
									<div class="image">
										<div class="content">

											<a href="${initParam.root}getProduct.do?no=${space.p_no}"><i
												class="fa fa-search-plus"></i></a> <img
												src="p.upload/${space.newfilename}" class="img-responsive"
												alt="propety" style="width: 250px; height: 300px;"> <span
												class="label-property">${space.type }</span> <span
												class="label-price"> <c:if
													test="${space.staravg>'4.5' && space.staravg<='5.0' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'4.0' && space.staravg<='4.5' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/halfstar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'3.5' && space.staravg<='4.0' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'3.0' && space.staravg<='3.5' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/halfstar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'2.5' && space.staravg<='3.0' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'2.0' && space.staravg<='2.5' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/halfstar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'1.5' && space.staravg<='2.0' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'1.0' && space.staravg<='1.5' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/halfstar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'0.5' && space.staravg<='1.0' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'0.0' && space.staravg<='0.5' }">
													<img src="img/halfstar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if test="${space.staravg=='0.0' }">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if>
											</span>
										</div>
										<!--content-->
									</div>
									<!--image-->

									<div class="property-detail">
										<a href="${initParam.root}getProduct.do?no=${space.p_no}">${space.title}(${space.area2 })
											<span class="location">${space.hashtag}</span>
											<div class="pull-left">
												<p>
													<b>${space.price}</b>원/시간
												</p>
											</div>

											<div class="pull-right">
												<span><img src="img/icon/review3.png" alt="">${space.reviewcount}</span>
												<span><img src="img/icon/good.png" alt="">${space.goodcount}</span>
											</div>
										</a>
									</div>
									<!--property details-->

								</div>
								<!--property-->
							</div>
						</c:if>

					</c:forEach>
				</div>
				<!--owl slider-->

			</div>

			<!--/.Panel 1-->
			<!--Panel 2-->
			<div class="tab-pane fade" id="panel34" role="tabpanel">


				<div id="property-slider4" class="owl-carousel owl-theme">
					<c:forEach items="${avgList }" var="space">

						<c:if test="${space.type=='휴테크'}">
							<div class="item" style="width: 250px;">
								<div class="property clearfix"
									style="background-color: white; border-bottom: 2px solid #DCDCDC;">
									<div class="image">
										<div class="content">

											<a href="${initParam.root}getProduct.do?no=${space.p_no}"><i
												class="fa fa-search-plus"></i></a> <img
												src="p.upload/${space.newfilename}" class="img-responsive"
												alt="propety" style="width: 250px; height: 300px;"> <span
												class="label-property">${space.type }</span> <span
												class="label-price"> <c:if
													test="${space.staravg>'4.5' && space.staravg<='5.0' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'4.0' && space.staravg<='4.5' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/halfstar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'3.5' && space.staravg<='4.0' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'3.0' && space.staravg<='3.5' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/halfstar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'2.5' && space.staravg<='3.0' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'2.0' && space.staravg<='2.5' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/halfstar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'1.5' && space.staravg<='2.0' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'1.0' && space.staravg<='1.5' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/halfstar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'0.5' && space.staravg<='1.0' }">
													<img src="img/star.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if
													test="${space.staravg>'0.0' && space.staravg<='0.5' }">
													<img src="img/halfstar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if> <c:if test="${space.staravg=='0.0' }">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
													<img src="img/nostar.png"
														style="width: 15px; height: 25px; float: left;">
												</c:if>
											</span>
										</div>
										<!--content-->
									</div>
									<!--image-->

									<div class="property-detail">
										<a href="${initParam.root}getProduct.do?no=${space.p_no}">${space.title}(${space.area2 })
											<span class="location">${space.hashtag}</span>

											<div class="pull-left">
												<p>
													<b>${space.price}</b>원/시간
												</p>
											</div>

											<div class="pull-right">
												<span><img src="img/icon/review3.png" alt="">${space.reviewcount}</span>
												<span><img src="img/icon/good.png" alt="">${space.goodcount}</span>
											</div>
										</a>
									</div>
									<!--property details-->

								</div>
								<!--property-->
							</div>

						</c:if>



					</c:forEach>
				</div>
				<!--owl slider-->


			</div>

			<!--/.Panel 2-->
		</div>
	</div>
	<div style="height: 100px"></div>
	<div>
		<div>
			<div
				style="position: absolute; opacity: 0.4; filter: alpha(opacity = 80);">
				<div style="position: relative;">
					<img src="${initParam.root}img/footerAuction.jpg"
						style="height: 500px; width: 100%;"></img>
				</div>
			</div>
			<div style="position: absolute; width: 100%; margin-top: 70px;">
				<div style="position: relative;">
					<div id="ftb" class="call-to-action"
						style="background-color: #004b8b; margin-top: 100px;">
						<div class="row">
							<div class="col-sm-9 text-center">
								<h3 id="auctionText">SpaceAuction을 통해 즐거운 경매이벤트에 참여하세요!!</h3>
							</div>
							<div class="col-sm-3 text-center">
								<a href="${initParam.root}getOnSaleAuction.do?flag=index">경매
									참여하러가기 ></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="footerImg" style="background-color: black; height: 500px;"></div>
	</div>


	<div style="height: 50px;"></div>
	<footer class="footer"
		style="background-color: #DCDCDC; height: 300px; font-family: 'Jeju Gothic'; position: relative;">
		<div class="container">
			<div class="top_area" style="margin-top: 50px;">
				<div class="col-sm-6">
					<a href="#"> <img alt="" src="${initParam.root}img/logo.png">
					</a>
				</div>
				<div class="col-sm-6" style="margin-top: 30px; text-align: right;">
					<a href="#">블로그</a> &nbsp;|&nbsp; <a href="#">이용약관</a>
					&nbsp;|&nbsp; <a href="#">개인정보처리방침</a> &nbsp;|&nbsp; <a href="#">운영정책</a>
					&nbsp;|&nbsp; <a href="#">고객 문의</a>
				</div>
				<hr>
			</div>
			<!-- top_area -->
			<br>
			<hr>

			<div class="bottom_area">
				<div class="col-sm-8">
					<div id="text">
						상호명 : 주식회사 공간기동대 &nbsp;|&nbsp; 대표 : 강민성 &nbsp;|&nbsp; 멤버 : 김정식 임희준
						이기섭 오세진 이영욱 &nbsp;|&nbsp; <a
							href="http://www.ftc.go.kr/info/bizinfo/communicationView.jsp?apv_perm_no=2015303010330200027&area1=&area2=&currpage=1&searchKey=04&searchVal=2308103117&stdate=&enddate="
							target="_blank" title="새창열림" class="nclk" _nclk="fot.info">사업자등록정보
							> </a><br> 교육기관 : 판교테크노벨리 U Space2 B동 802호 'KOSTA' &nbsp;|&nbsp;
						이메일: <a href="#">office@space.kr</a> &nbsp;|&nbsp; 대표전화: 1566-8282
						&nbsp;|&nbsp; <br> 대표전화: 1599-4312(평일 오후 2시 ~ 오후 6시 30분)
						&nbsp;|&nbsp; 온라인 1:1문의 바로가기(평일 오전 10시 ~ 오후 6시 30분) <br> <br>
						<br> <br> 공간기동대는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서
						스페이스클라우드는 공간 거래정보 및 거래에 대해 책임지지 않습니다.


					</div>
				</div>
				<div class="col-sm-4" style="text-align: right;">
					<img alt="" src="${initParam.root}img/icon/facebook.png"
						style="width: 60px;"> <img alt=""
						src="${initParam.root}img/icon/twitter.png" style="width: 60px;">
					<img alt="" src="${initParam.root}img/icon/youtube.png"
						style="width: 60px;"> <img alt=""
						src="${initParam.root}img/icon/googleplus.png"
						style="width: 60px;">
				</div>
			</div>
			<!-- botton_area -->

		</div>
		<!-- container -->
	</footer>
	<!--footer-->
	<div class="copyright">
		<div class="container text-center">
			<span>&copy; Copyright 2017. All right reserved. Good deal
				space.</span>
		</div>
	</div>
	<!--scripts and plugins -->
	<!--must need plugin jquery-->
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate.min.js"></script>
	<!--bootstrap js plugin-->
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<!--easing plugin for smooth scroll-->
	<script src="js/jquery.easing.1.3.min.js" type="text/javascript"></script>
	<!--sticky header-->
	<script type="text/javascript" src="js/jquery.sticky.js"></script>
	<!--flex slider plugin-->
	<script src="js/jquery.flexslider-min.js" type="text/javascript"></script>
	<!--parallax background plugin-->
	<script src="js/jquery.stellar.min.js" type="text/javascript"></script>
	<!--owl carousel slider-->
	<script src="owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
	<script src="js/classie.js" type="text/javascript"></script>
	<script src="js/selectFx.js" type="text/javascript"></script>
	<!--revolution slider plugins-->
	<script src="rs-plugin/js/jquery.themepunch.tools.min.js"
		type="text/javascript"></script>
	<script src="rs-plugin/js/jquery.themepunch.revolution.min.js"
		type="text/javascript"></script>
	<script src="js/tweetie.min.js" type="text/javascript"></script>
	<!--on scroll animation-->
	<script src="js/wow.min.js" type="text/javascript"></script>
	<!--customizable plugin edit according to your needs-->
	<script src="js/real-estate-custom.js" type="text/javascript"></script>
	<script src="js/mask.js" type="text/javascript"></script>
	<script type="text/javascript">
$(function() { /* //$(":input:radio[name=search_type]:checked").val(); */
    $(':input:radio[name=licence1]').prop("checked", false);
    $('#checkArea').click(function() {
       var f = $(':input:radio[name=licence1]:checked').val();
       //f2=$(':input:radio[name=licence2]:checked').val();
       if (f == '서울') {
          $('#modal-area1-1').modal();
       } else if (f == '경기') {
          $('#modal-area2').modal();
       } else if (f == '인천') {
          $('#modal-area3').modal();
       } else if (f == '부산') {
          $('#modal-area4').modal();
       } else if (f == '대전') {
          $('#modal-area5').modal();
       } else if (f == '대구') {
          $('#modal-area6').modal();
       } else if (f == '울산') {
          $('#modal-area7').modal();
       } else if (f == '광주') {
          $('#modal-area8').modal();
       } else if (f == '강원') {
          $('#modal-area9').modal();
       } else if (f == '충북') {
          $('#modal-area10').modal();
       } else if (f == '충남') {
          $('#modal-area11').modal();
       } else if (f == '경북') {
          $('#modal-area12').modal();
       } else if (f == '경남') {
          $('#modal-area13').modal();
       } else if (f == '전북') {
          $('#modal-area14').modal();
       } else if (f == '전남') {
          $('#modal-area15').modal();
       } else if (f == '제주특별자치도') {
          $('#modal-area16').modal();
       } else if (f == '전체지역') {
          $('#Select-Area').html("전체지역");
          $(':input:radio[name=licence1]').prop("checked", false);
       }

    }); //click1
    $('#finalAreaCheck').click(function() {
       var f = $(':input:radio[name=licence1]:checked').val();
       var f2 = $(':input:radio[name=licence2]:checked').val();
       $('#Select-Area').html("<font size='3px'>" + f + " " + f2 + "</font>");
       var k = f+" "+f2;
       $('#rar').attr('value',k);
       
       $(':input:radio[name=licence1]').prop("checked", false);
       $(':input:radio[name=licence2]').prop("checked", false);
    }); //click
    $('#finalAreaCheck2').click(function() {
       var f = $(':input:radio[name=licence1]:checked').val();
       var f2 = $(':input:radio[name=licence2]:checked').val();
       $('#Select-Area').html("<font  size='3px'>" + f + " " + f2 + "</font>");
       var k = f+" "+f2;
       $('#rar').attr('value',k);
       
       $(':input:radio[name=licence1]').prop("checked", false);
       $(':input:radio[name=licence2]').prop("checked", false);
    }); //click
    $('#finalAreaCheck3').click(function() {
       var f = $(':input:radio[name=licence1]:checked').val();
       var f2 = $(':input:radio[name=licence2]:checked').val();
       $('#Select-Area').html("<font  size='3px'>" + f + " " + f2 + "</font>");
       var k = f+" "+f2;
       $('#rar').attr('value',k);
       
       $(':input:radio[name=licence1]').prop("checked", false);
       $(':input:radio[name=licence2]').prop("checked", false);
    }); //click
    $('#finalAreaCheck4').click(function() {
       var f = $(':input:radio[name=licence1]:checked').val();
       var f2 = $(':input:radio[name=licence2]:checked').val();
       $('#Select-Area').html("<font  size='3px'>" + f + " " + f2 + "</font>");
       var k = f+" "+f2;
       $('#rar').attr('value',k);
       
       $(':input:radio[name=licence1]').prop("checked", false);
       $(':input:radio[name=licence2]').prop("checked", false);
    }); //click   
    $('#finalAreaCheck5').click(function() {
       var f = $(':input:radio[name=licence1]:checked').val();
       var f2 = $(':input:radio[name=licence2]:checked').val();
       $('#Select-Area').html("<font size='3px'>" + f + " " + f2 + "</font>");
       var k = f+" "+f2;
       $('#rar').attr('value',k);
       
       $(':input:radio[name=licence1]').prop("checked", false);
       $(':input:radio[name=licence2]').prop("checked", false);
    }); //click   
    $('#finalAreaCheck6').click(function() {
       var f = $(':input:radio[name=licence1]:checked').val();
       var f2 = $(':input:radio[name=licence2]:checked').val();
       $('#Select-Area').html("<font size='3px'>" + f + " " + f2 + "</font>");
       var k = f+" "+f2;
       $('#rar').attr('value',k);
       
       $(':input:radio[name=licence1]').prop("checked", false);
       $(':input:radio[name=licence2]').prop("checked", false);
    }); //click   
    $('#finalAreaCheck7').click(function() {
       var f = $(':input:radio[name=licence1]:checked').val();
       var f2 = $(':input:radio[name=licence2]:checked').val();
       $('#Select-Area').html("<font size='3px'>" + f + " " + f2 + "</font>");
       var k = f+" "+f2;
       $('#rar').attr('value',k);
       
       $(':input:radio[name=licence1]').prop("checked", false);
       $(':input:radio[name=licence2]').prop("checked", false);
    }); //click   
    $('#finalAreaCheck8').click(function() {
       var f = $(':input:radio[name=licence1]:checked').val();
       var f2 = $(':input:radio[name=licence2]:checked').val();
       $('#Select-Area').html("<font size='3px'>" + f + " " + f2 + "</font>");
       var k = f+" "+f2;
       $('#rar').attr('value',k);
       
       $(':input:radio[name=licence1]').prop("checked", false);
       $(':input:radio[name=licence2]').prop("checked", false);
    }); //click   
    $('#finalAreaCheck9').click(function() {
       var f = $(':input:radio[name=licence1]:checked').val();
       var f2 = $(':input:radio[name=licence2]:checked').val();
       $('#Select-Area').html("<font size='3px'>" + f + " " + f2 + "</font>");
       var k = f+" "+f2;
       $('#rar').attr('value',k);
       
       $(':input:radio[name=licence1]').prop("checked", false);
       $(':input:radio[name=licence2]').prop("checked", false);
    }); //click
    $('#finalAreaCheck10').click(function() {
       var f = $(':input:radio[name=licence1]:checked').val();
       var f2 = $(':input:radio[name=licence2]:checked').val();
       $('#Select-Area').html("<font size='3px'>" + f + " " + f2 + "</font>");
       var k = f+" "+f2;
       $('#rar').attr('value',k);
       
       $(':input:radio[name=licence1]').prop("checked", false);
       $(':input:radio[name=licence2]').prop("checked", false);
    }); //click
    $('#finalAreaCheck11').click(function() {
       var f = $(':input:radio[name=licence1]:checked').val();
       var f2 = $(':input:radio[name=licence2]:checked').val();
       $('#Select-Area').html("<font size='3px'>" + f + " " + f2 + "</font>");
       var k = f+" "+f2;
       $('#rar').attr('value',k);
       
       $(':input:radio[name=licence1]').prop("checked", false);
       $(':input:radio[name=licence2]').prop("checked", false);
    }); //click
    $('#finalAreaCheck12').click(function() {
       var f = $(':input:radio[name=licence1]:checked').val();
       var f2 = $(':input:radio[name=licence2]:checked').val();
       $('#Select-Area').html("<font size='3px'>" + f + " " + f2 + "</font>");
       var k = f+" "+f2;
       $('#rar').attr('value',k);
       
       $(':input:radio[name=licence1]').prop("checked", false);
       $(':input:radio[name=licence2]').prop("checked", false);
    }); //click
    $('#finalAreaCheck13').click(function() {
       var f = $(':input:radio[name=licence1]:checked').val();
       var f2 = $(':input:radio[name=licence2]:checked').val();
       $('#Select-Area').html("<font size='3px'>" + f + " " + f2 + "</font>");
       var k = f+" "+f2;
       $('#rar').attr('value',k);
       
       $(':input:radio[name=licence1]').prop("checked", false);
       $(':input:radio[name=licence2]').prop("checked", false);
    }); //click
    $('#finalAreaCheck14').click(function() {
       var f = $(':input:radio[name=licence1]:checked').val();
       var f2 = $(':input:radio[name=licence2]:checked').val();
       $('#Select-Area').html("<font size='3px'>" + f + " " + f2 + "</font>");
       var k = f+" "+f2;
       $('#rar').attr('value',k);
       
       $(':input:radio[name=licence1]').prop("checked", false);
       $(':input:radio[name=licence2]').prop("checked", false);
    }); //click
    $('#finalAreaCheck15').click(function() {
       var f = $(':input:radio[name=licence1]:checked').val();
       var f2 = $(':input:radio[name=licence2]:checked').val();
       $('#Select-Area').html("<font size='3px'>" + f + " " + f2 + "</font>");
       var k = f+" "+f2;
       $('#rar').attr('value',k);
       
       $(':input:radio[name=licence1]').prop("checked", false);
       $(':input:radio[name=licence2]').prop("checked", false);
    }); //click
    $('#finalAreaCheck16').click(function() {
       var f = $(':input:radio[name=licence1]:checked').val();
       var f2 = $(':input:radio[name=licence2]:checked').val();
       $('#Select-Area').html("<font size='3px'>" + f + " " + f2 + "</font>");
       var k = f+" "+f2;
       $('#rar').attr('value',k);
       
       $(':input:radio[name=licence1]').prop("checked", false);
       $(':input:radio[name=licence2]').prop("checked", false);
    }); //click
    /* 예약인원 설정 부분 */
    $('#downAcmo').click(function(){
       $('#accomodation').removeAttr("readonly");
       var c = $('#accomodation').val();
       if($('#accomodation').val()=='전체인원'){
          $('#accomodation').val(1);
       }
       else if(c==1){
          return false;
       }else{
          $('#accomodation').val(c-1);
       }
    });
    $('#upAcmo').click(function(){
       $('#accomodation').removeAttr("readonly");
       if($('#accomodation').val()=='전체인원'){
          $('#accomodation').val(1);
       }
       var c = $('#accomodation').val();
       $.ajax({
          type:"post",
          url:"${initParam.root}plus.do",
          data:"cnt="+c,
          success:function(data){
             $('#accomodation').val(data.d);
          }
       });
    });
    $('#checkAccomodation1').click(function(){
       $('#accomodation').attr("readonly","readonly");
       $('#accomodation').val("전체인원");
    });
    $('#checkAccomodation2').click(function(){
       if($('#accomodation').val()=='전체인원'){
          $('#Select-Accomodation').html($('#accomodation').val());
          $('#rac').attr("value",$('#accomodation').val());
          
       }else{
          $('#Select-Accomodation').html($('#accomodation').val()+"명");   
          $('#rac').attr("value",$('#accomodation').val());
          
       }
       
       
    });
 
    $('#checkType').click(function(){
       var t = $(':input:radio[name=licence3]:checked').val();
       $('#Select-Type').html(t);
       if($(':input:radio[name=licence3]:checked').val()=='공간'){
          $('#rty').attr('value','space');   
       }else if($(':input:radio[name=licence3]:checked').val()=='휴테크'){
          $('#rty').attr('value','tech');
       }
       $(':input:radio[name=licence3]').prop("checked", false);
    });
    
    $('#searchButton').click(function(){
        var searchFrm = document.searchByConditionFrm;
       searchFrm.submit();
    });
    
    
 });
 

 $("#tabs").tabs();
 function aa(str) {
	 alert(str);
    var frm = document.hashFrm;
    $('#hash').attr('value',str);
    alert($('#hash').val());
    $('#hashFrm').submit();
    
 }

</script>
</html>