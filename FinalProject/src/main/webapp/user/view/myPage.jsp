<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">

<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$( function() {
	    $( "#menu" ).menu();
	    $( "#tabs" ).tabs();
	});
	
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
    fieldset {
      border: 0;
    }
    label {
      margin: 30px 0 0 0;
    }
	#categoryFrm{
		margin-left: 40%;
	}
	#banner{
		background-color: #2A2454;
		height: 200px;
	}
	#logo{
		width : 150px;
		text-align: center;
		background-color : #FDBE02;
	}
	#menu{
		background-color : #2A2454;
		width: 150px;
		margin: auto;
		margin-right :0px;
	}
	.menu1, .menu1_1, .menu1_2, .menu2, .menu3{
		background-color : #FDBE02;
	}
	#taps{
		background-color: #2A2454;
	}
	#tabs li{
		
	}
	#product_space{
		border: 1px solid;
		text-align: center;
	}
	#product_space img{
		width: 200px;
		
	}
	
</style>

</head>
<body>


<c:choose>
	<c:when test="${suvo!=null}"><!-- 로그인 후 -->
		<header id="header">
		<div id="banner">
			<div id="logo"><a href="index.jsp">공간기동대</a></div>
			
			<ul id="menu">
				<li class="menu1"><div>등록하기</div>
					<ul>
						<li class="menu1_1"><div><a href="${initParam.root}registerSpace1.jsp">공간 등록</a></div></li>
						<li class="menu1_2"><div><a href="${initParam.root}registerTech.jsp">휴테크 등록</a></div></li>
		    		</ul>
				</li>
				<li class="menu3"><div><a href="logout.do">로그아웃</a></div></li>
				
			</ul>
		</div><!-- banner -->
		</header>		
	</c:when>

	<c:otherwise><!-- 로그인 전 -->
		<header id="header">
		<div id="banner">
			<div id="logo">
				공간기동대
			</div>
			
			<ul id="menu">
				<li class="menu1"><div>등록하기</div>
					<ul>
						<li class="menu1_1"><div><a href="login.jsp">공간 등록</a></div></li>
						<li class="menu1_2"><div><a href="login.jsp">휴테크 등록</a></div></li>
		    		</ul>
				</li>
				<li class="menu2"><div><a href="login.jsp">로그인</a></div></li>
				<li class="menu3"><div><a href="registerSpaceUser.jsp">회원가입</a></div></li>
			</ul>
			
		</div><!-- banner -->
		</header>
	</c:otherwise>
</c:choose>
<!-- ==================================content================================== -->
<div id="content">
	
</div><!-- content -->

<footer>
footer
</footer>
</body>
</html>











