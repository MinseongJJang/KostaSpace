<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>  
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
<jsp:include page="/header.jsp"/>
<c:choose>
<c:when test="${dlist != '[]'}">
<%-- 	<table>
		<thead>
			<th>글번호</th><th>상품명</th><th>가격</th><th>거래상황</th>
		</thead>
		<tbody>
			<c:forEach items="${dlist}" var="deal">
				<tr>
					<td>${deal.d_no}</td><td><a href="getDealInfo.do?no=${deal.d_no}">${deal.title}</a></td><td>${deal.price}</td><td>${deal.accept}</td>		
				</tr>
			</c:forEach>
			
		</tbody>
	</table> --%>
			<div class="container">
			<div class="row">
				<div class="container">
					<div class="col-lg-12">
						<hr>
						<br> <br>
					</div>
				</div>
				
				<br>
				<!-- <table id="accordion"> -->
				<div class="w3-container">
					<table class="w3-table w3-bordered">
						<tr class="w3-red">
							<td class="w3-col s2">글번호</td>
							<td class="w3-col s7">Title</td>
							<td class="w3-col s2">작성일</td>
							<td class="w3-col s1">비 고</td>
						</tr>
						<c:forEach items="${dlist.list}" var="deal">
							<!-- <tr id="accordion"> -->
							<tr class="w3-hover-cyan">
								<td class="w3-col s2">${deal.d_no}</td>
								<td class="w3-col s7"><a
									href="getDealInfo.do?no=${deal.d_no}">${deal.title}</a></td>
								<td class="w3-col s2">${deal.resDate}</td>
								<td class="w3-col s1">${deal.accept}</td>
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
	 <div class="row">
	 <div class="col-sm-4"></div>
	 <div class="col-sm-6" style="margin-left: 38%">
	 <ul class="pagination">
				<c:if test="${requestScope.dlist.pagingBean.previousPageGroup}">
					<li><a
						href="getAllDealInfo.do?pageNo=${requestScope.dlist.pagingBean.
	 startPageOfPageGroup-1}"><img
						src="${initParam.root }img/left_arrow_btn.gif"></a></li>
				</c:if>
				&nbsp;&nbsp;
				<%-- PagingBean 을 이용해서 현재 페이지에 해당되는 페이지그룹의
		   시작페이지~~마지막페이지까지 화면에 보여준다. 
		   이 때 현재 페이지를 제외한 나머지 페이지는 링크를 걸어
		   해당 페이지에 대한 게시물 리스트 조회가 가능하도록 한다. 
	 --%>
				<c:forEach var="i"
					begin="${requestScope.dlist.pagingBean.startPageOfPageGroup}"
					end="${requestScope.dlist.pagingBean.endPageOfPageGroup}">
					<c:choose>
						<c:when test="${requestScope.dlist.pagingBean.nowPage!=i}">
							<li><a href="getAllDealInfo.do?pageNo=${i}">${i}</a></li>
						</c:when>
						<c:otherwise>
	<li class="active"><a href="#">${i}</a></li>
	</c:otherwise>
					</c:choose>
				</c:forEach>
				&nbsp;&nbsp;
				<%-- 다음 페이지 그룹이 있으면 화살표 이미지를 보여준다.
			이미지 링크는 현재 페이지 그룹의 마지막 번호 + 1 => 
			다음 그룹의 시작 페이지로 링크한다. 
			right_arrow_btn.gif
	 --%>
				<c:if test="${requestScope.dlist.pagingBean.nextPageGroup}">
					<li><a
						href="getAllDealInfo.do?pageNo=${requestScope.dlist.pagingBean.
	 endPageOfPageGroup+1}">
						<img src="${initParam.root }img/right_arrow_btn.gif">
					</a></li>
				</c:if>
				<br>
		</ul>
		</div>
		</div>
				
			</div>

		</div>
</c:when>

<c:otherwise>
<h2><b>거래내역이 없습니다.</b></h2>
</c:otherwise>
</c:choose>

<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>