<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>

<!-- Bootstrap -->
<link href="../../bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- custom css  -->
<link href="../../css/real-estate.css" rel="stylesheet" type="text/css"
	media="screen">
<!-- font awesome for icons -->
<link href="../../font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,900,700,500,400italic,300italic,300,100italic,100'
	rel='stylesheet' type='text/css'>
<!--owl carousel css-->
<link href="../../owl-carousel/assets/owl.carousel.css" rel="stylesheet"
	type="text/css" media="screen">
<link href="../../owl-carousel/assets/owl.theme.default.css" rel="stylesheet"
	type="text/css" media="screen">
<!--mega menu -->
<link href="../../css/yamm.css" rel="stylesheet" type="text/css">
<link href="../../css/select.css" rel="stylesheet" type="text/css">
<!--Revolution slider css-->
<link href="../../rs-plugin/css/settings.css" rel="stylesheet" type="text/css"
	media="screen">
<link href="../../css/rev-style.css" rel="stylesheet" type="text/css"
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
   
    var i = 0;
    var j = 0;
    $('input[type="date"]').change(function(){
    	
     	$('#sTime1>#option1').remove();
     	$('#eTime1>#option2').remove();
    	$.ajax({
    		type : "post",
    		url : "${initParam.root}r.do",
    		data : "resDate="+$(this).val()+"&&pNo="+${param.no},
    		success:function(data){
    			$.each(data.f[0], function(index,item){
    				var option ="<option value="+item+" id='option1' style='text-align:center;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+item+"</option>";		
        			$('#sTime1').append(option);
    			});
    			$.each(data.f[1], function(index,item){
        			var option ="<option value="+item+" id='option2' style='text-align:center;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+item+"</option>";
        			$('#eTime1').append(option);
        			});//each
    			}
    	});//ajax
    });//change
  $('#sTime1').on('change',function(){
	 i = $(this).find(':selected').val();
	  $('#rtimeView1').html(i);
  })
   $('#eTime1').on('change',function(){
	   j = $(this).find(':selected').val();
	  $('#rtimeView2').html(j);
  })
	 $('#eTime1').on('change',function(){
		 var stime = $('#rtimeView1').html();
		 var etime = $('#rtimeView2').html();
		 	$.ajax({
		 		type:"post",
		 		url:"${initParam.root}rcount.do",
		 		data : "stime="+stime+"&&etime="+etime+"&&price="+${param.price},
		 		success:function(data){
		 			$('#TotalPointView').html(data.t);
		 		}//success
		 	});//ajax
	 })
	 $('#ok').on('click',function(){
		 var sTime = i;
		 var eTime=j;
		 var date = $('#date').val();
		 var form = document.getElementById("form");
		 form.sTime.value=sTime;
		 form.eTime.value=eTime;
		 form.date.value=date;
		 form.submit(); 
	 })//click; id=cancle
    $('#cancle').on('click',function(){
    	location.href="${initParam.root}home.jsp"
    })//click
});//function
 
  </script>
</head>
<body>
<jsp:include page="../../header.jsp">
	<jsp:param value="예약" name="pageName"/>
</jsp:include>
	<div class="divide70"></div>
	<div class="container">
		<div class="row">
		<div class="col-md-9"  style="margin-left: 25%">
			<div class="row property-listing">
				<div class="col-sm-4 margin30">
					<div class="image">
						<div class="content">
							<a href="#"><i class="fa fa-search-plus"></i></a> <img
								src="${initParam.root }p.upload/${param.img}" class="img-responsive" alt="propety">

						</div>
						<!--content-->
					</div>
					<!--image-->
				</div>
				<!--image col-->
				<div class="col-sm-8">
					<h3>
					 ${param.title }
					</h3><br><br>
					<!-- <em>Nsw, 4549</em><br> -->
					<!-- <a href="#" class="btn btn-default">Contact Me</a> -->
					<p><b>Category :</b> ${param.category} </p>
					<p><b>이용가능시간 :</b>${param.stime }~${param.etime } </p>
					<p><b>위             치 :</b> ${param.area }</p>
					
					<p><b>전  화   번  호 : </b> ${param.tel}</p>
					
					
				</div>
			</div>
			<!--property listing row-->
			<div class="clearfix margin20"></div>
			<h3>Properties</h3>
			<div class="row">
				<div class="col-md-9">
					<div class="col-sm-6"  style="border-right:solid 1px ">
						   <label>예약일 선택</label><br>
						   <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                <input type="date" class="form-control" id="date" name="date">
                            </div><br>
						<br> <label>이용시간</label><p>
						<div id="ssTime">
						<select id="sTime1" style="text-align: center;"><option>============</option></select> ~ <span id="eeTime"> <select
							id="eTime1" style="text-align: center;"><option>============</option></select>
						</span>
					</div>
					</div>
					<div class="col-sm-6">
						<form action="${initParam.root }reserveProduct.do" method="post" id="form">
					<input type="hidden" name="no" value="${param.no}"> <input
						type="hidden" name="price" value="${param.price}"> <input
						type="hidden" name="title" value="${param.title}"> <input
						type="hidden" name="area" value="${param.area}">
						
						<input type="hidden" id="sTime" name="sTime" >
						<input type="hidden" id="eTime" name="eTime">
						<input type="hidden" id="date" name="date">
						<label>결제 예정금액</label>
						<p>
						<p>
							이용시간 : <label id="rtimeView"><span id="rtimeView1"></span>~<span id="rtimeView2"></span></label>
						</p>
						<p>
							시간당 금액 : <label id="rpointView">${param.price }Point</label>
						</p>
						<p>
							총 금액 : <label id="TotalPointView"></label>Point
						</p>
						<input type="submit" value="예약하기" class="btn btn-red btn-lg pull-left" id="ok"><input type="button" value="취소하기" class="btn btn-red btn-lg" id="cancle"style="margin-left:10%">
					</form>
					</div>
				</div>
				
			</div>
			</div>
			<!-- Modal -->

			<!--all property row-->
			<div class="divide50"></div>
		
		</div>
	</div>
	<div class="divide40"></div>
	
		
	</footer>
	<!--footer-->
	<jsp:include page="../../footer.jsp"></jsp:include>
	<div class="copyright">
		<div class="container text-center">
			
		</div>
	</div>
	<!--scripts and plugins -->
	<!--must need plugin jquery-->
	<script src="../../js/jquery.min.js"></script>
	<script src="../../js/jquery-migrate.min.js"></script>
	<!--bootstrap js plugin-->
	<script src="../../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<!--easing plugin for smooth scroll-->
	<script src="../../js/jquery.easing.1.3.min.js" type="text/javascript"></script>
	<!--flex slider plugin-->
	<script src="../../js/jquery.flexslider-min.js" type="text/javascript"></script>
	<!--sticky header-->
	<script type="text/javascript" src="js/jquery.sticky.js"></script>
	<!--parallax background plugin-->
	<script src="../../js/jquery.stellar.min.js" type="text/javascript"></script>
	<!--owl carousel slider-->
	<script src="../../owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
	<script src="../../js/classie.js" type="text/javascript"></script>
	<script src="../../js/selectFx.js" type="text/javascript"></script>
	<!--revolution slider plugins-->
	<script src="../../rs-plugin/js/jquery.themepunch.tools.min.js"
		type="text/javascript"></script>
	<script src="../../rs-plugin/js/jquery.themepunch.revolution.min.js"
		type="text/javascript"></script>
	<script src="../../js/tweetie.min.js" type="text/javascript"></script>
	<!--on scroll animation-->
	<script src="../../js/wow.min.js" type="text/javascript"></script>
	<!--customizable plugin edit according to your needs-->
	<script src="../../js/real-estate-custom.js" type="text/javascript"></script>

</body>
</html>
