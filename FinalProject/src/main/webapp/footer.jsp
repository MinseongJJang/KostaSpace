<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon"
   href="https://ssl.pstatic.net/spacecloud/static/web/20170605/favicon.ico"
   type="image/x-icon">
<link rel="shortcut icon"
   href="https://ssl.pstatic.net/spacecloud/static/web/20170605/spacecloud_icon.png"
   type="image/x-icon">
<link rel="apple-touch-icon"
   href="https://ssl.pstatic.net/spacecloud/static/web/20170605/spacecloud_icon.png">
<script
   src="https://ssl.pstatic.net/spacecloud/static/web/js/deploy/20170717022602/min/jquery.min.js"
   type="text/javascript"></script>

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
<link rel="stylesheet" type="text/css"
   href="${initParam.root }css/header.css" />

<title>assan - Real Estate</title>
<style type="text/css">
 @import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
 @import url(//fonts.googleapis.com/earlyaccess/nanummyeongjo.css);
 @import url(//fonts.googleapis.com/earlyaccess/kopubbatang.css);
 @import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

</style>
</head>
<body class="pc">
   <!-- ================== footer ================== -->

            <div id="ftb" class="call-to-action" style="background-color: #004b8b;  margin-top: 100px;">
                 <div class="row">
                     <div class="col-sm-9 text-center">
                         <h3 id="auctionText">SpaceAuction을 통해 즐거운 경매이벤트에 참여하세요!! </h3> 
                     </div>
                     <div class="col-sm-3 text-center">
                         <a href="${initParam.root}getOnSaleAuction.do?flag=index">경매 참여하러가기 ></a>
                     </div>
                 </div>
            </div>            


<div style="height: 50px;"></div>
   <footer class="footer" style="background-color: #DCDCDC; height: 300px; font-family: 'Jeju Gothic'; position: relative;" >
      <div class="container">
         <div class="top_area" style="margin-top: 50px;">
            <div class="col-sm-6">
               <a href="#"> <img alt="" src="${initParam.root}img/logo.png">
               </a>
            </div>
            <div class="col-sm-6" style="margin-top: 30px; text-align: right;">
               <a href="#">블로그</a> &nbsp;|&nbsp; 
               <a href="#">이용약관</a> &nbsp;|&nbsp; 
               <a href="#">개인정보처리방침</a> &nbsp;|&nbsp; 
               <a href="#">운영정책</a> &nbsp;|&nbsp;
               <a href="#">고객 문의</a>
            </div>
            <hr>
         </div>
         <!-- top_area -->
         <br>
         <hr>
         
         <div class="bottom_area">
            <div class="col-sm-8">
               <div id="text">
                  상호명 : 주식회사 공간기동대 &nbsp;|&nbsp; 
                  대표 : 강민성 &nbsp;|&nbsp; 
                  멤버 : 김정식 임희준 이기섭 오세진 이영욱 &nbsp;|&nbsp; 
                  <a href="http://www.ftc.go.kr/info/bizinfo/communicationView.jsp?apv_perm_no=2015303010330200027&area1=&area2=&currpage=1&searchKey=04&searchVal=2308103117&stdate=&enddate="
                  target="_blank" title="새창열림" class="nclk" _nclk="fot.info">사업자등록정보 > </a><br>
                  교육기관 : 판교테크노벨리 U Space2 B동 802호 'KOSTA' &nbsp;|&nbsp;
                  이메일: <a href="#">office@space.kr</a> &nbsp;|&nbsp;
                  대표전화: 1566-8282 &nbsp;|&nbsp; <br>
                  대표전화: 1599-4312(평일 오후 2시 ~ 오후 6시 30분) &nbsp;|&nbsp;
                  온라인 1:1문의 바로가기(평일 오전 10시 ~ 오후 6시 30분)
                  <br>
                  <br>
                  <br>
                  <br>
                  공간기동대는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 스페이스클라우드는 공간 거래정보 및 거래에 대해 책임지지 않습니다.
                  
                  
               </div>
            </div>
            <div class="col-sm-4" style="text-align: right;">
               <img alt="" src="${initParam.root}img/icon/facebook.png" style="width: 60px;">
               <img alt="" src="${initParam.root}img/icon/twitter.png" style="width: 60px;">
               <img alt="" src="${initParam.root}img/icon/youtube.png" style="width: 60px;">
               <img alt="" src="${initParam.root}img/icon/googleplus.png" style="width: 60px;">
            </div>            
         </div>
         <!-- botton_area -->
            
      </div>
      <!-- container -->
      
   </footer>   
        <div class="copyright" style="background-color: gray;">
            <div class="container text-center">
                <span style="color: white;">&copy; Copyright 2017. All right reserved. Good deal space.</span>
            </div>
        </div>   


</body>
        <!--scripts and plugins -->
        <!--must need plugin jquery-->
        <script src="${initParam.root }js/jquery.min.js"></script>
        <script src="${initParam.root }js/jquery-migrate.min.js"></script> 
        <!--bootstrap js plugin-->
        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>       
        <!--easing plugin for smooth scroll-->
        <script src="${initParam.root }js/jquery.easing.1.3.min.js" type="text/javascript"></script>
        <!--sticky header-->
        <script type="text/javascript" src="js/jquery.sticky.js"></script>
        <!--flex slider plugin-->
        <script src="${initParam.root }js/jquery.flexslider-min.js" type="text/javascript"></script>
        <!--parallax background plugin-->
        <script src="${initParam.root }js/jquery.stellar.min.js" type="text/javascript"></script>
        <!--owl carousel slider-->
        <script src="${initParam.root }owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
        <script src="${initParam.root }js/classie.js" type="text/javascript"></script>
        <script src="${initParam.root }js/selectFx.js" type="text/javascript"></script>
        <!--revolution slider plugins-->
        <script src="${initParam.root }rs-plugin/js/jquery.themepunch.tools.min.js" type="text/javascript"></script>
        <script src="${initParam.root }rs-plugin/js/jquery.themepunch.revolution.min.js" type="text/javascript"></script>
        <script src="${initParam.root }js/tweetie.min.js" type="text/javascript"></script>
        <!--on scroll animation-->
        <script src="${initParam.root }js/wow.min.js" type="text/javascript"></script>
        <!--customizable plugin edit according to your needs-->
        <script src="${initParam.root }js/real-estate-custom.js" type="text/javascript"></script>
        <script src="${initParam.root }js/mask.js" type="text/javascript"></script>
        <script src="${initParam.root }js/indexSearch.js" type="text/javascript"></script>
</html>