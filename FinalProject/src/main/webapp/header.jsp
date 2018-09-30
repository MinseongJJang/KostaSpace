<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>header</title>

        <!-- Bootstrap -->
        <link href="${initParam.root}bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- custom css  -->
        <link href="${initParam.root }css/real-estate.css" rel="stylesheet" type="text/css" media="screen">
        <!-- font awesome for icons -->
        <link href="${initParam.root }font-awesome/css/font-awesome.min.css" rel="stylesheet">       
        <link href='https://fonts.googleapis.com/css?family=Roboto:400,900,700,500,400italic,300italic,300,100italic,100' rel='stylesheet' type='text/css'>
        <!--owl carousel css-->
        <link href="${initParam.root }owl-carousel/assets/owl.carousel.css" rel="stylesheet" type="text/css" media="screen">
        <link href="${initParam.root }owl-carousel/assets/owl.theme.default.css" rel="stylesheet" type="text/css" media="screen">
        <!--mega menu -->
        <link href="${initParam.root }css/yamm.css" rel="stylesheet" type="text/css">
        <link href="${initParam.root }css/select.css" rel="stylesheet" type="text/css">
        <!--Revolution slider css-->
        <link href="${initParam.root }rs-plugin/css/settings.css" rel="stylesheet" type="text/css" media="screen">
        <link href="${initParam.root }css/rev-style.css" rel="stylesheet" type="text/css" media="screen">
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<!-- 사용자정의 css -->
		<link href="${initParam.root }css/mask.css" rel="stylesheet" type="text/css" media="screen">
		<link href="${initParam.root }css/topBar.css" rel="stylesheet" type="text/css" media="screen">
		<link href="${initParam.root }css/checkLabel.css" rel="stylesheet" type="text/css" media="screen">
		<link rel="stylesheet" type="text/css" href="${initParam.root }css/header.css">
			<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
      	<link href="${initParam.root }css/header.css" rel="stylesheet" type="text/css">		
		
<style type="text/css">
.navbar{
	background-color: #004b8b;
}
#logo {
	font-family: "Open Sans", sans-serif;
	font-size: 40px;
	color: white;
}
.btn-outlined {
    border-radius: 0;
    -webkit-transition: all 0.3s;
       -moz-transition: all 0.3s;
            transition: all 0.3s;
}	
.btn-outlined.btn-info {
    background: none;
    border: 3px solid #004b8b;
    color: #004b8b;
}
.btn-outlined.btn-info:hover,
.btn-outlined.btn-info:active {
    color: #004b8b;
    background: #004b8b;
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

a.animated-button.thar-two {
    color: #fff;
    cursor: pointer;
    display: block;
    position: relative;
    border: 2px solid white;
    margin-right: 15px;
    width : auto;
    height: auto;
}
.search-form {
  display: inline-block;
  float: right;
  width: 90px;/* 상단 검색바 넓이 조절 */
}

.btn-register{
  color: #fff;
}
.btn-register:hover, .btn-register:focus {
  color: black;
  background-color: white;
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
  <div class="modal fade" id="myModal" role="dialog" style="position: relative;">
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
  </div><!-- 모달 end -->
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
							
					<!-- 사이드바  -->
					<div id="mySidenav" class="sidenav"	style="background-color: white">
						<div class="btn btn-default" id="menu-toggle" style="margin-left: 80%; background-color: white; height: 40px;">
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
											<div id="circle" style="margin-top: 40px; margin-left: 15px; position: absolute;">
												<img src="${initParam.root}img/sidelogo.png" style="width: 100px; margin-top: 6px;">
											</div>
												
											</div>
											<div class="col-sm-10">
												<h3	align="center" style="padding-top: 50px;">${spaceuservo.name }</h3>
											</div>
										</div>
										
									</li>
								</c:otherwise>
							</c:choose>
							<div style="height: 120px; margin-top: 10px;">
								<a href="${initParam.root}getPoint.do" style="border: none;">
									<font>보유 포인트</font><br>
									<span>${spaceuservo.point}</span>
									<img alt="" src="img/icon/point.png" style="width: 40px; margin-bottom: 10px;"><br>
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
						<div style="margin-top: 130px;">
							<a href="${initParam.root }home.jsp" class="btn btn-outlined btn-info">
							<img src="${initParam.root}img/icon/index_arrow.png" 
							style="margin-bottom: 7px; margin-right: 20px;">공간기동대 홈 이동</a>
							
						</div>
					</div>
					
				</div>
				</div>
		</nav>

</body>
</html>
