<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
		
		$("#accomodation").val('${auctiontemp.accomodation}');
	    
		var amen = '${auctiontemp.amenities}';
		//var amenSubStr = amen.substr(7); // 여기서 하면 안된다. 배열의 첫번째만 적용된다.
		var amenArray = amen.split(',');
		for (var i = 0; i < amenArray.length-1; i++) {
	        //alert(amenArray[i]);   // ../img/3.png
	        //alert(amenArray[i].substr(7));   // 3.png
	        /* 
			$('#amenitiesDiv').append('<a href="javascript:deleteimg('+amenArray[i]+')" id="'+amenArray[i]+'" style="width: 45px; height: 40px; margin-right: 5px;">'
					+ '<img src="auction/img/'+amenArray[i].substr(7)+'" id="'+amenArray[i]+'" width="30px !important" height="35px !important" style="margin-bottom: 5px;"></img>'
					+ '<img src="' + ${initParam.root} + 'auction/img//x.png"></img></a>');
	        */
			$('#amenitiesDiv').append('<a href="javascript:deleteimg('+amenArray[i]+')" id="'+amenArray[i]+'" style="width: 40px; height: 40px; margin-right: 18px;">'
					+ '<img src="auction/img/'+amenArray[i].substr(7)+'" id="'+amenArray[i]+'" width="35px !important" height="35px !important" style="margin-bottom: 5px;"></img>'
					+ '<img src="' + ${initParam.root} + 'auction/img//x.png" style="margin-left: -25px; display: none;" width="35px !important" height="35px !important"></img></a>');
	        
			document.getElementById("amenities").value 
				= document.getElementById("amenities").value + amenArray[i] + ",";
		}
	      
	      $('a[id*=".png"]').click(function() {
	         
	         //alert($(this).attr('id'));   // 아이디를 찾아서 온다.s
	         var id = $(this).attr('id');
	         
	         $(this).remove();
	         var arrayTemp = document.getElementById("amenities").value.split(',');
	         
	         var arrayTempLength = 0;
	         for(var i = 0; i < arrayTemp.length-1; i ++ ){
	            if(arrayTemp[i] == id){
	               arrayTempLength = i;
	            }
	         }
	         //alert(arrayTempLength);
	         arrayTemp.splice(arrayTempLength, 1);   // 특정번째 부터 특정길이만큼 배열의 요소 삭제
	         //alert(arrayTemp);
	         //alert(arrayTemp.splice(arrayTempLength, 1));
	         //alert(arrayTemp);
	         document.getElementById("amenities").value = arrayTemp;
	         
	      });//click

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
				var c = document.getElementById("accomodation").value;
				$('#accomodation').removeAttr("readonly");
				if(c == '전체인원'){
					$('#accomodation').val(1);
				}else{
					$.ajax({
						type : "post",
						url : "${initParam.root}plus.do",
						data : "cnt=" + c,
						success : function(data) {
							$('#accomodation').val(parseInt(data.d));
						}
					});
				}
			});
			$('#checkAccomodation1').click(function() {
				$('#accomodation').attr("readonly", "readonly");
				$('#accomodation').val("전체인원");
			});
	});	//function
	
	var xhr;
	function crnDelete(newfilename,a_no){
		var abc = newfilename+","+a_no;
		
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = callback;
		xhr.open("get","${initParam.root}fileDelete.do?newfilename="+abc);
		xhr.send(null);
	}//crnDelete
	
	function callback(){
		if(xhr.readyState==4){
			if(xhr.status==200){
				document.getElementById("crnView").innerHTML=
					"<b>사업자등록증 Upload<b><br><input type='file' name='upload'>";
				
			}
		}
	}//callback
	
	function imgDelete(anewfilename,a_no){
		var abc = anewfilename+","+a_no;
		
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = acallback;
		xhr.open("get","${initParam.root}aFileDelete.do?anewfilename="+abc);
		xhr.send(null);
	}//crnDelete
	function acallback(){
		if(xhr.readyState==4){
			if(xhr.status==200){
				document.getElementById("imageView").innerHTML=
					"<b>Image Upload<b><br><input type='file' name='aupload'>";
				
			}
		}
		
	}//callback
</script>
<script type="text/javascript">
function clickImg(img) {
   if ((document.getElementById("amenities").value).includes(img.substr(15))) {
      alert("똑같은거 또 선택하면 안됩니다.`");
      return false;
   } else {
      
      var amenities1 = "../" + img.substr(15);
      //alert(amenities1);   //../img/${i.count}.png
      var amenitiesSubstr = amenities1.substr(7);
      alert(amenitiesSubstr);
      var amenitiesNum = amenitiesSubstr.split('.');
      //alert(amenitiesNum[0] +  " **** " + amenitiesNum[1]);
      /* 
      $('#amenitiesDiv').append('<a href="javascript:deleteimg('+amenitiesNum[0]+')" id="'+amenities1+'" style="width: 45px; height: 40px; margin-right: 5px;">'
                        + '<img src="'+img+'" id="'+amenities1+'" width="30px !important" height="35px !important" style="margin-bottom: 5px;"></img>'
                        + '<img src="' + ${initParam.root} + 'auction/img//x.png"></img></a>');
      */
      $('#amenitiesDiv').append('<a href="javascript:deleteimg('+amenitiesNum[0]+')" id="'+amenities1+'" style="width: 40px; height: 40px; margin-right: 18px;">'
              + '<img src="'+img+'" id="'+amenities1+'" width="35px !important" height="35px !important" style="margin-bottom: 10px;"></img>'
              + '<img src="' + ${initParam.root} + 'auction/img//x.png" style="margin-left: -25px; display: none;" width="35px !important" height="35px !important"></img></a>');
      
      document.getElementById("amenities").value 
         = document.getElementById("amenities").value + amenities1 + ",";
      //alert("document.getElementById(amenities).value ====" + document.getElementById("amenities").value);
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
<!-- header -->
<jsp:include page="/header.jsp"/>
<c:choose>
	<c:when test="${spaceuservo.id == null}">
		<script type="text/javascript">
			alert("로그인을 해주세요");
			location.href = "user/view/login.jsp";
		</script>
	</c:when>
	<c:when test="${spaceuservo.id == 'admin'}">
		<script type="text/javascript">
			alert("관리자는 사용할 수 없는 기능입니다.");
		</script>
	</c:when>
	<c:otherwise>
		<div class="container" style="margin-top: 20px;">
			<div class="row">
				<div class="container">
					<div class="col-lg-2"></div>
					<div class="col-lg-8" >
						<h2 class="section-heading" align="center">내 경매 등록 신청 수정</h2>
						<hr>
						<br>
					</div>
					<div class="col-lg-2"></div>
				</div>
				<div class="container">
					<div class="row" style="width:60%; background-color: #e6e6e6; margin: auto;">
						<div class="container" style="width: 90%;">
					<form action="${initParam.root}updateAuctionTemp.do" method="post" id="updateAuctionTempForm" 
						name="updateAuctionTempForm" class="" enctype="multipart/form-data">
						<br>
						<input type="hidden" id="a_no" name="a_no" value="${param.a_no}">
						<div class="form-group">
							<label for="label-updateAuctionTemp">Title</label>
							<input type="text" class="form-control" id="title" name="title" 
								required="required" value="${auctiontemp.title}">
						</div>
						<div class="form-group">
							<label for="label-updateAuctionTemp">Price</label>
							<input type="text" class="form-control" id="price" name="price" 
								required="required" value="${auctiontemp.price}">
						</div>
						<div class="form-group">
							<label for="label-updateAuctionTemp">Content</label>
							<textarea rows="10" cols="50" name="content" style="resize: none; width: 100%">${auctiontemp.content}</textarea>
						</div>
						<div class="form-group">
							<label for="label-updateAuctionTemp">Area</label>
							<div class="input-group" style="width: 100%;">
								<input type="text" class="form-control" name="area" id="sample5_address" 
									value="${auctiontemp.area}" style="width:78%; margin-right: 7%;">
								<span>
									<input type="button" onclick="sample5_execDaumPostcode()" 
										class="btn btn-red pull-right" value="주소검색" 
										style="height: 100%; color: white;">
								</span>
								<input type="text" class="form-control" name="location" id="sample5_address" 
									value="${auctiontemp.location}" style="width:78%;">
							</div>
							<div id="map" style="width:60%; height:300px; margin-top:10px;"></div>
							<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
								var marker = "";
								var infowindow = "";
								// 주소로 좌표를 검색합니다
								geocoder.addr2coord('${auctiontemp.area}', function(status, result) {
								
								    // 정상적으로 검색이 완료됐으면 
								     if (status === daum.maps.services.Status.OK) {
								        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
								        // 결과값으로 받은 위치를 마커로 표시합니다
								        marker = new daum.maps.Marker({
								            map: map,
								            position: coords
								        });
								        // 인포윈도우로 장소에 대한 설명을 표시합니다
								        infowindow = new daum.maps.InfoWindow({
								            content: '<div style="width:150px;text-align:center;padding:6px 0;">${auctiontemp.title}</div>'
								        });
								        infowindow.open(map, marker);
								        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								        map.setCenter(coords);
								    }else{
								    	var coords = new daum.maps.LatLng(33.450701, 126.570667);
								        // 결과값으로 받은 위치를 마커로 표시합니다
								        marker = new daum.maps.Marker({
								            map: map,
								            position: coords
								        });
								        // 인포윈도우로 장소에 대한 설명을 표시합니다
								        infowindow = new daum.maps.InfoWindow({
								            content: '<div style="width:170px;text-align:center;padding:6px 0;">주소는 제대로 입력하세요</div>'
								        });
								        infowindow.open(map, marker);
								        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								        map.setCenter(coords);
								    }
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
							                        infowindow.close();
							                        infowindow = new daum.maps.InfoWindow({
											            content: '<div style="width:150px;text-align:center;padding:6px 0;">${auctiontemp.title}</div>'
											        });
											        infowindow.open(map, marker);
							                    }
							                });
							            }
							        }).open();
							    }
							</script>
							
						</div>
						<div class="form-group">
							<label for="label-updateAuctionTemp">Tel</label>
							<input type="tel" pattern="\d{3}-\d{3,4}-\d{4}" class="form-control" id="tel" 
								name="tel" placeholder="Tel pattern Example: 123-456-7890 or 123-4567-8901" 
								required="required" value="${auctiontemp.tel}">
						</div>
						<div class="form-group">
							<label for="label-updateAuctionTemp">사업자등록번호</label>
							<input type="text" class="form-control" id="crn" name="crn"  
								 value="${auctiontemp.crn}">
						</div>
						
						<div class="form-group" id="crnView">
							<label for="label-updateAuctionTemp">사업자등록증 Upload</label><br>
					<c:choose>
						<c:when test="${auctiontemp.originfilename==null}">
							<input type="file" name="upload">
						</c:when>
						<c:otherwise>
							<input type="text" class="form-control" value="${auctiontemp.originfilename}" 
								readonly="readonly" style="width: 70%; display: inline-block;">
							<button type="button" class="btn btn-danger pull-right" style="width: 20%;" id="crnBtn" 
								onclick="crnDelete('${auctiontemp.newfilename}','${auctiontemp.a_no}')">파일삭제</button>
							<br><br>
							<img alt="" src="a.crn/${auctiontemp.newfilename}" style="width: 100%;">
						</c:otherwise>
					</c:choose>
						</div>
						
						<div class="form-group" id="imageView">
							<label for="label-updateAuctionTemp">Image Upload</label><br>
					<c:choose>
						<c:when test="${auctiontemp.aoriginfilename==null}">
							<input type="file" name="aupload">
						</c:when>
						<c:otherwise>
							<input type="text" class="form-control" value="${auctiontemp.aoriginfilename}" readonly="readonly"
								style="width: 70%; display: inline-block;">
							<button type="button" class="btn btn-danger pull-right" style="width: 20%;" id="imgBtn" 
								onclick="imgDelete('${auctiontemp.anewfilename}','${auctiontemp.a_no}')">파일삭제</button><br>
							<br>
							<img alt="" src="a.upload/${auctiontemp.anewfilename}" style="width: 100%;">		
						</c:otherwise>
					</c:choose>
						</div>
			
						<div class="form-group">
							<label for="label-updateAuctionTemp">EndDate</label>
							<input type="date" class="form-control" id="enddate" name="enddate" required="required" 
								value="${auctiontemp.enddate}">
						</div>
                        <div class="form-group">
	                        <label for="label-applyAuction">Accomodation</label><br>
	                        <div class="input-group" style="width: 60%; float: left;">
								<span class="input-group-addon" style="width: 10%;">
									<i class="fa fa-arrow-circle-down" id="downAcmo"></i>
								</span>
								<input type="text" id="accomodation" name="accomodation" value="${auctiontemp.accomodation}" 
									style="text-align: center; font-size: 2em" class="form-control" 
									pattern="[0-9]{1,4}" max="9999">
								<span class="input-group-addon" style="width: 10%;">
									<i class="fa fa-arrow-circle-up" id="upAcmo"></i>
								</span>
							</div>
							<button type="button" class="btn btn-red pull-left" id="checkAccomodation1" 
								style="height: 33.3px; margin-left: 2.5%;">전체인원</button>
						</div><br>
						
                        <div class="form-group">
                           <label for="label-applyAuction">Amenities</label>
                           <p>제공가능한 편의 시설은??</p>
                           <div class="form-control" id="amenitiesOutter" style="height: auto;">
                              <c:forEach begin="1" end="28" varStatus="i">
                                 <%-- <a href="javascript:clickImg('../img/${i.count}.png')"><img src="${initParam.root}auction/img/${i.count}.png" width="50px" ></a>&nbsp;&nbsp;&nbsp; --%>
                                 <a href="javascript:clickImg('${initParam.root}auction/img/${i.count}.png')"><img src="${initParam.root}auction/img/${i.count}.png" width="50px" ></a>&nbsp;&nbsp;&nbsp;
                              </c:forEach><br><br>
                              <div class="row" style="margin: auto; height: auto;">
                                 <div id="amenitiesDiv" class="form-control col-xs-11" style="width:80.5%; height: auto;"></div>&nbsp;&nbsp;
                                  <div class="col-xs-1">
                                    <input type="button" id="allDelete" value="전체삭제" class="btn btn-red" 
                                       style=" height:90%; color: white; 
                                       width: 80px;" onclick="allDeleteImg()">
                                 </div>
                              </div>
                           </div>
                        </div>
                        
                        <input type="hidden" value="" name="amenities" id="amenities">
						<input type="hidden" id="originfilename" name="originfilename" value="${auctiontemp.originfilename}">
						<input type="hidden" id="aoriginfilename" name="aoriginfilename" value="${auctiontemp.aoriginfilename}">
						<input type="hidden" id="newfilename" name="newfilename" value="${auctiontemp.newfilename}">
						<input type="hidden" id="anewfilename" name="anewfilename" value="${auctiontemp.anewfilename}">
						<div align="center">
						<input type="submit" class="btn btn-success" value="수정">
						<input type="reset" class="btn btn-warning" value="재입력">
						</div>
					 </form>
					 <br>
					 </div>
				</div> 
			</div>
			</div>
		</div>
	</c:otherwise>
</c:choose>
	<br>
	<br>
<jsp:include page="/footer.jsp"/>
	
</body>
</html>


