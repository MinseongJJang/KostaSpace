<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="${initParam.root}css/indexAuction.css">
<%-- <link rel="stylesheet" href="${initParam.root}css/footerstyle.css"> --%>
<link href="${initParam.root }css/mask.css" rel="stylesheet" type="text/css" media="screen">
<!--sticky header-->
<script type="text/javascript" src="js/jquery.sticky.js"></script>
<script type="text/javascript" src="${initParam.root}js/indexSearch.js"></script>
<style type="text/css">
.navbar{
	margin-bottom: 0px !important;
}
#ftb{
   display: none;
}
</style>
<script type="text/javascript">
	$(function(){
		if(${spaceuservo.id==null}){
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
	});	//function
	
	var edate = "<c:out value='${enddate}' />";
	var edateArray = edate.split('-');
	
	var now = new Date();
	var g_Timer = 0;
    var g_LastTime = new Date(edateArray[0], edateArray[1], edateArray[2], 14, 00, 00); // 경매마감시간
    
    var g_DBNowTime = new Date(now.getFullYear(), now.getMonth()+1, now.getDate(), 
    		now.getHours(), now.getMinutes(), now.getSeconds()); // 경매시작시간
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
         if(size != "0"){
            location.href = "${initParam.root}getOnSaleAuction.do";
         }
         else{
            alert("진행중인 경매가 없습니다.");
            return;
         }
      }
   }
   
}
</script>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>

<section class="index-auction" style="height: 600px;">
	<div class="container">
		<div class="intro-text">
			<div class="intro-heading"></div>
			<div class="intro-lead-in"><b>Welcome To Our Auction!</b></div>
			<!-- <div class="intro-heading">남은 경매 시간</div> -->
			<div class="t_gold" id="hdivMessage" style="margin: 50px; font-size: 30px;"></div>
			<script>Countdown();</script>
			<a href="#" class="page-scroll btn btn-xl btn-search btn-register" onclick="checkOnSaleAuction()">경매 참여</a>
		</div>
		<div class="container index-btn">
			<a href="${initParam.root}auction/view/applyAuctionTemp.jsp" class="btn page-scroll btn-xl" 
				style="background-color: inherit; color: white; margin: 5px; font-weight: bolder;">경매신청</a>
			<a href="${initParam.root}getMyApplyAuctionTempList.do" class="btn page-scroll btn-xl" 
				style="background-color: inherit; color: white; margin: 5px; font-weight: bolder;">경매 수정</a>
			<a href="${initParam.root}getAllMyAuction.do" class="btn page-scroll btn-xl"
				style="background-color: inherit; color: white; margin: 5px; font-weight: bolder;">내 경매 내역</a>
		</div>
	</div>
</section>
<div style="height:100px"></div>
<jsp:include page="/footer.jsp"/>
</body>
</html>


