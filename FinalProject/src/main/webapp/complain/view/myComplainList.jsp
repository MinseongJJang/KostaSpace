<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
   src="http://code.jquery.com/jquery-3.2.1.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- Latest compiled and minified JavaScript -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	function btnClick(str) {
		url = "board/view/" + str + ".jsp?notice=false";
		location.href = url;
	};
</script>
<script type="text/javascript">
	$(function() {
		$("#accordion").accordion();
		$("#menu").menu();
	}); //function
</script>
<script type="text/javascript">
       $(function(){
           
          if(${spaceuservo.id==null}){
            location.href="${initParam.root}NewFile1.jsp";
            //$('#loginModal').modal();   
               }
        
          });
</script>
<style type="text/css">

</style>
</head>
<body>
	<jsp:include page="/header.jsp" flush="true"><jsp:param value="나의 신고 내역" name="pageName"/></jsp:include>


	<div>
		<div class="container" style="height: 800px;">
			<div class="row">
				<div class="container">
					<div class="col-lg-12">
						<hr>
						<br> <br>
					</div>
				</div>

				<br>
				
				
				<!-- 상품신고게시판 (관리자 로그인) -->
				<c:choose>
					<c:when test="${spaceuservo.id=='admin'}">
						<div class="w3-container">
					<table class="w3-table w3-bordered">
						<tr style="background-color: #f2d636">
							<td class="w3-col s7" style="color : white;">Title</td>
							<td class="w3-col s2"style="color : white;">작성일</td>
							<td class="w3-col s1"style="color : white;">비 고</td>
						</tr>
						<c:forEach items="${lvo.list}" var="complain">
							<!-- <tr id="accordion"> -->
							<tr class="w3-hover-white">
								<td class="w3-col s7">
								<a href="getComplain.do?cNo=${complain.c_no}">${complain.title}</a></td>
								<td class="w3-col s2">${complain.cDate}</td>
								<td class="w3-col s1"><img alt="" src="">아이콘</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<br>
				
				<!-- 페이징 처리 -->
				<%-- 이전 페이지 그룹이 있으면 이미지 보여준다.
					  이미지 링크는 현 페이지 그룹 시작페이지 번호 -1 =>
					   이전 페이지 그룹의 마지막 페이지 번호로 한다. 
				 --%>
			
				<c:if test="${requestScope.lvo.pagingBean.previousPageGroup}">
					<a
						href="findComplainById.do?pageNo=${requestScope.lvo.pagingBean.
	 							startPageOfPageGroup-1}">
						<img src="../img/left_arrow_btn.gif">
					</a>
				</c:if>
				&nbsp;&nbsp;
				<%-- PagingBean 을 이용해서 현재 페이지에 해당되는 페이지그룹의
					   시작페이지~~마지막페이지까지 화면에 보여준다. 
					   이 때 현재 페이지를 제외한 나머지 페이지는 링크를 걸어
					   해당 페이지에 대한 게시물 리스트 조회가 가능하도록 한다. 
				 --%>
				<c:forEach var="i"
					begin="${requestScope.lvo.pagingBean.startPageOfPageGroup}"
					end="${requestScope.lvo.pagingBean.endPageOfPageGroup}">
					<c:choose>
						<c:when test="${requestScope.lvo.pagingBean.nowPage!=i}">
							<a href="getAllComplain.do?pageNo=${i}">${i}</a>
						</c:when>
						<c:otherwise>
							${i}
						</c:otherwise>
					</c:choose>
				</c:forEach>
				&nbsp;&nbsp;
				<%-- 다음 페이지 그룹이 있으면 화살표 이미지를 보여준다.
						이미지 링크는 현재 페이지 그룹의 마지막 번호 + 1 => 
						다음 그룹의 시작 페이지로 링크한다. 
						right_arrow_btn.gif
				 --%>
				<c:if test="${requestScope.lvo.pagingBean.nextPageGroup}">
					<a href="getAllComplain.do?pageNo=${requestScope.lvo.pagingBean.endPageOfPageGroup+1}">
						<img src="../img/right_arrow_btn.gif">
					</a>
				</c:if>
				<br>
				<c:choose>
					<c:when test="${spaceuservo.id=='admin'}">
						<input type="button"
							class="w3-button w3-white w3-border w3-border-gray w3-round-large w3-right"
							id="registerBoard" name="registerBoard" value="등록"
							onclick="btnClick('registerBoard')">
					</c:when>
				</c:choose>
					</c:when>
					<c:otherwise>
										<div class="w3-container">
					<table class="w3-table w3-bordered">
						<tr style="background-color: #f2d636">
							<td class="w3-col s7" style="color : white;">Title</td>
							<td class="w3-col s2"style="color : white;">작성일</td>
							<td class="w3-col s1"style="color : white;">비 고</td>
						</tr>
						<c:forEach items="${lvo.list}" var="complain">
							<!-- <tr id="accordion"> -->
							<tr class="w3-hover-white">
								<td class="w3-col s7">
								<a href="${initParam.root }getComplain.do?cNo=${complain.c_no}">${complain.title}</a></td>
								<td class="w3-col s2">${complain.cDate}</td>
								<td class="w3-col s1"><img alt="" src="">아이콘</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<br>
				
				<!-- 페이징 처리 -->
				<%-- 이전 페이지 그룹이 있으면 이미지 보여준다.
					  이미지 링크는 현 페이지 그룹 시작페이지 번호 -1 =>
					   이전 페이지 그룹의 마지막 페이지 번호로 한다. 
				 --%>
				<c:if test="${requestScope.lvo.pagingBean.previousPageGroup}">
					<a
						href="findComplainById.do?pageNo=${requestScope.lvo.pagingBean.
	 							startPageOfPageGroup-1}">
						<img src="../img/left_arrow_btn.gif">
					</a>
				</c:if>
				&nbsp;&nbsp;
				<%-- PagingBean 을 이용해서 현재 페이지에 해당되는 페이지그룹의
					   시작페이지~~마지막페이지까지 화면에 보여준다. 
					   이 때 현재 페이지를 제외한 나머지 페이지는 링크를 걸어
					   해당 페이지에 대한 게시물 리스트 조회가 가능하도록 한다. 
				 --%>
				<c:forEach var="i"
					begin="${requestScope.lvo.pagingBean.startPageOfPageGroup}"
					end="${requestScope.lvo 	.pagingBean.endPageOfPageGroup}">
					<c:choose>
						<c:when test="${requestScope.lvo.pagingBean.nowPage!=i}">
							<a href="findComplainById.do?pageNo=${i}">${i}</a>
						</c:when>
						<c:otherwise>
							${i}
						</c:otherwise>
					</c:choose>
				</c:forEach>
				&nbsp;&nbsp;
				<%-- 다음 페이지 그룹이 있으면 화살표 이미지를 보여준다.
						이미지 링크는 현재 페이지 그룹의 마지막 번호 + 1 => 
						다음 그룹의 시작 페이지로 링크한다. 
						right_arrow_btn.gif
				 --%>
				<c:if test="${requestScope.lvo.pagingBean.nextPageGroup}">
					<a href="findComplainById.do?pageNo=${requestScope.lvo.pagingBean.endPageOfPageGroup+1}">
						<img src="../img/right_arrow_btn.gif">
					</a>
				</c:if>
				<br>
				<c:choose>
					<c:when test="${spaceuservo.id=='admin'}">
						<input type="button"
							class="w3-button w3-white w3-border w3-border-gray w3-round-large w3-right"
							id="registerBoard" name="registerBoard" value="등록"
							onclick="btnClick('registerBoard')">
					</c:when>
				</c:choose>
					</c:otherwise>
				</c:choose>

			</div>

		</div>
	</div>
<jsp:include page="/footer.jsp"/>


</body>
</html>


