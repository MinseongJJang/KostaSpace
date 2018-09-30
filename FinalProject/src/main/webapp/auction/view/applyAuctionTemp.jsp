<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- Bootstrap -->
<link href="${initParam.root}bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${initParam.root}bootstrap/js/bootstrap.min.js" rel="stylesheet">
<!-- custom css  -->
<link href="${initParam.root }css/real-estate.css" rel="stylesheet" type="text/css" media="screen">
<!-- font awesome for icons -->
<link href="${initParam.root }font-awesome/css/font-awesome.min.css" rel="stylesheet">       
<link href="https://fonts.googleapis.com/css?family=Roboto:400,900,700,500,400italic,300italic,300,100italic,100" rel="stylesheet" type="text/css">
<!--owl carousel css-->
<link href="${initParam.root }owl-carousel/assets/owl.carousel.css" rel="stylesheet" type="text/css" media="screen">
<link href="${initParam.root }owl-carousel/assets/owl.theme.default.css" rel="stylesheet" type="text/css" media="screen">
<!--mega menu -->
<link href="${initParam.root }css/yamm.css" rel="stylesheet" type="text/css">
<link href="${initParam.root }css/select.css" rel="stylesheet" type="text/css">
<!--Revolution slider css-->
<link href="${initParam.root }rs-plugin/css/settings.css" rel="stylesheet" type="text/css" media="screen">
<link href="${initParam.root }css/rev-style.css" rel="stylesheet" type="text/css" media="screen">
<!-- 사용자정의 css -->
<link href="${initParam.root }css/mask.css" rel="stylesheet" type="text/css" media="screen">
<link href="${initParam.root }css/topBar.css" rel="stylesheet" type="text/css" media="screen">
<link href="${initParam.root }css/checkLabel.css" rel="stylesheet" type="text/css" media="screen">
<link rel="stylesheet" type="text/css" href="${initParam.root }css/header.css">
<!--sticky header-->
<script type="text/javascript" src="${initParam.root}js/jquery.sticky.js"></script>
<script type="text/javascript">
   $(function(){
      if(${spaceuservo.id == null}){
         location.href="${initParam.root}NewFile1.jsp";
      }
      if(${spaceuservo.id == 'admin'}){
         alert("관리자 기능이 아닙니다.");
         location.href="${initParam.root}home.jsp";
      }
   });
</script>
<script type="text/javascript">
   $(function() {
      $("#crn").keyup(function() {
         var crnval = $(this).val();
         var crnlength = $(this).val().length;
         if(crnlength > 10){
            alert("사업자 등록 번호는 10자입니다.");
            document.getElementById("crncopy").innerHTML 
               = "<font color='red'>&nbsp;&nbsp;&nbsp;&nbsp;사업자 등록 번호는 10자입니다</font>";
            var crncheck = crnval.substring(0,10);
            document.getElementById("crn").value = crncheck;
         }
      });
      
      $('#downAcmo').click(function(){
         $('#accomodation').removeAttr("readonly");
         var c = $('#accomodation').val();
         if($('#accomodation').val()=='전체인원'){
            $('#accomodation').val(1);
         }
          else if(c==1){
             return false;
         }else{
            $('#accomodation').val(parseInt(c));
         }
      });
      
      $('#upAcmo').click(function(){
         $('#accomodation').removeAttr("readonly");
         if($('#accomodation').val()=='전체인원'){
            $('#accomodation').val(1);
         }
         var c = $('#accomodation').val();
         $.ajax({
            type : "post",
            url : "${initParam.root}plus.do",
            data : "cnt=" + c,
            success : function(data) {
               $('#accomodation').val(parseInt(data.d));
            }
         });
      });
      $('#checkAccomodation1').click(function() {
         $('#accomodation').attr("readonly", "readonly");
         $('#accomodation').val("전체인원");
      });
      
   }); //function
</script>
<script type="text/javascript">
function clickImg(img) {
   if ((document.getElementById("amenities").value).includes(img)) {
      alert("중복선택 불가");
      return false;
   } else {
      var amenities1 = img;
      var amenitiesSubstr = amenities1.substr(7);
      var amenitiesNum = amenitiesSubstr.split('.');
      /* 
      $('#amenitiesDiv').append('<a href="javascript:deleteimg('+amenitiesNum[0]+')" id="'+amenities1+'">'
                        + '<img src="'+amenities1+'" id="'+amenities1+'"></img>'
                        + '<img src="' + ${initParam.root} + 'auction/img//x.png"></img></a>');
      */
      $('#amenitiesDiv').append('<a href="javascript:deleteimg('+amenitiesNum[0]+')" id="'+amenities1+'" style="width: 40px; height: 40px; margin-right: 18px;">'
              + '<img src="'+img+'" id="'+amenities1+'" width="35px !important" height="35px !important" style="margin-bottom: 10px;"></img>'
              + '<img src="' + ${initParam.root} + 'auction/img//x.png" style="margin-left: -25px; display: none;" width="35px !important" height="35px !important"></img></a>');      
      document.getElementById("amenities").value 
         = document.getElementById("amenities").value + amenities1 + ",";
   }
}

function deleteimg(amenitiesNum) {
   //alert("deleteimg  ::: " + mmm);
   var id = "../img/" + amenitiesNum + ".png";
   //alert("id  ::: " + id);
   $('a[id*="' + amenitiesNum +'"]').remove();
   var arrayTemp = document.getElementById("amenities").value.split(',');
   //alert(arrayTemp);
   var arrayTempLength = 0;
   for(var i = 0; i < arrayTemp.length-1; i ++ ){
      if(arrayTemp[i] == id){
         arrayTempLength = i;
      }
   }
   //alert(arrayTempLength);
   arrayTemp.splice(arrayTempLength, 1);   // 특정번째 부터 특정길이만큼 배열의 요소 삭제
   //alert(arrayTemp.splice(arrayTempLength, 1));
   //alert(arrayTemp);
   document.getElementById("amenities").value = arrayTemp;
   
}
function allDeleteImg() {
   $('#amenitiesDiv').empty();   // 자식만 삭제
   document.getElementById("amenities").value = "";
}
</script>
</head>
<body>
<jsp:include page="/header.jsp"/>

<div class="container">
   <div class="row">
      <div class="container">
         <div class="col-lg-2"></div>
         <div class="col-lg-8" >
            <h2 class="section-heading" align="center">경매 등록</h2>
            <hr>
            <br>
         </div>
         <div class="col-lg-2"></div>
      </div>
         <div class="container">
            <div class="row" style="width:60%; background-color: #e6e6e6; margin: auto;">
               <div class="container" style="width: 90%;">
                  <form action="${initParam.root }applyAuctionTemp.do" method="post" id="applyAuctionTempForm" 
                     name="applyAuctionTempForm" class="" enctype="multipart/form-data">
                  <br>
                  <div class="form-group">
                     <label for="label-applyAuction">Title</label>
                     <input type="text" class="form-control" id="title" name="title" 
                        required="required" placeholder="Title">
                  </div>
                  <div class="form-group">
                     <label for="label-applyAuction">Price</label>
                     <input type="text" class="form-control" id="price" name="price" 
                        required="required" placeholder="Price">
                  </div>
                  <div class="form-group">
                     <label for="label-applyAuction">Content</label>
                     <textarea rows="10" cols="50" name="content" style="resize: none; width: 100%">${auctiontemp.content}</textarea>
                  </div>
                  <div class="form-group">
                     <label for="label-registerProduct">Area</label>
                     <div class="input-group" style="width: 100%;">
                        <input type="text" class="form-control" name="area" id="sample5_address" 
                           placeholder="주소" style="width:78%; margin-right: 7%;">
                        <span>
                           <input type="button" onclick="sample5_execDaumPostcode()" 
                              class="btn btn-red pull-left" value="주소검색" 
                              style="height: 100%;">
                        </span>
                        <input type="text" class="form-control" name="location" id="sample5_address" 
                           placeholder="상세주소" style="width:78%;">
                     </div>
                     <div id="map" style="width:60%; height:300px; margin-top:10px; display:none;"></div>
                     <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
                     <script src="//apis.daum.net/maps/maps3.js?apikey=deee29e47e0b594ed7e364d991e44d1d&libraries=services"></script>
                     <script>
                         var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                             mapOption = {
                                 center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
                                 level: 5 // 지도의 확대 레벨
                             };
                     
                         //지도를 미리 생성
                         var map = new daum.maps.Map(mapContainer, mapOption);
                         //주소-좌표 변환 객체를 생성
                         var geocoder = new daum.maps.services.Geocoder();
                         //마커를 미리 생성
                         var marker = new daum.maps.Marker({
                             position: new daum.maps.LatLng(37.537187, 127.005476),
                             map: map
                         });
                        
                         function sample5_execDaumPostcode() {
                             new daum.Postcode({
                                 oncomplete: function(data) {
                                     // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                                     // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                     var fullAddr = data.address; // 최종 주소 변수
                                     var extraAddr = ''; // 조합형 주소 변수
                     
                                     // 기본 주소가 도로명 타입일때 조합한다.
                                     if(data.addressType === 'R'){
                                         //법정동명이 있을 경우 추가한다.
                                         if(data.bname !== ''){
                                             extraAddr += data.bname;
                                         }
                                         // 건물명이 있을 경우 추가한다.
                                         if(data.buildingName !== ''){
                                             extraAddr += (extraAddr !== '' ? ', ' 
                                                      + data.buildingName : data.buildingName);
                                         }
                                         // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                                         fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                                     }
                     
                                     // 주소 정보를 해당 필드에 넣는다.
                                     document.getElementById("sample5_address").value = fullAddr;
                                     // 주소로 좌표를 검색
                                     geocoder.addr2coord(data.address, function(status, result) {
                                         // 정상적으로 검색이 완료됐으면
                                         if (status === daum.maps.services.Status.OK) {
                                             // 해당 주소에 대한 좌표를 받아서
                                             var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
                                             // 지도를 보여준다.
                                             mapContainer.style.display = "block";
                                             map.relayout();
                                             // 지도 중심을 변경한다.
                                             map.setCenter(coords);
                                             // 마커를 결과값으로 받은 위치로 옮긴다.
                                             marker.setPosition(coords)
                                         }
                                     });
                                 }
                             }).open();
                         }
                     </script>
                  </div>
                  <div class="form-group">
                     <label for="label-applyAuction">Tel</label>
                     <input type="tel" pattern="\d{3}-\d{3,4}-\d{4}" class="form-control" id="tel" 
                        name="tel" placeholder="Tel pattern Example: 123-456-7890 or 123-4567-8901" 
                        required="required">
                  </div>
                  <div class="form-group">
                     <label for="label-applyAuction">Name</label>
                     <input type="text" class="form-control" id="name" name="name" placeholder="Name" 
                        required="required">
                  </div>
                  
                  <div class="form-group">
                     <label for="label-applyAuction">사업자등록번호</label>
                     <br>
                     <input type="text" class="form-control" id="crn" name="crn" placeholder="사업자등록번호"
                        style="width: 60%; display: inline-block;">
                     <span id="crncopy"></span>
                  </div>
                  
                  <div class="form-group">
                     <label for="label-applyAuction">사업자등록증 Upload</label>
                     <input type="file" name="upload" id="upload">
                  </div>
                  <div class="form-group">
                     <label for="label-applyAuction">Image Upload</label>
                     <input type="file" name="aupload">
               
                  </div>
                  <div class="form-group">
                     <label for="label-applyAuction">경매 종료일</label>
                     <input type="date" class="form-control" id="enddate" name="enddate" placeholder="EndDate" 
                        required="required">
                  </div>
                  
                  <div class="form-group">
                     <label for="label-applyAuction">Accomodation</label><br>
                           <div class="input-group" style="width: 60%; float: left;">
                        <span class="input-group-addon" style="width: 10%;">
                           <i class="fa fa-arrow-circle-down" id="downAcmo"></i>
                        </span>
                        <input type="text" id="accomodation" name="accomodation" value="1" 
                           style="text-align: center; font-size: 2em" class="form-control" 
                           pattern="[0-9]{1,4}" max="9999">
                        <span class="input-group-addon" style="width: 10%;">
                           <i class="fa fa-arrow-circle-up" id="upAcmo"></i>
                        </span>
                     </div>
                     <button type="button" class="btn btn-red" id="checkAccomodation1" 
                        style="height: 33.3px; margin-left: 2.5%;">전체인원</button>
                  </div>
                  <br>
                  
                  <div class="form-group">
                           <label for="label-applyAuction">Amenities</label>
                           <p>제공가능한 편의 시설은??</p>
                           <div class="form-control" style="height: auto;">
                              <c:forEach begin="1" end="28" varStatus="i">
                                 <a href="javascript:clickImg('../img/${i.count}.png')"><img src="../img/${i.count}.png" width="50px" ></a>&nbsp;&nbsp;&nbsp;
                              </c:forEach><br><br>
                              <div class="row" style="margin: auto; height: auto;">
                                 <div id="amenitiesDiv" class="form-control col-xs-11" style="width:80.5%; height: auto; min-height: 32px;"></div>&nbsp;&nbsp;
                                  <div class="col-xs-1">
                                    <input type="button" id="allDelete" value="전체삭제" class="btn btn-red" 
                                       style=" height:90%; width: 80px;" onclick="allDeleteImg()">
                                 </div>
                              </div>
                              <input type="hidden" value="" name="amenities" id="amenities">
                           </div>
                        </div>
                  
                  <input type="hidden" id="id" name="id" value="${spaceuservo.id}">
                  <div align="center">
                  <input type="submit" class="btn btn-success" value="신청">
                  <input type="reset" class="btn btn-warning" value="재입력">
                  </div>
                </form>
                <br>
            </div>
         </div>
      </div> 
   </div>
</div>
<br>
<br>

<jsp:include page="/footer.jsp"/>
</body>
</html>

