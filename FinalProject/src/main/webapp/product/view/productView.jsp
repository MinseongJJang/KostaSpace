<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title></title>

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
      <link href="${initParam.root  }css/star.css" rel="stylesheet" type="text/css" media="screen">
      <link rel="stylesheet" type="text/css" href="${initParam.root }css/header.css"/>
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
      
<style type="text/css">
.navbar{
   background-color: #32c5d2;
}
#logo {
   font-family: "Open Sans", sans-serif;
   font-size: 40px;
   color: white;
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
</style>
  <script type="text/javascript">
  $(document).ready(function(){ $("#property-slider").owlCarousel(); });
  $(document).ready(function(){ $("#property-slider2").owlCarousel(); });
  $(document).ready(function(){ $("#tabs").tabs(); });
  </script>    
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.js"></script>  
<script type="text/javascript"> 
function price(){

      var price = ${productvo.price }; 
      var point = ${spaceuservo.point};
       if(point>=price){
       location.href="product/view/reserveProduct.jsp?no=${productvo.p_no}&&price=${productvo.price}&&title=${productvo.title}&&area=${productvo.area}&&img=${productvo.newfilename}&&category=${productvo.category}&&stime=${productvo.sTime}&&etime=${productvo.eTime}&&area=${productvo.area}&&tel=${productvo.tel}"; 
      }else{
       if(confirm("포인트가 부족해요! 충전 페이지로 이동하시겠어요?")){
       location.href="${initParam.root}getPoint.do";
       }else{
          return false;
       }
      }
}


</script>
<script type="text/javascript">

function a(str){
   
	
    var frm = document.hashFrm;
    frm.hash.value = str;

    frm.submit();
 }
function moveImg(img){
      $(function(){
        $('#mainImg').remove();
        $('#main').html("<img src=${initParam.root}/p.upload/"+img+" style='width:100%; height:300px;'>" );
      });  
}
function registerReview(){
      var frm = document.reviewFrm;
      
      if(frm.review.value.length==7){
         alert("review 내용을 써주세요");
         return false;
      }
      frm.submit();
}
function complain(){
      
      var frm = document.complainFrm;
      frm.submit();
}
var id = "${gId[0]}";
var uid ="${gId[1]}";

   $(function(){
      
      var p_no = ${productvo.p_no};   
      
      
      
      $('#good').click(function(){
         
         if(uid!="" && id!=""){ 
            alert("좋아요는 중복되지 않습니다!");
            return false;
         }else{
         $.ajax({
            type: "post",
            url : "plusGoodCount.do",
            data : "p_no="+p_no,
            success:function(data){
               
               uid=data.list[1];
               id=data.list[2];
             
               $('#goodgood').html("<h5 class='pull-right' id='goodCount'>"+data.list[0]+"명의 회원이 좋아합니다.</h5>")
            }//success         
         })//ajax
         }//else
      })//click
      
       $(window).scroll(function() {
           var scrollTop = jQuery(document).scrollTop();
          
             //console.log("scrollTop : " + scrollTop);
             
            var footer = $('footer').offset().top;
            
            var height = footer-2300;
            if (scrollTop < 300) {
                 scrollTop = 0;
             }else if(scrollTop > footer-2300){
            
                 scrollTop = height;   
             }
             jQuery("#AuctionTime").stop();
             jQuery("#AuctionTime").animate( { "top" : scrollTop },1500);
      });//scroll 
   })//function
</script>
<script type="text/javascript">
       $(function(){
           
          if(${spaceuservo.id==null}){
            location.href="${initParam.root}NewFile1.jsp";
            //$('#loginModal').modal();   
               }
        
          });
</script>
<style type="text/css">
   #productInfo{
      width: 650px;
   }
   body{
      position:relative;
   }
   #AuctionTime{
      position: absolute;
      margin-left: 70%;
      padding-right: 10px;
      width: 250px;
      top:0px;
  }
   
</style>
</head>
<body>
<jsp:include page="/header.jsp" >
   <jsp:param value="${productvo.title}" name="pageName"/>
</jsp:include>

   <div class="modal fade" id="myModal" role="dialog">
      <div class="modal-dialog">

         <!-- Modal content-->
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">회원탈퇴</h4>
            </div>
            <div class="modal-body">
               <p>게시글의 모든정보가 삭제됩니다.</p>
               <p>계속진행하시려면 패스워드를 입력해주세요</p>
               password :: <input type="password" id="password" name="password">
               <button type="button" class="confirm" id="confirm"
                  onclick="removeUser()">삭제</button>
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
                           location.href ="${initParam.root}deleteProduct.do?no=${productvo.p_no}";
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
   </div>

   <script type="text/javascript">
        $(function(){
           
           if(${spaceuservo.id==null}){
              location.href="${initParam.root}NewFile1.jsp";
              //$('#loginModal').modal();   
                }
        
           });
   </script>






<div style="position: relative;">
<c:if test="${spaceuservo!=null}">




<div style="position: relative;"><img src="p.upload/${productvo.newfilename}" style="width: 100%; height:400px"></div>
<br><br>
<div class="container" style="
           background-color: white; height: 59px; margin-left:14.3%; border-bottom: 2px solid #DCDCDC;
           border-right: 2px solid #DCDCDC; border-radius: 5px; width: 800px">
<h3 class="title-section clearfix" style="float: left; padding-top: 18px;">
      <c:forEach items="${hlist}" var="hash">
   <a class="link-arrow"  href="javascript:a('${hash.h_name}')" style="margin-left: 15px; font-size: 15px; background-color: #f2d636;">${hash.h_name}</a>
      </c:forEach>
</h3>

</div> 
<div>

</div>
<div style="position: relative;">
<div class="row" style="position: relative;">

      <div class="col-sm-1">
      
      </div>
         <a href="javascript:complain()"><img src="${initParam.root}/product/img/siren.png" width="30px" height="20px"></a>
         <div class="col-sm-8" style="margin-left: 15%; margin-top: 3%; position: relative;">
                    <div class="row property-listing">
                        <div class="col-sm-4 margin30">
                            <div class="image">
                                <div class="content">
                                    
                                    <label id="main"><img src="p.upload/${productvo.newfilename}" class="img-responsive" alt="propety" id="mainImg" style="width: 100%;height: 300px">
                           </label>
                           <br>
                           <div>

                                </div><!--content-->
                            </div><!--image-->
                        </div><!--image col-->
                  <br><br>
                  <div class="row" >
                  <div class="col-md-11">
                <c:forEach items="${content}" var="content">
                        <b>${content}</b><br>
                        
                        </c:forEach>
                        </div>
                       
                        <div class="col-xs-1" >
                         <div  id="map" style="width:530px;height:440px;padding-left: 10%"></div>
                       </div>
                       
                         </div>
</div>
                        <div class="col-sm-8">
                       
                            <h3>${productvo.title }
                            ${list.goodVO.id}&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;  
                            
                            </h3>  
                            <br>
                            <em>위치 : ${productvo.area} &nbsp;${productvo.location }</em><br><br>
                            <em>가격 : ${productvo.price}&nbsp;(시간당 가격)</em><br><br>
                            
                            <em>편의 시설 :&nbsp; 
                            <c:forEach items="${amenities}" var="amenities">
                            <c:choose>
                            <c:when test="${amenities=='없음'}">
                               ${amenities}
                            </c:when>
                            <c:otherwise>
                            <img src="product/img/${amenities}">&nbsp;
                            </c:otherwise>
                            </c:choose>
                            </c:forEach>
                            </em><br><br>
                             
                             <div id="property-slider2" class="owl-carousel owl-theme" style="width: 350px; ">
                            <a href="javascript:moveImg('${productvo.newfilename}')"><img src="p.upload/${productvo.newfilename}" width="120px" height="95px"></a>
                           
                            <c:forEach items="${files}" var="file">
                               <a href="javascript:moveImg('${file}')"><img src="${initParam.root}/p.upload/${file}" width="120px" height="95px"></a>
                            </c:forEach>
                            </div>
                        </div><p>
                  <br><br><br>
                    
                    </div><!--property listing row-->
                    
                    </div>
                   
                    <div class="col-md-4" align="right" id="AuctionTime" style="border: solid 1px blue ;">
                     <h3 class="section-heading" align="left"><b>${productvo.title }</b>
                  </h3>
                  
                     
                     <div class="t_gold" id="hdivMessage" align="left" style="font-size: 20px;"></div>
                      <script>Countdown();</script>
                      <hr>
                     <h4 class="section-heading"><b>${productvo.type} 정보</b>
                     </h4><br>
                        <div class="row">
                           <div class="col-sm-12" align="left">
                              ■ 이용가능 시간 : ${productvo.sTime} ~ ${productvo.eTime}<br>
                              ■ 예약 시간 : 최소1시간부터<br>
                              (연중 무휴)
                           </div>
                           
                        </div><p>
                        <div class="row">
                           <div class="col-sm-12" align="left">
                              ■ 전화번호 : ${productvo.tel }
                           </div>
                           
                        </div><p>
                        <div class="row">
                           <div class="col-sm-12" align="left">
                              ■ 공간 유형 : ${productvo.type }
                              
                           </div>
                           
                        </div><p>
                        
                        <div class="row">
                           <div class="col-sm-12" align="right">
                              <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                              <font color="blue">${productvo.price } 원 / 시간</font></h4>
                              
                           </div>
                           
                        </div>

                     <hr>
                     <c:choose>
                        <c:when test="${onSaleAuction[0].id == spaceuservo.id}"/>
                        <c:when test="${spaceuservo.id == 'admin'}"/>
                        <c:otherwise>
                           <form action="" id="updateBidCountForm" name="updateBidCountForm">
                           <div class="row" >   
                              
                              
                              <div class="col-xs-12">
                                 <button type="button" class="btn btn-danger" style="width: 100%" id="bidBtn" onclick="price()">즉시예약</button>
                               </div>
                               <br><br><br>
                            </div>   
                           </form>
                           <div>
                  <img src="${initParam.root}/img/icon/good.png" width="30px" height="20px" class="pull-left" id="good"><div id="goodgood"><h5 class="pull-right" id="goodCount">    ${productvo.goodcount}명의 회원이 좋아합니다.</h5></div><br>
                  </div>
                  
                        </c:otherwise>
                     </c:choose>
                  <br><br>   
                  <!-- onclick="return updateBidCount()" -->
                  </div>
                  
</div>

<div style="margin-left: 70%;">
<form action="${initParam.root}complain/view/registerComplain.jsp" method="post" id="complainFrm" name="complainFrm">
   <input type="hidden" value="${productvo.p_no}" name="p_no">
   <input type="hidden" value="${productvo.title}" name="title">
   <input type="hidden" value="${productvo.content}" name="content">
   
</form>

</div>

<form id="hashFrm" name="hashFrm" method="post" action="searchProductByHashtag.do" >
<input type="hidden" value="" name="hash" id="hash">


               <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=deee29e47e0b594ed7e364d991e44d1d&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 

    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addr2coord('${productvo.area}', function(status, result) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${productvo.title}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>

   <p><br>
   
   
</form>
<br><br>
<div class="row" style="margin-left: 14.3%">

<div class="col-sm-8 " >
<form action="registerReview.do"  method="post" id="reviewFrm" name="reviewFrm">
   <input type="hidden" value="${productvo.p_no}" name="no">
   
   <textarea name="review" cols="130" rows="5" style="resize: none" maxlength="130">
   
   </textarea><br>

<fieldset class="rating " style="margin-left:57%">
    <input type="radio" id="star5" name="average" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
    <input type="radio" id="star4half" name="average" value="4.5" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
    <input type="radio" id="star4" name="average" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
    <input type="radio" id="star3half" name="average" value="3.5" /><label class="half" for="star3half" title="Meh - 3.5 stars"></label>
    <input type="radio" id="star3" name="average" value="3" /><label class = "full" for="star3" title="Meh - 3 stars"></label>
    <input type="radio" id="star2half" name="average" value="2.5" /><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
    <input type="radio" id="star2" name="average" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
    <input type="radio" id="star1half" name="average" value="1.5" /><label class="half" for="star1half" title="Meh - 1.5 stars"></label>
    <input type="radio" id="star1" name="average" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
    <input type="radio" id="starhalf" name="average" value="0.5" /><label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
   
</fieldset>   
   
   <input type="button" value="등록" class="btn " style="background-color: #32c5d2; color: white" onclick="registerReview()">   

   
</form>
</div>
   <%-- <table style="mar">
      <thead>
      <tr>
      <th>작성자</th><th>내용</th><th>게시일</th><th>좋아요</th><th>평점</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${rlist}" var="review">
      <input type="hidden" id="rNo" value="${review.r_no }" name="rNo">
      <tr>
      <td>${review.id}</td><td>${review.content} <img src="r.upload/${review.newfilename}" width="100px" height="70px"></td><td>${review.rDate}</td><td><b>&nbsp;&nbsp;<input type="button"  style="width: 15px;height: 15px;" id="like" ><span id="GoodcountView"></span></b></td>
      <td>${review.average}</td>
      </tr>
      </c:forEach>
      </tbody>
   </table> --%>
   
  
   
</div>

</div>
<div class="row" style="margin-left: 14.3%">

<div class="col-sm-5">

 <c:forEach items="${rlist.list}" var="review" >
    
         <hr color="black">
         <h4><b>${review.id} </b> 

             <c:if test="${review.average=='5'}">
                <div class="pull-right"><img src="img/star.png" style="width: 30px"><img src="img/star.png" style="width: 30px"><img src="img/star.png" style="width: 30px"><img src="img/star.png" style="width: 30px"><img src="img/star.png" style="width: 30px"></div>                
             </c:if>
             <c:if test="${review.average=='4.5'}">
                <div class="pull-right"><img src="img/star.png" style="width: 30px"><img src="img/star.png" style="width: 30px"><img src="img/star.png" style="width: 30px"><img src="img/star.png" style="width: 30px"><img src="img/halfstar.png" style="width: 30px"></div>    
             </c:if>
             <c:if test="${review.average=='4'}">
                <div class="pull-right"><img src="img/star.png" style="width: 30px"><img src="img/star.png" style="width: 30px"><img src="img/star.png" style="width: 30px">
                <img src="img/star.png" style="width: 30px"><img src="img/nostar.png" style="width: 30px"></div>    
             </c:if>
             <c:if test="${review.average=='3.5'}">
                <div class="pull-right"><img src="img/star.png" style="width: 30px"><img src="img/star.png" style="width: 30px"><img src="img/star.png" style="width: 30px"><img src="img/halfstar.png" style="width: 30px"><img src="img/nostar.png" style="width: 30px"></div>    
             </c:if>
             <c:if test="${review.average=='3'}">
                <div class="pull-right"><img src="img/star.png" style="width: 30px"><img src="img/star.png" style="width: 30px"><img src="img/star.png" style="width: 30px">
                <img src="img/nostar.png" style="width: 30px"><img src="img/nostar.png" style="width: 30px"></div>    
             </c:if>
             <c:if test="${review.average=='2.5'}">
                <div class="pull-right"><img src="img/star.png" style="width: 30px"><img src="img/star.png" style="width: 30px"><img src="img/halfstar.png" style="width: 30px">
                <img src="img/nostar.png" style="width: 30px"><img src="img/nostar.png" style="width: 30px"></div>    
             </c:if>
             <c:if test="${review.average=='2'}">
                <div class="pull-right"><img src="img/star.png" style="width: 30px"><img src="img/star.png" style="width: 30px"><img src="img/nostar.png" style="width: 30px">
                <img src="img/nostar.png" style="width: 30px"><img src="img/nostar.png" style="width: 30px"></div>    
             </c:if>
             <c:if test="${review.average=='1.5'}">
                <div class="pull-right"><img src="img/star.png" style="width: 30px"><img src="img/halfstar.png" style="width: 30px"><img src="img/nostar.png" style="width: 30px">
                <img src="img/nostar.png" style="width: 30px"><img src="img/nostar.png" style="width: 30px"></div>    
             </c:if>
             <c:if test="${review.average=='1'}">
                <div class="pull-right"><img src="img/star.png" style="width: 30px"><img src="img/nostar.png" style="width: 30px"><img src="img/nostar.png" style="width: 30px">
                <img src="img/nostar.png" style="width: 30px"><img src="img/nostar.png" style="width: 30px"></div>    
             </c:if>
             <c:if test="${review.average=='0.5'}">
                <div class="pull-right"><img src="img/halfstar.png" style="width: 30px"><img src="img/nostar.png" style="width: 30px"><img src="img/nostar.png" style="width: 30px">
                <img src="img/nostar.png" style="width: 30px"><img src="img/nostar.png" style="width: 30px"></div>    
             </c:if>
             <c:if test="${review.average=='0'}">
                <div class="pull-right"><img src="img/nostar.png" style="width: 30px"><img src="img/nostar.png" style="width: 30px"><img src="img/nostar.png" style="width: 30px">
                <img src="img/nostar.png" style="width: 30px"><img src="img/nostar.png" style="width: 30px"></div>    
             </c:if>
          </h4>
          <font size="2px">${review.rDate}</font>
          <input type="hidden" value="${review.r_no}" name="r_no" id="rno">
          <input type="hidden" value="${review.p_no}" name="p_no" id="pno">
          <p><br><br>
          ${review.content}
          </p>
         
   </c:forEach>
</div>
</div>
<div class="col-sm-7"></div>




</div>
            <!-- 페이징 처리 -->
            <%-- 이전 페이지 그룹이 있으면 이미지 보여준다.
        이미지 링크는 현 페이지 그룹 시작페이지 번호 -1 =>
         이전 페이지 그룹의 마지막 페이지 번호로 한다. 
    --%>
    <div class="row">
    <div class="col-sm-4"></div>
    <div class="col-sm-6" style="margin-left: 38%">
    <ul class="pagination">
            <c:if test="${requestScope.rlist.pagingBean.previousPageGroup}">
               <li><a href="${initParam.root}getProduct.do?no=${param.no}&&page=${requestScope.rlist.pagingBean.
    startPageOfPageGroup-1}"><img
                  src="${initParam.root}img/left_arrow_btn.gif"></a></li>
            </c:if>
            &nbsp;&nbsp;
            <%-- PagingBean 을 이용해서 현재 페이지에 해당되는 페이지그룹의
         시작페이지~~마지막페이지까지 화면에 보여준다. 
         이 때 현재 페이지를 제외한 나머지 페이지는 링크를 걸어
         해당 페이지에 대한 게시물 리스트 조회가 가능하도록 한다. 
    --%>      
    
            <c:forEach var="i"
               begin="${requestScope.rlist.pagingBean.startPageOfPageGroup}"
               end="${requestScope.rlist.pagingBean.endPageOfPageGroup}">
               
               <c:choose>
               
                  <c:when test="${requestScope.rlist.pagingBean.nowPage!=i}">
                  
                     <li><a href="${initParam.root}getProduct.do?no=${param.no}&&page=${i}">${i}</a></li>
                     
                     
                  </c:when>
                  
                  <c:otherwise>
                  <li class="active"><a href="#">${i}</a></li>
                  
   
   </c:otherwise>
   
               </c:choose>
               
            </c:forEach>
   
               
            &nbsp;&nbsp;
            <%-- 다음 페이지 그룹이 있으면 화살표 이미지를 보여준다.
         이미지 링크는 현재 페이지 그룹의 마지막 번호 + 1 => 
         다음 그룹의 시작 페이지로 링크한다. 
         right_arrow_btn.gif
    --%>
            <c:if test="${requestScope.rlist.pagingBean.nextPageGroup}">
               <li><a
                  href="${initParam.root}getProduct.do?no=${param.no}&&page=${requestScope.rlist.pagingBean.
    endPageOfPageGroup+1}">
                  <img src="${initParam.root}img/right_arrow_btn.gif">
               </a></li>
            </c:if>
      </ul>      
            <br>
            
   
   </div>
      </div>
</c:if>      
<br><br><br><br><br><br><br><br><br>
<footer>
<jsp:include page="../../footer.jsp"></jsp:include>
</footer>
</body>
</html>