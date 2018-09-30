<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
	function check() {
		alert("신고접수 취소 완료");
		location.href="${initParam.root}deleteComplain.do?cNo=${cvo.c_no}";
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
<body >

<c:if test="${notice.notice=='true'}">
<jsp:include page="/header.jsp"><jsp:param value="공지사항" name="pageName"/></jsp:include>
	<div class="container" style="width: 510px; height: 800px; margin-top: 100px;">
		<div id="" class="blog-post">

			<ul class="list-inline post-detail">
			    <br><li><h3>[ 공지 ]<p>
			    <div> ${notice.title}</div>
			    
			    <c:if test="${spaceuservo.id !='admin'}">
			    <div>
			    	<a href="${initParam.root}getAllNotice.do?pageNo=1&&notice=true" class="btn btn-red" style="margin-left: 400px;">목록</a>
			    </div>
			    </c:if>
			    
			    <c:if test="${spaceuservo.id=='admin'}">
			    <div>
			    	<a href="${initParam.root}getAllNotice.do?pageNo=1&&notice=true" class="btn btn-red" style="margin-left: 305px;">목록</a>
				    <a href="${initParam.root}getNoticeForUpdate.do?bNo=${notice.b_no}" class="btn btn-red">수정</a>
				    <a href="javascript:check2()" class="btn btn-red">삭제</a>
				</div>
			    </c:if>
			    </h3></li><br>
			    <li style="font-size: 14px;">작성자 : 관리자 &nbsp;&nbsp;&nbsp;&nbsp; | </li>
			    <li style="font-size: 13px;"><i class="fa fa-calendar"></i>작성일시  ${notice.bDate }</li>
			</ul>
            <ul class="list-inline post-detail">
            	<li style="font-size: 14px;">${notice.content }</li>
            </ul>
		</div>
	</div>
</c:if>

<c:if test="${notice.notice=='false'}">
<jsp:include page="/header.jsp"><jsp:param value="고객센터 / FAQ" name="pageName"/></jsp:include>
	<div class="container" style="width: 510px; height: 800px; margin-top: 100px;">
		<div id="" class="blog-post">

			<ul class="list-inline post-detail"><br>
			    <li>
			    <h3>[ FAQ ]&nbsp;&nbsp;&nbsp;[ 카테고리 : ${notice.category} ]<p>
			     	<div>${notice.title}</div>
			    
			    <c:if test="${spaceuservo.id !='admin'}">
			    <div>
			    	<a href="${initParam.root}getAllNotice.do?pageNo=1&&notice=true" class="btn btn-red" style="margin-left: 400px;">목록</a>
			    </div>
			    </c:if>
			    
			    <c:if test="${spaceuservo.id=='admin'}">
			    <div>
			    	<a href="${initParam.root}getAllNotice.do?pageNo=1&&notice=true" class="btn btn-red" style="margin-left: 305px;">목록</a>
				    <a href="${initParam.root}getNoticeForUpdate.do?bNo=${notice.b_no}" class="btn btn-red">수정</a>
				    <a href="javascript:check2()" class="btn btn-red">삭제</a>
				</div>
			    </c:if>
			    </h3></li><br>
			    <li style="font-size: 14px;">작성자 : 관리자 &nbsp;&nbsp;&nbsp;&nbsp; | </li>
			    <li style="font-size: 13px;"><i class="fa fa-calendar"></i>작성일시  ${notice.bDate }</li>
			</ul>
            <ul class="list-inline post-detail">
            	<li style="font-size: 14px;">${notice.content }</li>
            </ul>
		</div>
	</div>
</c:if>


<jsp:include page="/footer.jsp"/>


	

</body>
</html>