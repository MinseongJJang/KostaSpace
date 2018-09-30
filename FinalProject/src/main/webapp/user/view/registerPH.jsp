<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Insert title here</title>
<style type="text/css">
	#point{
		size : 50%;
		padding: 30%;
	}
</style>

<script type="text/javascript"
   src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>


<script>

   $(function() {
     
      
      
      $('#turnover').keyup(function(){
    	  
    	  var turnover = $('#turnover').val();
    	  
    	  if(turnover==""){
			  $('#aterCharge').html("충전후  ");
			  return false;
		  }
    	  $.ajax({
    		  type : "post",
    		  url : "${initParam.root}afterCharge.do",
    		  data : "point="+${point}+"&&turnover="+$('#turnover').val(),
    		  success:function(data){
    			  
    			  $('#aterCharge').html("충전후  " + data.sumPoint+"P");
    			 
    		  }
    		  
    	  });//ajax
      })//onkeyup;
    	  
     
   });
</script>
<script type="text/javascript">
function charge(){
var IMP = window.IMP; // 생략가능
IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
IMP.request_pay({
    pg : 'inicis', // version 1.1.0부터 지원.
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명:결제테스트',
    amount : 14000,
    buyer_email : 'iamport@siot.do',
    buyer_name : '구매자이름',
    buyer_tel : '010-1234-5678',
    buyer_addr : '서울특별시 강남구 삼성동',
    buyer_postcode : '123-456',
    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
        
    }
   	alert(msg);
});
}
	function registerPointHistory(text){
		var point = document.getElementById("turnover").value;
		
		if(point==''){
			alert("충전할 금액을 입력해주세요!!");
			return false;
		}
		location.href="${initParam.root}registerPointHistory.do?category=충전&&point="+point+"&&kind="+text;
	}
	function registerPointHistory2(text){
		var turnover = document.getElementById("turnover2").value;
		var point = ${spaceuservo.point};
		
		if(turnover=='' ){
			alert("환전할 금액을 입력해주세요!!");
			return false;
		}else if(point < turnover){
			alert("보유한 포인트보다 많습니다!!");
		}else{
		location.href="${initParam.root}registerPointHistory.do?category=환전&&point="+point+"&&kind="+text;
		}
	}

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
<jsp:include page="/header.jsp"><jsp:param value="내 포인트 관리 / 내역" name="pageName"/></jsp:include>

   <!-- ==================================content================================== -->
<div id="content">
	<div id="tabs">
	<br><br><br>
    <div style="border: 1px solid #F6F6F6; text-align: center; width: 40%;
    	margin-left: 30%; background-color: #fed733; color: #004b8b;">
	    <h2 style="color: #004b8b; margin-top: 40px;">보유 포인트  <b>${point} </b>
	    	<img src="${initParam.root}img/point2.png" style="width: 50px;margin-bottom: 7px;">
	    </h2>
    </div>
    <br><br><br>
    
    <div class="row" style="margin-left: 30%; font-size: 25px; text-align: center;">
   		<div class="col-sm-4" style="border: 1px solid; width: 15%; font-family: 'Jeju Gothic';">
   			<a data-toggle="modal" data-target="#charge">충전하기</a></div>
   		<div class="col-sm-4" style="border: 1px solid; width: 15%; margin-left: 5.7%; font-family: 'Jeju Gothic';">
   			<a href="javascript:charge()">충전하기</a></div>
    	<div class="col-sm-4" style="border: 1px solid; width: 15%; margin-left: 5.7%; font-family: 'Jeju Gothic';">
    		<a data-toggle="modal" data-target="#recharge">환전하기</a></div>
    </div>
    <br><br><br>
    
     <div class="modal fade" id="charge" role="dialog">
      <div class="modal-dialog">

         <!-- Modal content-->
         <div class="modal-content" style="background-color: #F6F6F6;">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title" style="background-color: #004b8b; color: white; text-align: center;">
               <img alt="" src="${initParam.root}img/logo.png"><br><br>
               	포인트 충전</h4> 	
            </div>
            <div class="modal-body" style=" width: 70%;">
            	<!-- 첫번째영역 -->
				<div style="background-color: white; width: 400px; height: 50px; border: 1px solid #e0e0e0; margin-left: 23%;">
					<img alt="" src="${initParam.root}img/point2.png" style="width: 30px; margin-left:10%;">
					충전할 금액 &nbsp;&nbsp;&nbsp;
					<input type="text" id="turnover" name="turnover" required="required" placeholder="금액을 입력해주세요"
					style="margin-top: 10px; width: 200px; height: 30px;">
				</div>
				<!-- 두번째영역 -->
				<div style="background-color: white; width: 400px; height: 50px; border: 1px solid #e0e0e0; margin-left: 23%; margin-top: 15px;">
               		<div class="col-sm-6" style="border-right: 1px solid #e0e0e0; height: 50px;">
               			<div style="line-height: 50px; text-align: center; font-size: 17px;">충전전 ${point}P</div>
               		</div>
               		<div class="col-sm-6" id="aterCharge" style="line-height: 50px; text-align: center; font-size: 17px;"></div>					
				</div>
				
				<div style="background-color: white; width: 400px; height: 73px; border: 1px solid #e0e0e0;margin-left:23%; margin-top: 15px;">
					<ul class="nav nav-tabs">
					    <li class="nav-item" style="margin-left: 22px;">
					        <a id="item1" data-toggle="tab" href="#panel31">카드결제<br>
					        <i class="fa fa-credit-card" style="font-size:26px;margin-left: 12px;margin-top: 4px;"></i></a>
					    </li>
					    <li class="nav-item">
					        <a id="item2" data-toggle="tab" href="#panel32">계좌이체<br>
					        <i class="material-icons" style="font-size:26px;margin-left: 12px">payment</i></a>
					    </li>
					    <li class="nav-item">
					        <a id="item2" data-toggle="tab" href="#panel33">휴대폰<br>
					        <i class="material-icons" style="font-size:26px;margin-left: 8px">stay_primary_portrait</i></a>
					    </li>
					    <li class="nav-item">
					        <a id="item2" data-toggle="tab" href="#panel34">상품권결제<br>
					        <i class="material-icons" style="font-size:26px;margin-left: 17px">chrome_reader_mode</i></a>
					    </li>					    
					</ul>				
				</div>				
				<div class="tab-content">
					<div class="tab-pane fade" id="panel31" role="tabpanel">
						<div style="background-color: white; width: 400px; height: 130px; border: 1px solid #e0e0e0; margin-left: 23%; margin-top: 15px;">
	               			<div style=" text-align: center; font-size: 12px;width: 80px; height:40px; line-height:40px; margin-top:15px; margin-right:5px; float: left; margin-left: 32px; border: 1px solid #e0e0e0;">
			               		<a data-toggle="modal" data-target="#card">신한카드</a>
	               			</div>
	               			<div style=" text-align: center; font-size: 12px;width: 80px; height:40px; line-height:40px; margin-top:15px; margin-right:5px; float: left; border: 1px solid #e0e0e0;">
			               		<a data-toggle="modal" data-target="#card">삼성카드</a>
	               			</div>
	               			<div style=" text-align: center; font-size: 12px;width: 80px; height:40px; line-height:40px; margin-top:15px; margin-right:5px; float: left; border: 1px solid #e0e0e0;">
			               		<a data-toggle="modal" data-target="#card">롯데카드</a>
	               			</div>
	               			<div style=" text-align: center; font-size: 12px;width: 80px; height:40px; line-height:40px; margin-top:15px; margin-right:5px; float: left; border: 1px solid #e0e0e0;">
			               		<a data-toggle="modal" data-target="#card">국민카드</a>
	               			</div>
	               			<div style=" text-align: center; font-size: 12px;width: 80px; height:40px; line-height:40px; margin-top:15px; margin-right:5px; float: left; margin-left: 32px; border: 1px solid #e0e0e0;">
			               		<a data-toggle="modal" data-target="#card">농협카드</a>
	               			</div>               			
	               			<div style=" text-align: center; font-size: 12px;width: 80px; height:40px; line-height:40px; margin-top:15px; margin-right:5px; float: left; border: 1px solid #e0e0e0;">
			               		<a data-toggle="modal" data-target="#card">현대카드</a>
	               			</div>                    			
	               			<div style=" text-align: center; font-size: 12px;width: 80px; height:40px; line-height:40px; margin-top:15px; margin-right:5px; float: left; border: 1px solid #e0e0e0;">
			               		<a data-toggle="modal" data-target="#card">비씨카드</a>
	               			</div> 
	               			<div style=" text-align: center; font-size: 12px;width: 80px; height:40px; line-height:40px; margin-top:15px; margin-right:5px; float: left; border: 1px solid #e0e0e0;">
			               		<a data-toggle="modal" data-target="#card">하나카드</a>
	               			</div>                       			
						</div>
					</div>
					<!-- panel31끝 -->
					
					<div class="tab-pane fade" id="panel32" role="tabpanel">
						<div style="background-color: white; width: 400px; height: 130px; border: 1px solid #e0e0e0; margin-left: 23%; margin-top: 15px;">
	               			<div style=" text-align: center; font-size: 12px;width: 80px; height:40px; line-height:40px; margin-top:15px; margin-right:5px; float: left; margin-left: 32px; border: 1px solid #e0e0e0;">
			               		<a data-toggle="modal" data-target="#account">신한은행</a>
	               			</div>
	               			<div style=" text-align: center; font-size: 12px;width: 80px; height:40px; line-height:40px; margin-top:15px; margin-right:5px; float: left; border: 1px solid #e0e0e0;">
			               		<a data-toggle="modal" data-target="#account">국민은행</a>
	               			</div>
	               			<div style=" text-align: center; font-size: 12px;width: 80px; height:40px; line-height:40px; margin-top:15px; margin-right:5px; float: left; border: 1px solid #e0e0e0;">
			               		<a data-toggle="modal" data-target="#account">우리은행</a>
	               			</div>
	               			<div style=" text-align: center; font-size: 12px;width: 80px; height:40px; line-height:40px; margin-top:15px; margin-right:5px; float: left; border: 1px solid #e0e0e0;">
			               		<a data-toggle="modal" data-target="#account">NH농협</a>
	               			</div>
	               			<div style=" text-align: center; font-size: 12px;width: 80px; height:40px; line-height:40px; margin-top:15px; margin-right:5px; float: left; margin-left: 32px; border: 1px solid #e0e0e0;">
			               		<a data-toggle="modal" data-target="#account">기업은행</a>
	               			</div>               			
	               			<div style=" text-align: center; font-size: 12px;width: 80px; height:40px; line-height:40px; margin-top:15px; margin-right:5px; float: left; border: 1px solid #e0e0e0;">
			               		<a data-toggle="modal" data-target="#account">SC은행</a>
	               			</div>                    			
	               			<div style=" text-align: center; font-size: 12px;width: 80px; height:40px; line-height:40px; margin-top:15px; margin-right:5px; float: left; border: 1px solid #e0e0e0;">
			               		<a data-toggle="modal" data-target="#account">수협은행</a>
	               			</div> 
	               			<div style=" text-align: center; font-size: 12px;width: 80px; height:40px; line-height:40px; margin-top:15px; margin-right:5px; float: left; border: 1px solid #e0e0e0;">
			               		<a data-toggle="modal" data-target="#account">우체국</a>
	               			</div>  
						</div>
					</div>
					<!-- panel32끝 -->
					
					<div class="tab-pane fade" id="panel33" role="tabpanel">
						<div style="background-color: white; width: 400px; height: 80px; border: 1px solid #e0e0e0; margin-left: 23%; margin-top: 15px;">
	               			<div style=" text-align: center; font-size: 12px;width: 80px; height:40px; line-height:40px; margin-top:15px; margin-right:5px; float: left; margin-left: 32px; border: 1px solid #e0e0e0;">
			               		<a data-toggle="modal" data-target="#telephone">SK</a>
	               			</div>
	               			<div style=" text-align: center; font-size: 12px;width: 80px; height:40px; line-height:40px; margin-top:15px; margin-right:5px; float: left; border: 1px solid #e0e0e0;">
			               		<a data-toggle="modal" data-target="#telephone">KT</a>
	               			</div>
	               			<div style=" text-align: center; font-size: 12px;width: 80px; height:40px; line-height:40px; margin-top:15px; margin-right:5px; float: left; border: 1px solid #e0e0e0;">
			               		<a data-toggle="modal" data-target="#telephone">LGU+</a>
	               			</div>
	               			<div style=" text-align: center; font-size: 12px;width: 80px; height:40px; line-height:40px; margin-top:15px; margin-right:5px; float: left; border: 1px solid #e0e0e0;">
			               		<a data-toggle="modal" data-target="#telephone">알뜰폰</a>
	               			</div>
						</div>
					</div>
					<!-- panel33끝 -->	
									
					<div class="tab-pane fade" id="panel34" role="tabpanel">
						<div style="background-color: white; width: 400px; height: 80px; border: 1px solid #e0e0e0; margin-left: 23%; margin-top: 15px;">
	               			<div style=" text-align: center; font-size: 12px;width: 80px; height:40px; line-height:40px; margin-top:15px; margin-right:5px; float: left; margin-left: 32px; border: 1px solid #e0e0e0;">
			               		<a data-toggle="modal" data-target="#deposit">문화상품권</a>
	               			</div>
	               			<div style=" text-align: center; font-size: 12px;width: 80px; height:40px; line-height:40px; margin-top:15px; margin-right:5px; float: left; border: 1px solid #e0e0e0;">
			               		<a data-toggle="modal" data-target="#deposit">도서상품권</a>
	               			</div>
  
						</div>
					</div>
					<!-- panel34끝 -->
										
				</div>
				<!-- tab-content -->
		
			
			</div>
			<!-- modal-body 끝 -->
				
				
				<!-- 세번째영역 -->
<!-- 				<div style="background-color: white; width: 400px; height: 80px; border: 1px solid #e0e0e0; margin-left: 23%; margin-top: 15px;">
               		<div class="col-sm-3" style="border-right: 1px solid #e0e0e0;">
               			<div style="line-height: 40px; text-align: center; font-size: 15px;">
		               		<a data-toggle="modal" data-target="#card">카드결제
		               		<i class="fa fa-credit-card" style="font-size:30px"></i></a>               			
               			</div>
               		</div>
               		<div class="col-sm-3" style="border-right: 1px solid #e0e0e0;">
               			<div style="line-height: 40px; text-align: center; font-size: 15px;">
		               		<a data-toggle="modal" data-target="#account">계좌이체
		               		<i class="fa fa-credit-card" style="font-size:30px"></i></a>               			
               			</div>
               		</div>
               		<div class="col-sm-3" style="border-right: 1px solid #e0e0e0;">
               			<div style="line-height: 40px; text-align: center; font-size: 15px;">
		               		<a data-toggle="modal" data-target="#telephone">휴대폰
		               		<i class="fa fa-credit-card" style="font-size:30px"></i></a>               			
               			</div>
               		</div>               		
               		<div class="col-sm-3" style="border-right: 1px solid #e0e0e0;">
               			<div style="line-height: 40px; text-align: center; font-size: 15px;">
		               		<a data-toggle="modal" data-target="#deposit">무통장
		               		<i class="fa fa-credit-card" style="font-size:30px"></i></a>               			
               			</div>
               		</div>               		
               		              		
				</div>   -->             	
               <br><br>
               
               		<div style="margin-left: 47%; margin-bottom: 15px;">
               		<br><br>
               		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
               		</div>
            </div>
            <div class="modal-footer">
               
            </div>
         </div>

      </div>
   </div>
   <div class="modal fade" id="card" role="dialog">
	   <div class="modal-dialog">
	   		 <div class="modal-content">
	   		 	<div class="modal-header">
	   		 		<button type="button" class="close" data-dismiss="modal">&times;</button>
              		<h4 class="modal-title">카드결제</h4>
	   		 	</div>
	   		 	<div class="modal-body" style=" width: 70%">
	   		 		카드번호 :
	   		 		<input type="text" required="required" maxlength="4" size="4" style="width: 70px; height: 30px; font-size: 15px; text-align: center;"> -
	   		 		<input type="password" required="required" maxlength="4" size="4" style="width: 70px; height: 30px; font-size: 15px; text-align: center;"> -
	   		 		<input type="password" required="required" maxlength="4" size="4" style="width: 70px; height: 30px; font-size: 15px; text-align: center;"> -
	   		 		<input type="text" required="required" maxlength="4" size="4" style="width: 70px; height: 30px; font-size: 15px; text-align: center;">
	   		 	</div>
	   		 	<div class="modal-body" style=" width: 70%">
	   		 		유효기간 :
	   		 		<input type="text" required="required" maxlength="4" size="4" style="width: 70px; height: 30px; font-size: 15px; text-align: center;">
	   		 		예) 0315 (03월15년)
	   		 	</div>	 
	   		 	<div class="modal-body" style=" width: 70%">
	   		 		CVC :
	   		 		<input type="password" required="required" maxlength="3" size="3" style="width: 70px; height: 30px; font-size: 15px; text-align: center;">
	   		 		카드뒷면 3자리
	   		 	</div>
	   		 	<div class="modal-body" style=" width: 70%">
	   		 		비밀번호 :
	   		 		<input type="password" required="required" maxlength="2" size="2" style="width: 70px; height: 30px; font-size: 15px; text-align: center;">
	   		 		● ● 앞 2자리
	   		 	</div>		   		 		   		 	  		 	
	   		 	<div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal" onclick="registerPointHistory('카드결제')" style="background-color: #004b8b; color: white;">
               	충전하기+</button>
            </div>
	   		 </div>
	   </div>
   
   </div>
    <div class="modal fade" id="account" role="dialog">
	   <div class="modal-dialog">
	   		 <div class="modal-content">
	   		 	<div class="modal-header">
	   		 		<button type="button" class="close" data-dismiss="modal">&times;</button>
              		<h4 class="modal-title">계좌이체</h4>
	   		 	</div>

	   		 	<div class="modal-body" style=" width: 75%">
	   		 		계좌번호 :
	   		 		<input type="text" required="required" style="width: 200px; height: 30px; font-size: 15px; text-align: center;">
	   		 		- (구분선) 없이 입력
	   		 	</div>	   		 	
	   		 	<div class="modal-body" style=" width: 75%">
	   		 		입금자명 : 
	   		 		<input type="text" required="required" style="width: 200px; height: 30px; font-size: 15px; text-align: center;">
	   		 		예) 홍길동(실명)
	   		 	</div>	   		 	
	   		 	
	   		 	<div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="registerPointHistory('계좌이체')" style="background-color: #004b8b; color: white;">
               	충전하기+</button>
            </div>
	   		 </div>
	   </div>
   
   </div>
   <div class="modal fade" id="telephone" role="dialog">
	   <div class="modal-dialog">
	   		 <div class="modal-content">
	   		 	<div class="modal-header">
	   		 		<button type="button" class="close" data-dismiss="modal">&times;</button>
              		<h4 class="modal-title">휴대폰결제</h4>
	   		 	</div>
	   		 	<div class="modal-body" style=" width: 70%">

	   		 		휴대폰번호 : 
					<input type="text" required="required" maxlength="3" size="3" style="width: 70px; height: 30px; font-size: 15px; text-align: center;"> -
					<input type="text" required="required" maxlength="4" size="4" style="width: 70px; height: 30px; font-size: 15px; text-align: center;"> -
					<input type="text" required="required" maxlength="4" size="4" style="width: 70px; height: 30px; font-size: 15px; text-align: center;">
	   		 	</div>
	   		 	<div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal"onclick="registerPointHistory('휴대폰결제')" style="background-color: #004b8b; color: white;">
               	충전하기+</button>
            </div>
	   		 </div>
	   </div>
   
   </div>
   <div class="modal fade" id="deposit" role="dialog">
	   <div class="modal-dialog">
	   		 <div class="modal-content">
	   		 	<div class="modal-header">
	   		 		<button type="button" class="close" data-dismiss="modal">&times;</button>
              		<h4 class="modal-title">상품권결제</h4>
	   		 	</div>
	   		 	<div class="modal-body" style=" width: 90%">
					상품권번호 : 
					<input type="text" required="required" maxlength="4" size="4" style="width: 70px; height: 30px; font-size: 15px; text-align: center;"> -
					<input type="text" required="required" maxlength="4" size="4" style="width: 70px; height: 30px; font-size: 15px; text-align: center;"> -
					<input type="text" required="required" maxlength="4" size="4" style="width: 70px; height: 30px; font-size: 15px; text-align: center;"> -
					<input type="password" required="required" placeholder="마지막 6자리" maxlength="6" size="6" style="width: 100px; height: 30px; font-size: 15px; text-align: center;">
	   		 		
	   		 	</div>
	   		 	<div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal"onclick="registerPointHistory('상품권결제')" style="background-color: #004b8b; color: white;">
               	충전하기+</button>
            </div>
	   		 </div>
	   </div>
   
   </div>
         
		
         <div id="tabs-2">
            <div>
            <form action="${initParam.root}registerPointHistory.do?category=recharge" method="post" >
            	
            	
            </form>
            </div>
         </div>

      </div>
  
    <div class="modal fade" id="recharge" role="dialog">
      <div class="modal-dialog">
    <!-- Modal content-->
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title" style="background-color: #004b8b; color: white; text-align: center;">
               <img alt="" src="${initParam.root}img/logo.png"><br><br>
               	포인트 환전</h4> 	
            </div>
            <div class="modal-body" style=" width: 70%; margin-left: 25%;">
               <p>환전할 금액  &nbsp;&nbsp;&nbsp;<input type="text" id="turnover2" name="turnover" required="required" placeholder="금액을 입력해주세요"></p>
               <p>계좌번호 입력 &nbsp;&nbsp;&nbsp;</p>
               <select >
               		<option>우리은행</option>
               		<option>국민은행</option>
               		<option>농협</option>
               		<option>외환은행</option>
               		<option>신한은행</option>
               		
               </select><br><br>
               <input type="text" required="required" placeholder="계좌번호를 입력하세요. (- 제외 )" size="30">
               <br><br>
              
               		<div style="margin-left: 22%">
               		<br><br>
               		<input type="button" value=" - 환전하기" onclick="registerPointHistory2('입력계좌로 환전')">
               		</div>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            </div>
         </div>
           </div>
   </div>
   <div class="row">          
   <div class="col-sm-4"></div>
   <div class="col-sm-4">
   <div style="background-color: #fed733; text-align: center; height: 40px;"><h4 style="line-height: 40px;">포인트 거래내역</h4></div>
  <table class="table table-hover" id="point" >
    <thead>
      <tr style="background-color: #e6e6e6;">
        <th>일시</th>
        <th>내용</th>
        <th>가격</th>
        <th>비고(결제방식)</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${phlist}" var="phlist">
      <tr style="background-color: #f0f0f0;">
        <td>${phlist.phDate}</td>
        <td>${phlist.category}</td>
        <td>${phlist.turnover}</td>
        <td>${phlist.kind}</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
  </div>
    <div class="col-sm-4"></div>
</div>

   <!-- 회원탈퇴모달 -->

   <div class="modal fade" id="myModal" role="dialog">
      <div class="modal-dialog">

         <!-- Modal content-->
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
                           location.href = "${initParam.root}deleteUser.do?id="+${spaceuservo.id};
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
   <!-- ==================================footer================================== -->
<jsp:include page="/footer.jsp"/>
</body>
</html>




