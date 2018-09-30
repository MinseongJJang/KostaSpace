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
		if(${spaceuservo.id==null}){
			location.href="${initParam.root}NewFile1.jsp";
		}
		if(${spaceuservo.id == 'admin'}){
			alert("관리자 기능이 아닙니다.");
			location.href="${initParam.root}home.jsp";
		}
   });   //function
   
   var edate = "<c:out value='${onSaleAuction[0].enddate}' />";
   var edateArray = edate.split('-');
   
   var now = new Date();
   var g_Timer = 0;
    var g_LastTime = new Date(edateArray[0], edateArray[1], edateArray[2], 14, 00, 00); // 경매마감시간
    
    var g_DBNowTime = new Date(now.getFullYear(), now.getMonth()+1, now.getDate(), 
          now.getHours(), now.getMinutes(), now.getSeconds()); // 경매시작시간
    
    /* var g_DBNowTime = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 
          now.getHours(), now.getMinutes(), now.getSeconds()); // 경매시작시간 */
   
   function Countdown() {
      var NowTime = new Date(g_DBNowTime.getTime() + (g_Timer * 1000));
      var iGap = Math.floor((g_LastTime.getTime() - NowTime.getTime()) / (1000));
      var strLastTime = "";
      if (iGap > 0) { // 현재진행중이라면
         strLastTime = FormatGap(iGap, "full");
         setTimeout("Countdown()", 1000);
         g_Timer = g_Timer + 1;
      } else {// 마감이라면...
         strLastTime = "경매종료";
      }

      if (document.getElementById("hdivMessage") != "undefined") {
         document.getElementById("hdivMessage").innerHTML = strLastTime;
         if(strLastTime == "경매종료"){
            alert("경매가 종료되었습니다.");
            location.href = "getOnSaleAuction.do?flag=index";
         }
      }
   }

   function FormatGap(iGap, format) {
      var iGapTime = new Date(2000, 0, 1, 0, 0, iGap);
      var strLeftTime = "";
      if (format == "full") {
         if (iGapTime.getMonth() > 0 || iGapTime.getDate() > 1)
            strLeftTime = "<span class='fc'>"
                  + Math.floor(iGap / (60 * 60 * 24)) + "일 </span>";
         return strLeftTime + "<span class='fc'>" + iGapTime.getHours()
               + "시간 " + iGapTime.getMinutes() + "분 "
               + iGapTime.getSeconds() + "초 </span>";
      } else {
         return "<span class='fc'>" + iGapTime.getMinutes() + "분 "
               + iGapTime.getSeconds() + "초 </span>";
      }
   }
</script>
<script type="text/javascript">
/* 입찰버튼을 눌렀을때 옥션가격을 업데이트 시킨다. */
     $(function(){
      $('#bidBtn').click(function(){
         var price = document.updateBidCountForm.price;
         if(isNaN(price.value)){
               alert("입찰가는 정수만 입력해 주세요");
               price.value="";
               price.focus();
               return false;
            }else if(price.value==""){
               alert("입찰가를 입력하세요");
               price.value="";
               price.focus();
               return false;
            }else if(${spaceuservo.point}<price.value){
               alert("보유 포인트가 부족합니다.");
               price.value="";
               price.focus();
               return false;
            }else if(${onSaleAuction[0].price}>=price.value){
               alert("입찰금액은 경매가보다 높아야 합니다.");
               price.value="";
               price.focus();
               return false;
            }
         $.ajax({
            type:"post",
            url:"${initParam.root}updateBidCount.do",
            data : "price=" + price.value + "&&a_no=" + ${onSaleAuction[0].a_no},
            
            success:function(data){
               if(data.myBid.count=='0'){
                  alert("입찰은 3번만 가능합니다.");
                  location.href="getOnSaleAuction.do";
               }else{
                  location.href="getOnSaleAuction.do";
               }
            }//success
         })
      
      });//click
   }); //function
   /* 내 입찰정보를 가져온다. */
   $(function(){
      $('#myBidBtn').on('click',function(){
         $.ajax({
            type:"post",
            url:"${initParam.root}getBidInfo.do",
            
            success:function(data){
             if(data.myBid==null){
                alert("입찰내역이 없습니다.");
             }else{
                $('#bidview').html(
                  "<div class='row'>"+
                     "<div class='col-xs-12'>"+
                        "<div class='row'>"+
                           "<div class='col-xs-4'>ID &nbsp;&nbsp;&nbsp; : &nbsp;&nbsp;&nbsp;"+data.myBid.id+"</div>"+
                           "<div class='col-xs-4'>입찰가 &nbsp;&nbsp;&nbsp; : &nbsp;&nbsp;&nbsp;"+data.myBid.price+"</div>"+
                           "<div class='col-xs-4'>남은 입찰기회 &nbsp;&nbsp;&nbsp; : &nbsp;&nbsp;&nbsp;"+data.myBid.count+"</div>"+                  
                        "</div>"+
                     "</div>"+
                  "</div>" 
                  
                );//html
                $('#myBidInfoModal').modal();
             }
            }
         })
      });//click
   });//function
$(function() {
    $(window).scroll(function() {
        var scrollTop = jQuery(document).scrollTop();
          //console.log("scrollTop : " + scrollTop);
         var footer = $('footer').offset().top;
         var height = footer-660;
         if (scrollTop < 60) {
              scrollTop = 60;
          }else if(scrollTop > footer-660){
              scrollTop = height;   
          }
          jQuery("#AuctionTime").stop();
          jQuery("#AuctionTime").animate( { "top" : scrollTop });
   });//scroll 
});//fuction   
</script>
<style type="text/css">
   #productBox{
      position: relative;
   }
   #productInfo{
      width: 650px;
      position: relative;
   }
    #AuctionTime{
      width:250px;
      position: absolute; 
      padding-right: 0px;
      top: 60px;
      left: 800px;
     } 
    
</style>
</head>
<body>

<!-- header -->
<jsp:include page="/header.jsp"></jsp:include   >
<div class="row">   
	<div class="container">
		<div class="col-xs-12" align="center" id="productBox">
			<div class="row">
				<div class="col-xs-8" align="left">
					<div class="" id="productInfo">
						<br>
						<br>
						<h2 class="section-heading" id="imgProduct">
							<b>${onSaleAuction[0].title}</b>
						</h2>
						<h4>지역 · ${onSaleAuction[0].area}</h4>
						<hr style="background-color: white;">
						
						<img alt="" src="a.upload/${onSaleAuction[0].anewfilename}" width="100%" />
						<br>
						<br>
						<h4>호스트: &nbsp;${onSaleAuction[0].id} 님</h4>
						<br>
						<h4>이용인원 &nbsp;${onSaleAuction[0].accomodation} 명</h4>
						<h4></h4>
						<hr style="background-color: white;">
							
						<div class="row">
							<div class="col-xs-2" align="left">콘텐츠</div>
							<div class="col-xs-1" align="left"></div>
							<div class="col-xs-9" align="left"> ${onSaleAuction[0].content}</div>
						</div>
						<hr style="background-color: white;">
						
						<div class="row">
							<div class="col-xs-2" align="left">제공 항목</div>
							<div class="col-xs-1" align="left"></div>
							<div class="col-xs-9" align="left">
								<div class="form-group">
									<c:forTokens items="${onSaleAuction[0].amenities}" delims="," var="amen">
										<img alt="" src="${initParam.root}auction/img/${amen}">&nbsp;&nbsp;&nbsp;
									</c:forTokens>
								</div>
							</div>
						</div>
						<hr style="background-color: white;">
						
						<div class="row">
							<div class="col-xs-2" align="left">위치</div>
							<div class="col-xs-1" align="left"></div>
							<div class="col-xs-9" align="left">
								<input type="text" 
									style="border: none; color: black; background-color: #F6F6F6; width: 90%;" 
									id="area" name="area" value="${onSaleAuction[0].area}" readonly="readonly">
								<br>
								<input type="text"
										style="border: none; color: black; background-color: #F6F6F6; width: 90%;"
										id="location" name="location" value="${onSaleAuction[0].location}" 
										readonly="readonly">
								<div id="map" style="width: 90%; height: 300px; margin-top: 10px;"></div>
								<script type="text/javascript"
									src="//apis.daum.net/maps/maps3.js?apikey=deee29e47e0b594ed7e364d991e44d1d&libraries=services"></script>
								<script>
									var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
									mapOption = {
										center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                                   		level: 5 // 지도의 확대 레벨
                               		};  
                           
                           			// 지도를 생성합니다    
                           			var map = new daum.maps.Map(mapContainer, mapOption); 
                           
									// 주소-좌표 변환 객체를 생성합니다
                           			var geocoder = new daum.maps.services.Geocoder();
                           			// 주소로 좌표를 검색합니다
                           			geocoder.addr2coord('${onSaleAuction[0].area}', function(status, result) {
                           
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
		                                   		content: '<div style="width:150px;text-align:center;padding:6px 0;">${onSaleAuction[0].title}</div>'
		                                   	});
		                                   	infowindow.open(map, marker);
		                                   	
		                                   	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		                                   	map.setCenter(coords);
										} 
									});
	                        	</script>
							</div>
						</div>
						<hr style="background-color: white;">
						
						<div class="row">
							<div class="col-xs-2" align="left">경매 마감일</div>
							<div class="col-xs-1" align="left"></div>
							<div class="col-xs-9" align="left">${onSaleAuction[0].enddate}</div>
						</div>
					</div>
				</div>

				<div class="col-xs-4" align="left" id="AuctionTime" >
                	<h3 class="section-heading" align="left"><b>마감 시간</b></h3>
					<div class="t_gold" id="hdivMessage" align="left" 
						style="margin-bottom: 20px; margin-top: 20px; font-size: 20px;"></div>
					<script>Countdown();</script>
					<hr style="background-color: white;">
					
					<h4 class="section-heading"><b>경매 정보</b></h4><br>
					<div class="row">
						<div class="col-xs-4" align="left">판매자</div>
						<div class="col-xs-1" align="left"></div>
						<div class="col-xs-7" align="left">${onSaleAuction[0].name}</div>
					</div><p>
					<div class="row">
						<div class="col-xs-4" align="left">전화번호</div>
						<div class="col-xs-1" align="left"></div>
						<div class="col-xs-7" align="left">${onSaleAuction[0].tel}</div>
					</div><p>
 					<div class="row">
						<div class="col-xs-4" align="left">경매가</div>
						<div class="col-xs-1" align="left"></div>
						<div class="col-xs-7" align="left" id="auctionPrice">${onSaleAuction[0].price} 원</div>
 					</div>
					<hr style="background-color: white;">
					
					<c:choose>
						<c:when test="${onSaleAuction[0].id == spaceuservo.id}" />
						<c:when test="${spaceuservo.id == 'admin'}" />
						<c:otherwise>
							<form action="" id="updateBidCountForm" name="updateBidCountForm">
								<input type="hidden" value="0" name="count" id="count">
								<div class="row">
									<div class="col-xs-6">
										<input type="text" class="form-control" id="price"
											name="price" style="width: 100%;" placeholder="입찰가">
									</div>
									<div class="col-xs-6">
										<!--  <button type="button" class="btn btn-danger" style="width: 100%" id="bidBtn" onclick="return updateBidCount()">입찰</button> -->
										<button type="button" class="btn btn-warning" id="bidBtn"
											style="width: 100%;">입찰</button>
									</div>
								</div>
							</form>
							<hr style="background-color: white;">
							
							<button type="button" class="btn btn-primary" id="myBidBtn"
								style="width: 100%;">내 입찰 정보 조회</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>      
</div>
<!-- 나의 입찰내역 모달 -->
<div class="modal fade" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true" id="myBidInfoModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="gridSystemModalLabel">나의 입찰정보</h4>
			</div>
			<div class="modal-body">
				<div id="bidview"></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<br>
<br>

<jsp:include page="/footer.jsp"/>

</body>
</html>
