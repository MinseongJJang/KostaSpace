<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function deleteUser(id){
		
		if(confirm("삭제 하시겠습니까?")){
			return location.href="${initParam.root}deleteUser.do?id="+id;
		}else{
			return;
		}
	}
</script>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include >
<script type="text/javascript">
        $(function(){
           
           if(${spaceuservo.id==null}){
              location.href="${initParam.root}NewFile1.jsp";
              //$('#loginModal').modal();   
                }
        
           });
</script>
<div class="container">
	<div class="col-sm-12">
	<br>
		<div class="row">
			<div class="col-sm-4"></div>
			<div class="col-sm-4">
					<h4>회원검색</h4>
					<br>
					<form action="${initParam.root}getUserInfo.do" method="post" onsubmit="">
						<div class="col-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-user"></i></span>
							
								<input type="text" id="findUser" name="findUser" class="form-control" 
									placeholder="ID">
							
						</div>
						</div>
						<div class="col-sm-2">
							<input type="submit" id="check" class="btn btn-warning" value="검색"  > <br>
						</div>
					</form>
			</div>
			<div class="col-sm-4"></div><br>
		</div>
		
		<div style="height: 50px;"></div>
		
	
	
	<c:if test="${ uservo !=null}">
		
		
		<div class="row">
		
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
		
				<form action="updateUser.do" method="post" id="registerForm" name="registerForm">
					<div class="form-group">
						<label for="label-id">ID</label>
						<input type="text" class="form-control" id="id" name="id"  
							value="${uservo.id }" readonly="readonly">
					</div>
					<div class="form-group">
						<label for="label-password">Password</label>
						<input type="password" class="form-control" id="password" name="password" 
							readonly="readonly" value="${uservo.password}">
					</div>
					
					<div class="form-group">
						<label for="label-tel">Tel</label>
						<input type="tel" class="form-control" id="tel" 
							name="tel"
							readonly="readonly" value="${uservo.tel}">
					</div>
					<div class="form-group">
						<label for="label-name">Name</label>
						<input type="text" class="form-control" id="name" name="name"  
							readonly="readonly" value="${uservo.name}">
					</div>
					<div class="form-group">
						<label for="label-address">Address</label>
						<input type="text" class="form-control" id="address" name="address"   
							readonly="readonly" value="${uservo.address}">
					</div>
					<div class="form-group">
						<label for="label-crn">사업자등록번호</label>
						<input type="text" class="form-control" id="crn" name="crn"
							value="${uservo.crn }" readonly="readonly">
					</div>
					<div class="form-group">
						<label for="label-crn">포인트</label>
						<input type="text" class="form-control" id="point" name="point"
							value="${uservo.point }" readonly="readonly">
					</div>
					<div class="form-group">
						<label for="label-crn">회원등급</label>
						<input type="text" class="form-control" id="grade" name="grade"
							value="${uservo.grade }" readonly="readonly">
					</div>
					
					<div align="center">
					<input type="button" class="btn btn-danger" value="회원삭제"  onclick="return deleteUser('${uservo.id }')">
					</div>
					
				 </form>
				 <div style="height: 50px;"></div>
				 
			
			</div>
			<div class="col-sm-4"></div>
			</div> 
	</c:if>
			
			 
			
	
	</div>
</div>
		<%-- <div>
			<input type="button" id="" name="" value="홈으로" 
				onclick="javascript:location.href='${initParam.root}index.jsp'">
		</div> --%>
<jsp:include page="/footer.jsp"/>
</body>
</html>