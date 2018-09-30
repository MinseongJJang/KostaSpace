<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
       $(function(){
           
          if(${spaceuservo.id==null}){
            location.href="${initParam.root}NewFile1.jsp";
            //$('#loginModal').modal();   
               }
        
          });
</script>
</head>
<body>
<jsp:include page="/header.jsp"><jsp:param value="컨텐츠 신고" name="pageName"/></jsp:include>
	
	<div class="container">
		<div class="row">
			<div class="container">
					<br><br><br><br>
			</div>
			<div class="container" style="height: 800px;">
				<form action="${initParam.root }complainProduct.do" method="post" id="registerForm" name="registerForm">
					<div class="form-group">
						<label for="label-id">신고 상품 번호</label>
						<input type="text" value="${param.p_no}" class="form-control" id="p_no" name="p_no"	readonly="readonly">
					</div>
					<div class="form-group">
						<label for="label-id">신고상품</label>
						<div class="form-control" id="title" readonly="readonly">${param.title}</div>
					</div>		
					<hr>
					<div class="form-group">
						<label for="label-name">신고명</label>
						<input type="text" class="form-control" id="title" name="title" placeholder="신고할 제목을 입력하세요"  
							required="required">
					</div>
					
					<div class="form-group">
						<label for="label-address">신고내용</label>
						<textarea class="form-control" id="content" name="content" placeholder="신고할 내용을 입력하세요"  
							required="required" rows="10" maxlength="600"></textarea>
					</div>
					
					<input type="submit" value="신고완료">
					<input type="button" value="취소" onclick="javascript:location.href='${initParam.root}index.jsp'">
				 </form>
			</div> 
		</div>
	
	</div>
	
<jsp:include page="/footer.jsp"/>

</body>
</html>


