<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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

	
	<c:if test="${spaceuservo.id != null}">
    	<c:if test="${spaceuservo.id != 'admin'}">
			<jsp:include page="/header.jsp"><jsp:param value="신고 컨텐츠 상세보기" name="pageName"/></jsp:include>
			<div class="container" style="width: 510px; height: 800px; margin-top: 100px;">
				<div id="" class="blog-post">
					<ul class="list-inline post-detail">
					    <li><h3>신고상품정보</h3></li>
					</ul>
		            <div class="sidebar-box" style="margin-top: 10px;">
			            <div class="media-left">
			                <div class="image">
			                    <div class="content">
			                        <img src="${initParam.root }p.upload/${productvo.newfilename}" width="150" height="165">
			                    </div><!--content-->
			                </div><!--image-->
			            </div>
		                <div class="media-body">
							<ul class="list-inline post-detail" style=" margin-top : 40px ; height: 70px;">
								<li style="font-size: 14px;"><신고 상품명></li>
								<li style="font-size: 12px;">${productvo.title}</li><br>
								<li style="font-size: 14px;"><상품 타입></li>
								<li style="font-size: 12px;">&nbsp;&nbsp;&nbsp;&nbsp;${productvo.type}</li><br>		                                    
								<li style="font-size: 14px;"><상품 등록자></li>
								<li style="font-size: 12px;">${productvo.id}</li><br>
							</ul>
		                </div>
		          	</div><!--media-->
		            <ul class="list-inline post-detail">
			            <li style="font-size: 14px;">신고자 ID : ${cvo.id}</li>
			            <li style="font-size: 13px;"><i class="fa fa-calendar"></i>${cvo.cDate }</li><br><br>
			            
			            <li>
							<div class="row control-group">
				                <div class="form-group col-xs-12 controls">
				                	<label style="font-size: 17px;"><b>신고제목 : ${cvo.title }</b></label><br><p>
				                    <label style="font-size: 17px;"><b>신고내용</b></label><br>
				                    <input type="text" value="${cvo.content }" readonly="readonly" style="width: 480px; height: 100px;">
				                </div>
				           	</div>
						</li>
		             </ul><br>
		             
		             <p align="right"><a href="javascript:check()" class="btn btn-red"><b>신고 취소</b></a></p>
				</div>
			</div>    	
    	</c:if>
    </c:if>
    <c:if test="${spaceuservo.id == 'admin'}">
		<jsp:include page="/header.jsp"><jsp:param value="신고 컨텐츠 상세보기" name="pageName"/></jsp:include>
		<div class="container" style="width: 510px; height: 800px; margin-top: 100px;">
			<div id="" class="blog-post">
				<ul class="list-inline post-detail">
				    <li><h3>신고상품정보</h3></li>
				</ul>
	            <div class="sidebar-box" style="margin-top: 10px;">
		            <div class="media-left">
		                <div class="image">
		                    <div class="content">
		                        <img src="${initParam.root }p.upload/${productvo.newfilename}" width="150" height="165">
		                    </div><!--content-->
		                </div><!--image-->
		            </div>
	                <div class="media-body">
						<ul class="list-inline post-detail" style=" margin-top : 40px ; height: 70px;">
							<li style="font-size: 14px;"><신고 상품명></li>
							<li style="font-size: 12px;">${productvo.title}</li><br>
							<li style="font-size: 14px;"><상품 타입></li>
							<li style="font-size: 12px;">&nbsp;&nbsp;&nbsp;&nbsp;${productvo.type}</li><br>		                                    
							<li style="font-size: 14px;"><상품 등록자></li>
							<li style="font-size: 12px;">${productvo.id}</li><br>
						</ul>
	                </div>
	          	</div><!--media-->
	            <ul class="list-inline post-detail">
		            <li style="font-size: 14px;">신고자 ID : ${cvo.id}</li>
		            <li style="font-size: 13px;"><i class="fa fa-calendar"></i>${cvo.cDate }</li><br><br>
		            
		            <li>
						<div class="row control-group">
			                <div class="form-group col-xs-12 controls">
			                	<label style="font-size: 17px;"><b>신고제목 : ${cvo.title }</b></label><br><p>
			                    <label style="font-size: 17px;"><b>신고내용</b></label><br>
			                    <input type="text" value="${cvo.content }" readonly="readonly" style="width: 480px; height: 100px;">
			                </div>
			           	</div>
					</li>
	             </ul><br>
	             
	             <p align="right"><a href="${initParam.root}AdminDeleteProduct.do?pNo=${productvo.p_no}" class="btn btn-red"><b>신고 상품 삭제</b></a></p>
			</div>
		</div>     
    </c:if>
	
<jsp:include page="/footer.jsp"/>
	

</body>
</html>