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
	$(function(){
		if(${spaceuservo.id  == null}){
			location.href="${initParam.root}NewFile1.jsp";
		}
		if(${spaceuservo.id != 'admin'}){
			location.href="${initParam.root}getAllProduct.do";
		}
	});
</script>
<script type="text/javascript">
var xhr;
   function checkOnSaleAuction() {
      xhr = new XMLHttpRequest();
      xhr.onreadystatechange = callback;
      
      xhr.open("post", "checkOnSaleAuction.do");
      xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
      xhr.send();
   }
   function callback() {
      if(xhr.readyState == 4){
         if(xhr.status == 200){
            var size = xhr.responseText.trim();
            if(size == "0"){
               alert("승인되었습니다.");
               document.applyAuctionForm.submit();
            }
            else{
               alert("이미 진행중인 경매가 있습니다.");
               return;
            }
         }
      }
      
   }
</script>
<style type="text/css">
   input{
      font-size: 16px !important;
      color: black ;
   }

</style>
</head>
<body>
<!-- header -->
<jsp:include page="/header.jsp"/>
      <div class="container" style="margin-top: 20px;">
         <div class="row">
            <div class="container">
              <div class="col-lg-1"></div>
           <div class="col-lg-10" >
                  <h2 class="section-heading" align="center">관리자 경매 승인</h2>
                 <hr>
              </div>
              <div class="col-lg-1"></div>
            </div>
            <div class="container">
               <form action="${initParam.root}applyAuction.do" method="post" id="applyAuctionForm" 
                  name="applyAuctionForm" onsubmit="return checkOnSaleAuction()">
                  <div class="row">
                     <div class="container">
                        <div class="col-xs-1"></div>
                        <div class="col-xs-10">
                           <div class="" id="productInfo">
                           <br><br>
                              <h2 class="section-heading" id="imgProduct"><b>${auctiontemp.title}</b></h2>

                              <h4> 지역 · ${auctiontemp.area}</h4>
                               
                              <input type="text" style="border: none; color: black;  width: 20%; margin-left: 82%; background-color: #F6F6F6;" id="a_date" name="a_date" 
                                    value="${auctiontemp.a_date}" readonly="readonly">
                             
                              <hr style="background-color: white;">
                              
                              <img alt="" src="a.upload/${auctiontemp.anewfilename}" width="100%"/>    
                              <hr width="100%" style="height: 1px; border: initial; background-color: white;">
                              <h4>호스트: &nbsp;${auctiontemp.id} 님</h4>
                              <h4></h4>
                              
                              <hr style="background-color: white;">
                              
                              <div class="row">
                                 <div class="col-xs-2" align="left">이용 인원</div>
                                 <div class="col-xs-1" align="left"></div>
                                 <div class="col-xs-9" align="left">${auctiontemp.accomodation} 명</div>
                              </div>
                              <hr style="background-color: white;">
                              
                              <div class="row">
                                 <div class="col-xs-2" align="left">가격</div>
                                 <div class="col-xs-1" align="left"></div>
                                 <div class="col-xs-9" align="left">${auctiontemp.price} 원</div>
                              </div>
                              <hr style="background-color: white;">
                              
                              <div class="row">
                                 <div class="col-xs-2" align="left">콘텐츠</div>
                                 <div class="col-xs-1" align="left"></div>
                                 <div class="col-xs-9" align="left">
                                 <textarea rows="10" cols="50" name="content" style="font-size: medium; 
                                 	resize: none; width: 100%; background-color: #F6F6F6; border: none;"> ${auctiontemp.content}</textarea>
                                 </div>
                              </div>
                              <hr style="background-color: white;">
                              
                              <div class="row">
                                 <div class="col-xs-2" align="left">위치</div>
                                 <div class="col-xs-1" align="left"></div>
                                 <div class="col-xs-9" align="left">
                                    <input type="text" style="border: none; color: black; background-color: #F6F6F6; width: 90%;" id="area" name="area" 
                                       value="${auctiontemp.area}" readonly="readonly"><br>
                                    <input type="text" style="border: none; color: black; background-color: #F6F6F6; width: 90%;" id="location" name="location" 
                                       value="${auctiontemp.location}" readonly="readonly">
                                    <div id="map" style="width:60%; height:300px; margin-top:10px;"></div>
									<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=deee29e47e0b594ed7e364d991e44d1d&libraries=services"></script>
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
									geocoder.addr2coord('${auctiontemp.area}', function(status, result) {
									
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
									            content: '<div style="width:150px;text-align:center;padding:6px 0;">${auctiontemp.title}</div>'
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
                                 <div class="col-xs-2" align="left">편의 시설</div>
                                 <div class="col-xs-1" align="left"></div>
                                 <div class="col-xs-9" align="left">
                                    <div class="form-group">
                                       <c:forTokens items="${auctiontemp.amenities}" delims="," var="amen">
                                          <img alt="" src="${initParam.root}auction/img/${amen}">&nbsp;&nbsp;&nbsp;
                                       </c:forTokens>
                                    </div>
                                 </div>
                              </div>
                              <hr style="background-color: white;">
                                 
                              <div class="row">
                                 <div class="col-xs-2" align="left">경매 마감일</div>
                                 <div class="col-xs-1" align="left"></div>
                                 <div class="col-xs-9" align="left">
                                    <input type="text" style="border: none; color: black; background-color: #F6F6F6;" id="enddate" name="enddate"  
                                       value="${auctiontemp.enddate}" readonly="readonly">
                                 </div>
                              </div>
                              <hr style="background-color: white;">
                              
                              <div class="row">
                                 <div class="col-xs-2" align="left">판매자</div>
                                 <div class="col-xs-1" align="left"></div>
                                 <div class="col-xs-9" align="left">
                                    <input type="text" style="border: none; color: black; background-color: #F6F6F6;" id="name" name="name"  
                                       value="${auctiontemp.name}" readonly="readonly">
                                 </div>
                              </div>
                              <hr style="background-color: white;">
                        
                              <div class="row">
                                 <div class="col-xs-2" align="left">연락처</div>
                                 <div class="col-xs-1" align="left"></div>
                                 <div class="col-xs-9" align="left">
                                    <input type="tel" style="border: none; color: black; background-color: #F6F6F6;" id="tel" name="tel" 
                                       value="${auctiontemp.tel}" readonly="readonly">
                                 </div>
                              </div>
                              <hr style="background-color: white;">
                              
                              <div class="row">
                                 <div class="col-xs-2" align="left">사업자등록번호</div>
                                 <div class="col-xs-1" align="left"></div>
                                 <div class="col-xs-9" align="left">
                                    <c:if test="${auctiontemp.crn == null}">
                                       <p>미등록</p>
                                    </c:if>
                                    <c:if test="${auctiontemp.crn != null}">
                                       <input type="tel" style="border: none; color: black; background-color: #F6F6F6; width: 25%;" id="crn" name="crn" 
                                       value="${auctiontemp.crn}" readonly="readonly">
                                       <a href="crnDownload.do?orgfilename=${auctiontemp.originfilename }&&newfilename=${auctiontemp.newfilename}"><b>Download</b></a><br><br>
                                       <img alt="" src="a.crn/${auctiontemp.newfilename}" width="65%"/>
                                    </c:if>
                                 </div>
                              </div>
                              <hr style="background-color: white;">
                              
                           </div>
                        </div>
                        <div class="col-xs-1"></div>
                     </div>
                  </div>
                  <br>
                  <input type="hidden" id="a_no" name="a_no" value="${auctiontemp.a_no}">
                  <input type="hidden" id="price" name="price" value="${auctiontemp.price}">
                  <input type="hidden" id="title" name="title" value="${auctiontemp.title}">
                  <input type="hidden" id="confirm" name="confirm" value="${auctiontemp.confirm}">
                  <input type="hidden" id="id" name="id" value="${auctiontemp.id}">
               <input type="hidden" id="content" name="content" value="${auctiontemp.content}">
               
                  <input type="hidden" id="originfilename" name="originfilename" value="${auctiontemp.originfilename}">
                  <input type="hidden" id="newfilename" name="newfilename" value="${auctiontemp.newfilename}">
                  <input type="hidden" id="aoriginfilename" name="aoriginfilename" value="${auctiontemp.aoriginfilename}">
                  <input type="hidden" id="anewfilename" name="anewfilename" value="${auctiontemp.anewfilename}">
                  <input type="hidden" id="accomodation" name="accomodation" value="${auctiontemp.accomodation}">
                  <input type="hidden" value="${auctiontemp.amenities}" name="amenities" id="amenities">
                  
                  <div align="center">
                     <input type="button" id="checkBtn" name="checkBtn" class="btn btn-red"
                        value="승인" onclick="checkOnSaleAuction()">
                  </div>
                  
               </form>
            </div>
            <br>
         </div>
      </div>
   <br><br>
<jsp:include page="/footer.jsp"/>
</body>
</html>