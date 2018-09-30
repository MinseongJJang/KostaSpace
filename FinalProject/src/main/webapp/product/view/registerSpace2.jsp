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
<link href="${initParam.root}bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- custom css  -->
<link href="${initParam.root }css/real-estate.css" rel="stylesheet"
	type="text/css" media="screen">
<!-- font awesome for icons -->
<link href="${initParam.root }font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,900,700,500,400italic,300italic,300,100italic,100'
	rel='stylesheet' type='text/css'>
<!--owl carousel css-->
<link href="${initParam.root }owl-carousel/assets/owl.carousel.css"
	rel="stylesheet" type="text/css" media="screen">
<link href="${initParam.root }owl-carousel/assets/owl.theme.default.css"
	rel="stylesheet" type="text/css" media="screen">
<!--mega menu -->
<link href="${initParam.root }css/yamm.css" rel="stylesheet"
	type="text/css">
<link href="${initParam.root }css/select.css" rel="stylesheet"
	type="text/css">
<!--Revolution slider css-->
<link href="${initParam.root }rs-plugin/css/settings.css"
	rel="stylesheet" type="text/css" media="screen">
<link href="${initParam.root }css/rev-style.css" rel="stylesheet"
	type="text/css" media="screen">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 사용자정의 css -->
<link href="${initParam.root }css/mask.css" rel="stylesheet"
	type="text/css" media="screen">
<link href="${initParam.root }css/topBar.css" rel="stylesheet"
	type="text/css" media="screen">
<link rel="stylesheet" type="text/css"
	href="${initParam.root }css/header.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>registerSpace2</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.js"></script>
<!-- Latest compiled and minified CSS -->
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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="//apis.daum.net/maps/maps3.js?apikey=deee29e47e0b594ed7e364d991e44d1d&libraries=services"></script>
<style type="text/css">
.navbar {
	background-color: #004b8b;
}

#logo {
	font-family: "Open Sans", sans-serif;
	font-size: 40px;
	color: white;
}
</style>
<script type="text/javascript">
function check(){
      var frm = docment.registerProductForm;
      var sTime = frm.sTime.value;
      var eTime = frm.eTime.value;
      if(sTime==''){
         alert("시작시간을 선택하세요");
         return false;
      }else if(eTime==''){
         alert("끝시간을 선택하세요");
         return false;
      }
   }

$(function(){
   var count = 0;
   var hash = [];
   $('#hashInsert').click(function(){
      var hashtagInsert = $("#hashtagInsert").val();
      
      hash = hashtagInsert.split('#');
      
      if(hash.length==2){
      if(count<5){
      if(hashtagInsert.includes('#')){
         if(count<4){
             count++
            
            $('#hashtag').val($('#hashtag').val()+hashtagInsert+",");
            $('#hashtagInsert').val("");
            
         }else{
             count++
            
            $('#hashtag').val($('#hashtag').val()+hashtagInsert);
            $('#hashtagInsert').val("");
            
         }
      
      }
         }
         else{
         alert("해시태그는 5개까지 가능합니다.");
      }
      }else if(!hashtagInsert.includes('#')){
         alert("작성 양식에 어긋납니다.");
      }else{
         alert("해시태그는 1개씩만 등록가능합니다. ")
         $('#hashtagInsert').val("");
      }
   })//click
   if(count==5){
      alert($('#hash').val());
   }
   
/*    $('#amenitiesimg').click(function(){
      var img = document.getElementById("amenitiesimg").src;
      alert(img);
      $('#img').append(img);
      
   }) */
   $('#allDelete').click(function(){
      $('#amenities a').remove();
      $('#amenitiesC').val("");
   })
   
   $('#hashDelete').click(function(){
      
      $('#hashtag').val("");
      
      count = 0;
   })
   
})//function

   
function clickImg(img) {
      if ((document.getElementById("amenitiesC").value).includes(img)) {
            alert("중복선택 불가");
            return false;
         } else {
            var amenities1 = img;
            var amenitiesSubstr = amenities1.substr(7);
            var amenitiesNum = amenitiesSubstr.split('.');
            var amenitiesCArray = document.getElementById("amenitiesC").value.split(',').length;
            if(amenitiesCArray%9 == 0){
               $('#amenities').append('<a href="javascript:deleteimg('+amenitiesNum[0]+')" id="'+amenities1+'" style="width: 40px; height: 40px;">'
                       + '<img src="'+img+'" id="'+amenities1+'" width="35px !important" height="35px !important" style="margin-bottom: 10px;"></img>'
                       + '<img src="' + ${initParam.root} + 'auction/img//x.png" style="margin-left: -25px; display: none;" width="35px !important" height="35px !important"></img></a>'); 
            }
            else{
               $('#amenities').append('<a href="javascript:deleteimg('+amenitiesNum[0]+')" id="'+amenities1+'" style="width: 40px; height: 40px; margin-right: 18px;">'
                       + '<img src="'+img+'" id="'+amenities1+'" width="35px !important" height="35px !important" style="margin-bottom: 10px;"></img>'
                       + '<img src="' + ${initParam.root} + 'auction/img//x.png" style="margin-left: -25px; display: none;" width="35px !important" height="35px !important"></img></a>'); 
            }     
            document.getElementById("amenitiesC").value 
               = document.getElementById("amenitiesC").value + amenities1 + ",";
        }
   }
      function deleteimg(amenitiesNum) {
         var id = "../img/" + amenitiesNum + ".png";
         $('a[id*="' + amenitiesNum +'"]').remove();
         var arrayTemp = document.getElementById("amenitiesC").value.split(',');
         var arrayTempLength = 0;
         for(var i = 0; i < arrayTemp.length-1; i ++ ){
            if(arrayTemp[i] == id){
               arrayTempLength = i;
            }
         }
         arrayTemp.splice(arrayTempLength, 1);   // 특정번째 부터 특정길이만큼 배열의 요소 삭제
         document.getElementById("amenitiesC").value = arrayTemp;
         
      }
      function allDeleteImg() {
         $('#amenities').empty();   // 자식만 삭제
         document.getElementById("amenitiesC").value = "";
      }

</script>
<script type="text/javascript">
 /*       $(function(){
           
          if(${spaceuservo.id==null}){
            location.href="${initParam.root}NewFile1.jsp";
            //$('#loginModal').modal();   
               }
        
          }); */
</script>
</head>

<body>
	<jsp:include page="/header.jsp">
		<jsp:param value="공간등록양식" name="pageName" />
	</jsp:include>

	<div class="container">
		<div class="row">
			<div class="col-sm-8 col-sm-offset-2 text-center"></div>
		</div>
		<div class="divide70"></div>
		<div style="background-color: #f0f0f0">
			<div class="row">
				<div class="col-sm-4"></div>
				<div class="col-sm-7" style="margin-left: 22%">
					<div class="content">
						<form action="${initParam.root}registerSpace.do" method="post"
							id="registerProductForm" name="registerProductForm"
							class="property-submit-form" enctype="multipart/form-data"
							role="form">
							<input type="hidden" value="${param.licence}" name="licence">
							<div class="form-group">

								<input type="hidden" class="form-control" id="category"
									name="category" value="${param.space}" readonly="readonly">
							</div>
							<div class="form-group">
								<label for="label-registerProduct">Type</label> <input
									type="text" class="form-control" id="type" name="type"
									value="${param.type}" readonly="readonly">
							</div>

							<div class="form-group">
								<label for="label-registerProduct">공간 이름</label> <input
									type="text" class="form-control" id="title" name="title"
									required="required" placeholder="">
							</div>

							<div class="form-group">
								<label for="label-registerProduct">공간 상세정보</label>
								<textarea rows="22" cols="40" class="form-control" id="content"
									name="content" placeholder="Content" required="required"
									style="resize: none"></textarea>

							</div>
							<div class="input-group">
								<label for="label-registerProduct">#해시태그</label><br> <input
									type="text" class="form-control" id="hashtagInsert"
									style="width: 500px;" placeholder="예) #파티룸">
								&nbsp;&nbsp;<span><input type="button" id="hashInsert"
									class="btn" value="추가"
									style="height: 80%; background-color: #004b8b; color: white"></span>
								<br> <br> <br>
								<div id="hash"></div>
								<input type="text" class="form-control" id="hashtag"
									name="hashtag" required="required" style="width: 500px;"
									readonly="readonly">&nbsp;&nbsp; <span><input
									type="button" id="hashDelete" class="btn" value="전체삭제"
									style="height: 80%; background-color: #004b8b; color: white"></span>
							</div>
							<div class="form-group" style="margin-top: 15px;">
								<label for="label-registerProduct">시간당 가격</label> <input
									type="text" class="form-control" id="price" name="price"
									placeholder="Price" required="required">
							</div>
							<div class="form-group">
								<label for="label-registerSpaceUser">판매자번호</label> <input
									type="tel" pattern="\d{3}-\d{3,4}-\d{4}" class="form-control"
									id="tel" name="tel"
									placeholder="Tel pattern Example: 123-456-7890 or 123-4567-8901"
									required="required">
							</div>

							<jsp:include page="/uploadForm.jsp" flush="true" />



							<div class="form-group">
								<label for="label-registerProduct">주소</label>

								<div class="input-group">

									<input type="text" class="form-control" name="area"
										id="sample5_address" placeholder="주소" style="width: 522px">
									<span>&nbsp;&nbsp;&nbsp;<input type="button"
										onclick="sample5_execDaumPostcode()" class="btn btn-red"
										value="주소검색"
										style="height: 80%; background-color: #004b8b; color: white"></span>
									<input type="text" class="form-control" name="location"
										id="sample5_address" placeholder="상세주소" style="width: 80%">
								</div>

								<div id="map"
									style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
								<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
								<script
									src="//apis.daum.net/maps/maps3.js?apikey=deee29e47e0b594ed7e364d991e44d1d&libraries=services"></script>
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
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
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
					</div>
					<div class="form-group">
						<label for="label-registerProduct">편의시설</label><br>
						<c:forEach begin="1" end="28" varStatus="i">

							<a href="javascript:clickImg('../img/${i.count}.png')"><img
								src="../img/${i.count}.png" width="50px"></a>&nbsp;&nbsp;&nbsp;
      </c:forEach>
						<br> <br>
						<div class="input-group" style="height: auto;">
							<div id="amenities" class="form-control"
								style="width: 500px; height: auto; min-height: 32px;"></div>
							&nbsp;&nbsp; <span> <input type="button" id="allDelete"
								value="전체삭제" class="btn"
								style="height: 90%; background-color: #004b8b; color: white; width: 90px"
								onclick="allDeleteImg()">
							</span>
						</div>
						<input type="hidden" value="" name="amenitiesC" id="amenitiesC">
					</div>



					<div>
						<h3>이용가능 시간 선택</h3>
						<select id="sTime" name="sTime" style="height: 40px;">
							<option>==========</option>
							<option>01:00</option>
							<option>02:00</option>
							<option>03:00</option>
							<option>04:00</option>
							<option>05:00</option>
							<option>06:00</option>
							<option>07:00</option>
							<option>08:00</option>
							<option>09:00</option>
							<option>10:00</option>
							<option>11:00</option>
							<option>12:00</option>
							<option>13:00</option>
							<option>14:00</option>
							<option>15:00</option>
							<option>16:00</option>
							<option>17:00</option>
							<option>18:00</option>
							<option>19:00</option>
							<option>20:00</option>
							<option>21:00</option>
							<option>22:00</option>
							<option>23:00</option>
							<option>24:00</option>

						</select>&nbsp;&nbsp;~&nbsp;&nbsp; <select id="eTime" name="eTime"
							style="height: 40px;">
							<option>==========</option>
							<option>01:00</option>
							<option>02:00</option>
							<option>03:00</option>
							<option>04:00</option>
							<option>05:00</option>
							<option>06:00</option>
							<option>07:00</option>
							<option>08:00</option>
							<option>09:00</option>
							<option>10:00</option>
							<option>11:00</option>
							<option>12:00</option>
							<option>13:00</option>
							<option>14:00</option>
							<option>15:00</option>
							<option>16:00</option>
							<option>17:00</option>
							<option>18:00</option>
							<option>19:00</option>
							<option>20:00</option>
							<option>21:00</option>
							<option>22:00</option>
							<option>23:00</option>
							<option>24:00</option>
						</select> <br> <br>
					</div>
					<div id="dateSelect"></div>
					<br> <br> <input type="submit" value="작성"
						onsubmit="check()" class="btn"
						style="background-color: #004b8b; color: white"> <input
						type="reset" value="재입력" class="btn"
						style="background-color: #004b8b; color: white">
					<!-- <input type="button" value="회원가입" onclick="checkRegister()">  -->
					</form>
				</div>


			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<jsp:include page="/footer.jsp"></jsp:include>



</body>
</html>

