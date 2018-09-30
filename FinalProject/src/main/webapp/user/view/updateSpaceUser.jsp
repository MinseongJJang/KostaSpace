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

<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,900,700,500,400italic,300italic,300,100italic,100'
	rel='stylesheet' type='text/css'>

<!-- jquery 이벤트 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>  
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
      $(function(){
    	//#passSecurityView
    	
    	  var originpass = "${spaceuservo.password}";
    	  $('#pass').on('keyup',function(){
    		  var pass=$('#pass').val();
    		  var passcheck = $('#passcheck');
    		 	if(pass.length>=7){
    		 		if(!pass.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/)){
    		 			$('#passSecurityView').html("<font size='0.5em' color='red'>안전하지 않은 비밀번호 조합입니다</font>.")
    		 		}else if(pass==originpass && pass.length == originpass.length){
    		 			$('#passSecurityView').html("<font size='0.5em' color='green'>이전 비밀번호와 동일합니다. 보안상 확인해주세요.</font>.")
    		 		}else{
    		 			$('#passSecurityView').html("<font size='0.5em' color='green'>안전.</font>.")
    		 		}
    		 	}else if(pass.length==0){
    		 		$('#passSecurityView').html("<font size='0.5em'>영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 7자이상 입력해주세요.</font>");
    		 	}
    	  });//keyup
    	
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
    	//changeFormResultView 는 써질곳/./changeAddress이벤트 해당
    	  $('#changeAddress').on('click',function(){
    		 $('#changeFormResultView').html("<span><input type='button' onclick='sample5_execDaumPostcode()' class='btn btn-red btn-lg pull-left' value='주소검색' style='height: 90%'></span><input type='text' class='form-control' name='address2' id='sample5_address' placeholder='상세주소' style='width:70%'></div><div id='map' style='width:300px;height:300px;margin-top:10px;display:none'></div>");
    	  });
    	  //busiman
    	  $('#busiman').on('click',function(){
    		  $('#radioview').html("사업자 등록 번호 : <input type='text' class='form-control'>");
    		 
    	  })  //change  
    	  $('#nonbusiman').on('click',function(){
    		  
    		  $('#radioview').html("");
    	  });
    	  $('#regi').click(function(){
    		  var il = $('#id').val().length;
    		  var pl = $('#pass').val().length;
    		  var regi = document.getElementById("updateForm");
    		  if(il>=7 && pl>=7 && originpass!=$('#pass').val()){
    			  update.submit();
    		  }
    	  });//click
    	  
      });//function
      </script>
<script type="text/javascript">
       $(function(){
           
          if(${spaceuservo.id==null}){
            location.href="${initParam.root}NewFile1.jsp";
            //$('#loginModal').modal();   
               }
        
          });
</script>
</head>
<body>
<jsp:include page="/header.jsp"><jsp:param value="개인정보수정" name="pageName"/></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-md-6" style="margin-left: 25%; padding-right: 0">
				<div class="login-reg-box">
					<h4>회원정보수정</h4>
					<form action="${initParam.root}updateUser.do" id="updateForm">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-user"></i></span>
							<input type="text" class="form-control" name="id" id="id"
								value="${spaceuservo.id }" readonly="readonly">
						</div>
						<br>
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-user"></i></span>
							<input type="text" class="form-control" name="name" id="name"
								value="${spaceuservo.name }" required="required">
						</div>
						<br>

						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-lock"></i></span>
							<input type="password" class="form-control" id="pass"
								name="password" placeholder="이전 비밀번호와 다르게 입력하세요."
								required="required">
						</div>
						<div id="passSecurityView">
							<font size="0.5em">영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만
								허용)를 혼용하여 7자이상 입력해주세요.</font>
						</div>
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-lock"></i></span>
							<input type="password" class="form-control" id="passcheck"
								name="passwordCheck" placeholder="PasswordCheck"
								required="required">
						</div>
						<div id="passcheckResultView"></div>
						<br>
						<div class="input-group">
							<span class="input-group-addon"><i
								class="fa fa-mobile-phone"></i></span> <input type="text"
								class="form-control" pattern="\d{3}-\d{3,4}-\d{4}" name="tel"
								value="${spaceuservo.tel }">
						</div>
						<br>
						<div class="input-group">
							<span class="input-group-addon" ><i class="fa fa-home"></i></span>
							<input type="text" class="form-control" name="address1" id="sample5_address" 
								value="${spaceuservo.address }" style="width:70%"><span id="changeFormResultView">
							<input type="button" id="changeAddress" class="btn btn-red btn-lg"
								value="주소변경"></span>
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
               
                var fullAddr = data.address;
                var extraAddr = ''; 

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
						<br>
						<div style="margin-left: 40%">
							<div class="input-group">
								<label class="radio-inline"><input type="radio"
									name="crn" id="busiman" value="사업자">사업자</label> <label
									class="radio-inline"><input type="radio" name="crn"
									id="nonbusiman" value="비사업자">비사업자</label>
							</div>

						</div>
						<div class="input-group">
							<div id="radioview"></div>
						</div>
						<br>
						<div class="clearfix" style="margin-left: 36%">
							<br>
							<br>
							<input id="update" type="submit"
								class="btn btn-red btn-lg pull-left" value="수정하기">
							&nbsp;&nbsp;<input id="cancle" type="button"
								class="btn btn-red btn-lg" value="취소하기">
						</div>
						<div class="divide20"></div>
					</form>

				</div>

			</div>
		</div>
</div>


<jsp:include page="/footer.jsp"></jsp:include>


</body>
</html>
