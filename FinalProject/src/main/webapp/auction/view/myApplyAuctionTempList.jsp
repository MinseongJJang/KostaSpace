<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		if(${spaceuservo.id==null}){
			location.href="${initParam.root}NewFile1.jsp";
		}
		if(${spaceuservo.id == 'admin'}){
			alert("관리자 기능이 아닙니다.");
			location.href="${initParam.root}home.jsp";
		}
	});	//function
</script>
</head>
<body>
<!-- header -->
<jsp:include page="/header.jsp" flush="true"/>

<div class="w3-light-gray">
	<div class="container" style="margin-top: 20px;">
		<div class="container">
			<div class="col-lg-12" align="center">
				<h2 class="section-heading">내 경매 신청 목록</h2>
			    <hr>
			    <br>
			</div>
		</div>
		<div class="row" style="margin: auto;">
			<div class="w3-container">
				<table class="w3-table w3-bordered" style="background-color: #e6e6e6; width: 80%; margin: auto;">
					<thead>
						<tr style="background-color: #f2d636; text-align: center;">
							<th class="w3-col s1" style="color: white; text-align: center;">글번호</th>
							<th class="w3-col s5" style="color: white; text-align: center;">제목</th>
							<th class="w3-col s2" style="color: white; text-align: center;">가격</th>
							<th class="w3-col s2" style="color: white; text-align: center;">작성일</th>
							<th class="w3-col s2" style="color: white; text-align: center;">신청서 수정</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listVO.list}" var="auctionTemp">
							<tr class="w3-hover-white">
								<td class="w3-col s1" style="text-align: center;">${auctionTemp.a_no}</td>
								<td class="w3-col s5">${auctionTemp.title}</td>
								<td class="w3-col s2" style="text-align: center;">${auctionTemp.price}</td>
								<td class="w3-col s2" style="text-align: center;">${auctionTemp.a_date}</td>
								<td class="w3-col s2" style="padding-top: 4px; padding-bottom: 4px;">
									<div align="center">
										<a href="${initParam.root}getAuctiontemp.do?a_no=${auctionTemp.a_no}" class="btn btn-default">수정하기</a>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
					</tfoot>
				</table>
			</div>
		</div>
		<!-- 페이징 처리 -->   
		<%-- 이전 페이지 그룹이 있으면 이미지 보여준다.
			이미지 링크는 현 페이지 그룹 시작페이지 번호 -1 =>
			이전 페이지 그룹의 마지막 페이지 번호로 한다. --%>
		<div align="center">
			<c:if test="${requestScope.listVO.pagingBean.previousPageGroup}">
				<a href= "getMyApplyAuctionTempList.do?pageNo=${requestScope.listVO.pagingBean.startPageOfPageGroup-1}">
					<img src="../img/left_arrow_btn.gif">
				</a>
			</c:if>
			&nbsp;&nbsp;
			<%-- PagingBean 을 이용해서 현재 페이지에 해당되는 페이지그룹의
				시작페이지~~마지막페이지까지 화면에 보여준다. 
				이 때 현재 페이지를 제외한 나머지 페이지는 링크를 걸어
				해당 페이지에 대한 게시물 리스트 조회가 가능하도록 한다. --%>   
			<c:forEach var="i" begin="${requestScope.listVO.pagingBean.startPageOfPageGroup}" 
				end="${requestScope.listVO.pagingBean.endPageOfPageGroup}">
				<c:choose>
					<c:when test="${requestScope.listVO.pagingBean.nowPage!=i}">
						<a href="getMyApplyAuctionTempList.do?pageNo=${i}">${i}</a>
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
				right_arrow_btn.gif  --%>
			<c:if test="${requestScope.listVO.pagingBean.nextPageGroup}">
				<a href= "getMyApplyAuctionTempList.do?pageNo=${requestScope.listVO.pagingBean.endPageOfPageGroup+1}">
					<img src="../img/right_arrow_btn.gif">
				</a>
			</c:if>
			<br>
		</div>
	</div>
	<br>
	<br>
</div>

<jsp:include page="/footer.jsp"/>
</body>
</html>


