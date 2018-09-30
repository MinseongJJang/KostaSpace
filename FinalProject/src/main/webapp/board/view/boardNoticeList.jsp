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
      url = "board/view/" + str + ".jsp?notice=true";
      location.href = url;
   };
</script>
<script type="text/javascript">
   $(function() {
      $("#accordion").accordion();
       $("#menu").menu();
      
   }); //function

</script>

</head>
<body>
   <jsp:include page="/header.jsp"><jsp:param value="공지사항" name="pageName"/></jsp:include>


   <div class="container">
      <div class="row">
         <div class="container">
            <div class="col-lg-12">
               <hr>
               <br> <br>
            </div>
         </div>
         <div class="hform">
            <form action="${initParam.root }searchNotice.do" method="post"
               id="searchNoticeForm" name="searchNoticeForm">





               <div class="w3-container">
                  <input type="text" class="w3-input w3-col s10" id="searchNotice"
                     name="searchNotice" required="required" placeholder="키워드로 검색하세요!">
                  <input
                     class="w3-button w3-white w3-border w3-border-gray w3-round-large w3-col s2"
                     type="submit" value="검색">
               </div>


            </form>
         </div>
         <br>
         <!-- <table id="accordion"> -->
         <div class="w3-container">
            <table class="w3-table w3-bordered">
               <tr style="background-color: #f2d636;">
                  <td class="w3-col s1" style="color: white;">글번호</td>
                  <td class="w3-col s1" style="color: white;">카테고리</td>
                  <td class="w3-col s7" style="color: white;">Title</td>
                  <td class="w3-col s2" style="color: white;">작성일</td>
                  <td class="w3-col s1" style="color: white;">작성자</td>

               </tr>
               <c:forEach items="${noticeList.list}" var="board">
                  <!-- <tr id="accordion"> -->
                  
                  <tr class="w3-hover-white" onclick=""
                     class="w3-btn w3-block w3-black w3-left-align" id="11">

                     <td class="w3-col s1">${board.b_no}</td>
                     <td class="w3-col s1">${board.category}</td>
                     <td class="w3-col s7"><a
                        href="getNotice.do?bNo=${board.b_no}">${board.title}</a></td>
                     <td class="w3-col s2">${board.bDate}</td>
                     <td class="w3-col s1">${board.id}</td>
                  </tr>
                  
               </c:forEach>

            </table>
         </div>
            <!--@@@@@ 페이징 처리@@@@@@ -->
<br><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <!-- 페이징 처리 -->   
   <%-- 이전 페이지 그룹이 있으면 이미지 보여준다.
        이미지 링크는 현 페이지 그룹 시작페이지 번호 -1 =>
         이전 페이지 그룹의 마지막 페이지 번호로 한다. 
    --%>
   <c:if test="${requestScope.noticeList.pagingBean.previousPageGroup}">
    <a href=
    "getAllNotice.do?pageNo=${requestScope.noticeList.pagingBean.
    startPageOfPageGroup-1}&&notice=true"><img src="../img/left_arrow_btn.gif"></a>
    </c:if>
    &nbsp;&nbsp;
   <%-- PagingBean 을 이용해서 현재 페이지에 해당되는 페이지그룹의
         시작페이지~~마지막페이지까지 화면에 보여준다. 
         이 때 현재 페이지를 제외한 나머지 페이지는 링크를 걸어
         해당 페이지에 대한 게시물 리스트 조회가 가능하도록 한다. 
    --%>   
   <c:forEach var="i" 
   begin="${requestScope.noticeList.pagingBean.startPageOfPageGroup}"
    end="${requestScope.noticeList.pagingBean.endPageOfPageGroup}">
    <c:choose>
    <c:when test="${requestScope.noticeList.pagingBean.nowPage!=i}">
    <a href="getAllNotice.do?pageNo=${i}&&notice=true">${i}</a>
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
    <c:if test="${requestScope.noticeList.pagingBean.nextPageGroup}">
    <a href=
    "getAllNotice.do?pageNo=${requestScope.noticeList.pagingBean.
    endPageOfPageGroup+1}&&notice=true">
    <img src="../img/right_arrow_btn.gif">
    </a>
    </c:if>     
         </div>
         <br>
         <c:choose>
            <c:when test="${spaceuservo.id=='admin'}">
               <div class="w3-right">
                  <input
                     class="w3-button w3-white w3-border w3-border-gray w3-round-large"
                     type="button" id="registerBoard" name="registerBoard" value="등록"
                     onclick="btnClick('registerBoard')">
               </div>

               <!-- b_no를 넘겨줘야지 수정(updateBoard)에 값을 뿌려줘서 update가 가능해진다. -->
               <!-- <input type="button" id="updateBoard" name="updateBoard"
                  value="수정은 특정 공지사항 클릭했을때 클릭한 공지사항에서만 보이도록"
                  onclick="btnClick('updateBoard')"> -->

            </c:when>
         </c:choose>

      </div>
<div style="height: 100px;"></div>
<jsp:include page="/footer.jsp"/>


</body>

</html>

