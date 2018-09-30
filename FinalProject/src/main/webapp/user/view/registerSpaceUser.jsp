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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
      <script>
      $(function(){
    	   $('#id').on('keyup',function(){
    		var id=$(this).val();
    		$.ajax({
    				type:"post",
    				url:"${initParam.root}idCheck.do",
    				data:"id="+id,
    				success:function(data){
    				if(id.length<7){
    					$('#idCheckResultView').html("<font size='0.5em'>아이디는 7자리 이상 입력해주세요.</font>");
    				}else if(id.length>=7 && data.result==0){
    					$('#idCheckResultView').html("<font size='0.5em' color='green'>가입이 가능한 ID입니다.</font>");
    				}else if(id.length>=7 && data.result==1){
    					$('#idCheckResultView').html("<font size='0.5em' color='red'>이미 존재하는 ID입니다.</font>");
    				}
    				}//success
    			})//ajax
    		
    	  })//keyup
    	  
    	//#passSecurityView
    	  $('#pass').on('keyup',function(){
    		  var pass=$('#pass').val();
    		  var passcheck = $('#passcheck');
    		 	if(pass.length>7){
    		 		if(!pass.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/)){
    		 			$('#passSecurityView').html("<font size='0.5em' color='red'>안전하지 않은 비밀번호 조합입니다</font>.")
    		 		}else{
    		 			$('#passSecurityView').html("<font size='0.5em' color='green'>안전.</font>.")
    		 		}
    		 	}else if(pass.length==0){
    		 		$('#passSecurityView').html("<font size='0.5em'>영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 7자이상 입력해주세요.</font>");
    		 	}
    	  })//keyup
    	  //#passcheckResultView
    	  $('#passcheck').on('keyup',function(){
    		  var passcheck = $('#passcheck').val();
    		  var pass=$('#pass').val();
    		  $.ajax({//$('#passcheckResultView').html("<font color='red' size='0.5em'>비밀번호 불일치 재확인 필요</font>");
    			  type:"post",
    			  url:"${initParam.root}passcheck.do",
    			  data:"pass="+pass+"&&passcheck="+passcheck,
    			  success:function(data){
    				  if(pass.length!=0){
    				  if(data.result==0){
    					  $('#passcheckResultView').html("<font color='green' size='0.5em'>비밀번호 일치</font>");
    				  }else if(data.result==1 ){
    					  if(pass.length>passcheck.length&&passcheck.length>0){
    						  $('#passcheckResultView').html("<font color='red' size='0.5em'>비밀번호 불일치 글자수 확인 필요</font>");  
    					  }else if(pass.length==passcheck.length&&passcheck.length>0){
    						  $('#passcheckResultView').html("<font color='red' size='0.5em'>비밀번호 불일치 기입내용 확인필요</font>");
    					  }else if(passcheck.length==0){
        					  $('#passcheckResultView').html("");
    				  }
    				  }
    				  }
    			  }//success
    		  })//ajax
    	  })//keyup
    	  //busiman
    	  $('#busiman').on('click',function(){
    		  $('#radioview').html("사업자 등록 번호 : <input type='text' class='form-control'>");
    		 
    	  })  //change  
    	  $('#nonbusiman').on('click',function(){
    		  
    		  $('#radioview').html("");
    	  });
    	  $('#regi').click(function(){
    		  var il = $('#id').val().length;
    		  var pl = $('pass').val().length;
    		  var regi = document.getElementById("regiForm");
    		  if(il>=7 && pl>=7){
    			  regi.submit();
    		  }
    	  });//click
      });//function
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
.btn-outlined {
    border-radius: 0;
    -webkit-transition: all 0.3s;
       -moz-transition: all 0.3s;
            transition: all 0.3s;
}	
.btn-outlined.btn-info {
    background: none;
    border: 3px solid #5bc0de;
    color: #5bc0de;
}
.btn-outlined.btn-info:hover,
.btn-outlined.btn-info:active {
    color: #FFF;
    background: #39b3d7;
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
</style>     
    </head>
    <body>
	<!-- 헤더 -->
<jsp:include page="../../header.jsp"></jsp:include>
        <div class="divide70"></div>
        <div class="container">
            <div class="row">
                  <div class="col-md-6" style="margin-left: 25%;padding-right: 0">
                    <div class="login-reg-box" style="background-color: #E6E6E6">
                        <h4>회원가입</h4>
                        <form action="${initParam.root}registerUser.do" id="regiForm">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input type="text" class="form-control" name="id" id="id" placeholder="ID" required="required">
                            </div><div id="idCheckResultView"><font size="0.5em">아이디는 7자 이상 입력하세요.</font></div>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input type="text" class="form-control" name="name" id="name" placeholder="Username" required="required">
                            </div><br>
                         
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                <input type="password" class="form-control" id="pass" name="password" placeholder="Password" required="required">
                            </div><div id="passSecurityView"><font size="0.5em">영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 7자이상 입력해주세요.</font></div>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                <input type="password" class="form-control" id="passcheck" name="passwordCheck" placeholder="PasswordCheck" required="required">
                            </div><div id="passcheckResultView"></div><br>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-mobile-phone"></i></span>
                                <input type="text" class="form-control" pattern="\d{3}-\d{3,4}-\d{4}" name="tel" placeholder="Tel(000-000(0000)-0000)">
                            </div><br>
                               <div class="input-group" >
                                <span class="input-group-addon"><i class="fa fa-home"></i></span>
                               <input type="text" class="form-control" name="address1" id="sample5_address" placeholder="주소" style="width:70%"><span><input type="button" onclick="sample5_execDaumPostcode()" class="btn btn-red btn-lg pull-left" value="주소검색" style="height: 90%"></span>
                               <input type="text" class="form-control" name="address2" id="sample5_address" placeholder="상세주소" style="width:70%"></div>
								
                                <div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
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
        <br>
        <div style="margin-left:40%">
        <div class="input-group">
            <label class="radio-inline"><input type="radio" name="crn" id="busiman" value="사업자">사업자</label>
			<label class="radio-inline"><input type="radio" name="crn" id="nonbusiman" value="비사업자">비사업자</label>
		</div>
		
		</div>
		 <div class="input-group">
		<div id="radioview"></div>
		</div>
		<br>
                            <div class="clearfix" style="margin-left: 42%">
                                <br><br><input id="regi" type="submit" class="btn btn-red btn-lg" value="가입하기">
                            </div>
                            <div class="divide20"></div>
                        </form>
                       
                    </div>
   
                </div>
            </div> 
          



        </div>
<div style="height: 50px"></div>
<jsp:include page="../../footer.jsp"></jsp:include>
        <!--scripts and plugins -->
        <!--must need plugin jquery-->
        <script src="${initParam.root }js/jquery.min.js"></script>
        <script src="${initParam.root }js/jquery-migrate.min.js"></script> 
        <!--bootstrap js plugin-->
        <script src="${initParam.root }bootstrap/js/bootstrap.min.js" type="text/javascript"></script>       
        <!--easing plugin for smooth scroll-->
        <script src="${initParam.root }js/jquery.easing.1.3.min.js" type="text/javascript"></script>
        <!--flex slider plugin-->
        <script src="${initParam.root }js/jquery.flexslider-min.js" type="text/javascript"></script>
        <!--sticky header-->
        <script type="text/javascript" src="${initParam.root }js/jquery.sticky.js"></script>
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


    </body>
</html>
