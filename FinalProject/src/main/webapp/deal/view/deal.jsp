<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>assan - Real Estate</title>

<!-- Bootstrap -->
<link href="${initParam.root }bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- custom css  -->
<link href="${initParam.root }css/real-estate.css" rel="stylesheet" type="text/css"
	media="screen">
<!-- font awesome for icons -->
<link href="${initParam.root }font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,900,700,500,400italic,300italic,300,100italic,100'
	rel='stylesheet' type='text/css'>
<!--owl carousel css-->
<link href="${initParam.root }owl-carousel/assets/owl.carousel.css" rel="stylesheet"
	type="text/css" media="screen">
<link href="${initParam.root }owl-carousel/assets/owl.theme.default.css" rel="stylesheet"
	type="text/css" media="screen">
<!--mega menu -->
<link href="${initParam.root }css/yamm.css" rel="stylesheet" type="text/css">
<link href="${initParam.root }css/select.css" rel="stylesheet" type="text/css">
<!--Revolution slider css-->
<link href="${initParam.root }rs-plugin/css/settings.css" rel="stylesheet" type="text/css"
	media="screen">
<link href="${initParam.root }css/rev-style.css" rel="stylesheet" type="text/css"
	media="screen">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
       $(function(){
           
          if(${spaceuservo.id==null}){
            location.href="${initParam.root}NewFile1.jsp";
            //$('#loginModal').modal();   
               }
        
          });
</script>	

<script>
$(function() {
   $('#cancle').on('click',function(){
	   $.ajax({
		   type:"post",
		   url:"${initParam.root}deleteDeal.do",
		   data:"dNo="+${deal.d_no},
		   success:function(data){
			   if(data.deal==null){
				   
				  $('#ddresult').append("<font color='blue'><strong>예약이 취소되었습니다. 메인화면으로 돌아갑니다.</strong></font>");
				  alert(datd.d);
				  return true;
				   location.href="${initParam.root}home.jsp"
					
			   }
			  
			   
		   }
	   });
   })
});//function
</script>
</head>
<body>
	<jsp:include page="../../header.jsp"></jsp:include>
	<div class="divide70"></div>
	<c:choose>
	<c:when test="${spaceuservo==null }">
	<script type="text/javascript">
	location.href="${initParam.root}home.jsp"
	</script>
	</c:when>
	<c:when test="${spaceuservo.id==deal.bId }">
	<div class="container">
		<div class="row">
		<div class="col-md-9"  style="margin-left: 25%">
			<div class="row property-listing">
				<div class="col-sm-4 margin30">
					<div class="image">
						<div class="content">
							<a href="#"><i class="fa fa-search-plus"></i></a> <img
								src="${initParam.root }p.upload/${pvo.newfilename}" class="img-responsive" alt="propety">

						</div>
						<!--content-->
					</div>
					<!--image-->
				</div>
				<!--image col-->
				<div class="col-sm-8">
					<h3>
					거래 내용 확인 
					</h3><br><br>
					<form action="${initParam.root }reserveOk.do" method="post" name="reserveFrm">
					 <input type="hidden" name="dNo" value="${deal.d_no}">
					<p><b>거래번호 : ${deal.d_no}</b>
					<p><b>Title :</b> ${deal.title} </p>
					<p><b>예약정보(예약일 / 예약시간)</b></p>
					<p>${deal.resDate} / ${deal.resTime} </p>
					<p><b>가 격 :</b> ${deal.price }</p>
					<p><b>판매자 정보( ID / 전화번호 )</b></p>
					<p>${deal.sId } / ${deal.sTel }</p>
					<c:if test="${deal.bState=='0' }">
					<input type="hidden" name="bstate" value="1">
        			<input type="hidden" name="sstate" value="0">
					<input type="submit" value="구매확정" class="btn btn-red btn-lg pull-left" id="bok"><input type="button" data-toggle="modal" data-target="#cancleModal" id="cancle" value="취소하기" class="btn btn-red btn-lg" style="margin-left:10%">
					</c:if>
					<c:if test="${deal.bState=='1' && deal.sState=='0'}">
					<input type="button" value="판매자 승인대기" class="btn btn-red btn-lg pull-left"readonly="readonly">
					</c:if>
					<c:if test="${deal.bState=='1' && deal.sState=='1' }">
					<input type="button" value="예약확정" class="btn btn-red btn-lg pull-left" readonly="readonly">
					</c:if>
					
					</form>
				</div>
			</div>
			<!--property listing row-->
			<div class="clearfix margin20"></div>
			
			</div>

			<!--all property row-->
			<div class="divide50"></div>
		
		</div>
	</div>
	<div id="cancleModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">예약취소</h4>
				</div>
				<div class="modal-body">
					<p>
						<label id="ddresult"></label>
					</p>
				</div>
				<div class="modal-footer">
					<form action="${initParam.root }home.jsp">
					<input type="submit" class="btn btn-default"  value="닫기">
					</form>
				</div>
			</div>
		</div>
	</div>
	</c:when>
	
	<c:when test="${spaceuservo.id==deal.sId }">
	<div class="container">
		<div class="row">
		<div class="col-md-9"  style="margin-left: 25%">
			<div class="row property-listing">
				<div class="col-sm-4 margin30">
					<div class="image">
						<div class="content">
							<a href="#"><i class="fa fa-search-plus"></i></a> <img
								src="../../p.upload/${pvo.newfilename}" class="img-responsive" alt="propety">

						</div>
						<!--content-->
					</div>
					<!--image-->
				</div>
				<!--image col-->
				<div class="col-sm-8">
					<h3>
					거래 내용 확인 
					</h3><br><br>
					<form action="${initParam.root }reserveOk.do" method="post">
					<input type="hidden" name="dNo" value="${deal.d_no}">
					<p><b>Title :</b> ${deal.title} </p>
					<p><b>예약정보(예약일 / 예약시간)</b></p>
					<p>${deal.resDate} / ${deal.resTime} </p>
					<p><b>가 격 :</b> ${deal.price }</p>
					<p><b>구매자 정보( ID / 전화번호 )</b></p>
					<p>${deal.bId } / ${deal.bTel }</p>
					<c:if test="${deal.sState=='0' }">
					     <input type="hidden" name="sstate" value="1">
        				 <input type="hidden" name="bstate" value="0">
					<input type="submit" value="판매확정" class="btn btn-red btn-lg pull-left" id="sok"><input type="button" data-toggle="modal" data-target="#cancleModal"  id="cancle" value="취소하기" class="btn btn-red btn-lg"  style="margin-left:10%">
					</c:if>
					<c:if test="${deal.sState=='1'&&deal.bState=='0' }">
					<input type="button" value="구매자승인대기" class="btn btn-red btn-lg pull-left" readonly="readonly">
					</c:if>
					<c:if test="${deal.sState=='1'&&deal.bState=='1' }">
					<input type="button" value="판매완료" class="btn btn-red btn-lg pull-left" readonly="readonly">
					</c:if>
					
					</form>
				</div>
			</div>
			<div class="clearfix margin20"></div>
			</div>
			<div class="divide50"></div>
		
		</div>
	</div>
	<div id="cancleModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">예약취소</h4>
				</div>
				<div class="modal-body">
					<p>
						<label id="ddresult"></label>
					</p>
				</div>
				<div class="modal-footer">
				<form action="${initParam.root }home.jsp">
					<input type="submit" class="btn btn-default" value="닫기">
					</form>
				</div>
			</div>
		</div>
	</div>
	</c:when>
	<c:when test="${deal==null }">
		<div id="cancleModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">예약취소</h4>
				</div>
				<div class="modal-body">
					<p>
						<label id="ddresult"></label>
					</p>
				</div>
				<div class="modal-footer">
					<form action="${initParam.root }home.jsp">
					<input type="submit" class="btn btn-default"  value="닫기">
					</form>
				</div>
			</div>
		</div>
	</div>
	</c:when>
	</c:choose>

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
	<script type="text/javascript" src="js/jquery.sticky.js"></script>
	<!--parallax background plugin-->
	<script src="${initParam.root }js/jquery.stellar.min.js" type="text/javascript"></script>
	<!--owl carousel slider-->
	<script src="${initParam.root }owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
	<script src="${initParam.root }js/classie.js" type="text/javascript"></script>
	<script src="${initParam.root }js/selectFx.js" type="text/javascript"></script>
	<!--revolution slider plugins-->
	<script src="${initParam.root }rs-plugin/js/jquery.themepunch.tools.min.js"
		type="text/javascript"></script>
	<script src="${initParam.root }rs-plugin/js/jquery.themepunch.revolution.min.js"
		type="text/javascript"></script>
	<script src="${initParam.root }js/tweetie.min.js" type="text/javascript"></script>
	<!--on scroll animation-->
	<script src="${initParam.root }js/wow.min.js" type="text/javascript"></script>
	<!--customizable plugin edit according to your needs-->
	<script src="${initParam.root }js/real-estate-custom.js" type="text/javascript"></script>

</body>
</html>
