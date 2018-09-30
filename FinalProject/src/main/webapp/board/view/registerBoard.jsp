<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

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
		<%-- <c:import url="">메뉴바??</c:import> --%>
<header>
Header
</header>
	<div class="container">
		<div class="row">
			<div class="container">
				<div class="col-lg-12">
					<!-- <span>공간기동대원 모집 양식</span> -->
					<h2 class="section-heading">공지사항 및 FAQ 등록</h2>
					<hr>
					<br><br>
				</div>
			</div>
			<!-- <div class="col-md-12 text-center"> -->
			<div class="container">
				<form action="${initParam.root}registerBoard.do" method="post" id="registerBoardForm" 
					name="registerBoardForm" class="" enctype="multipart/form-data">
					<input type="hidden" id="notice" name="notice" value="${param.notice}">
					<div class="form-group">
						<label for="label-registerBoard">작성자</label>
						<input type="text" class="form-control" id="id" name="id" 
							required="required" value="${spaceuservo.id }" readonly="readonly">
					</div>
					<div class="form-group">
						<label for="label-registerBoard">Title</label>
						<input type="text" class="form-control" id="title" name="title" 
							required="required" placeholder="title">
					</div>
					
					<c:if test="${param.notice == true}">
						<div class="form-group">
							<label for="label-registerBoard">Category</label>
							<input type="text" class="form-control" id="category" name="category" value="공지사항"
								readonly="readonly">
						</div>
					</c:if>
					<c:if test="${param.notice == false}">
						<div class="form-group col-xs-2">
							<label for="label-searchFAQ">FAQ 카테고리</label>
							<select  id="category" name="category" >
								<option id="category" value="전체">전체</option>
								<option id="category" value="회원">회원</option>
								<option id="category" value="예약&구매">예약&구매</option>
								<option id="category" value="등록">등록</option>
								<option id="category" value="충전&결제">충전&결제</option>
								<option id="category" value="후기">후기</option>
								<option id="category" value="기타">기타</option>
							</select>
						</div>
					</c:if>
					<br><br><br><br>
					<div class="form-group">
						<label for="label-registerBoard">Image Upload</label>
						<input type="file" class="form-control" id="multipartFile" name="multipartFile" 
							placeholder="Upload">
					</div>
					
					<div class="form-group">
						<label for="label-registerBoard">Content</label>
						
						<textarea rows="30" cols="10" class="form-control" id="content" name="content" placeholder="Content" 
							required="required"></textarea>
						
					</div>
					
					<input type="submit" value="등록">
					<input type="reset" value="재입력">
					<!-- <input type="button" value="회원가입" onclick="checkRegister()">  -->
				 </form>
			</div> 
		</div>
	
	</div>
	
<footer>
Footer
</footer>
	
	
</body>
</html>


