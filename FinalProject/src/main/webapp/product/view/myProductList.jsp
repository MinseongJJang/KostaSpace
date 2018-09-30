<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>Insert title here</title>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
function deleteProduct(pNo){
	   var pno = pNo;
	      $('#deleteProductModal').modal();
	      $('#deleteProductConfirm').click(function(){
	         
	         
	         location.href="${initParam.root}deleteProduct.do?no="+pno;
	         
	      });
	   }
</script>
<script>


	   
	   var count = 0;
		
		
		$(document).ready(function() {
			$(window).scroll(function() {
					
					var dheight = $(document).height();
					var sheight = $(window).scrollTop()+ $(window).height();
					

												if (dheight == sheight) {
													if (count == 0) {
														document.getElementById('in1').style.display="block";
														count += 1;
													} else if (count == 1) {
														document.getElementById('in2').style.display="block";
														count += 1;
													} else if (count == 2) {
														document.getElementById('in3').style.display="block";
														count += 1;
													}else if (count == 3) {
														document.getElementById('in4').style.display="block";
															count += 1;
													}else if (count == 4) {
														document.getElementById('in5').style.display="block";
														count += 1;
													}

												}
												;
											});
							
						
						});
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
table{
	margin:auto;
}

.hover{
	border: 2px solid red;
}
</style>

</head>
<body>

<jsp:include page="/header.jsp" flush="true"><jsp:param value="내 공간 / 휴테크" name="pageName"/></jsp:include>
<div style="height: 100px;"></div>
<c:if test="${plist=='[]'}">
	<h2>${spaceuservo.id}님이 판매중인 상품이 없습니다.</h2>
	<a href="${initParam.root }product/view/registerSpace0.jsp"><h2>상품등록 페이지로 이동할까요?</h2></a>
</c:if>
<div class="modal fade" id="deleteProductModal" role="dialog">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">상품삭제</h4>
         </div>
         <div class="modal-body">
            <p>상품삭제를 진행하시면 해당상품의 모든 정보가 삭제됩니다.</p>
            <p>계속진행하시려면 확인버튼을 눌러주세요.</p>
            <button type="button" class="confirm pull-right" id="deleteProductConfirm"
               >확인</button>
            
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
         </div>
      </div>

   </div>
</div><!-- 모달 end -->   

<form action="">
	
		<table>
	<tr>
		
			<c:forEach items="${plist }" var="space" varStatus="i" begin="0" >
                <td>
                        <div class="item" style="width : 250px; margin-right: 50px; margin-bottom: 50px;">
                        <div><a href="javascript:deleteProduct('${space.p_no}')" class="btn btn-red">삭제</a></div>
                            <div class="property clearfix" style="background-color: white; border-bottom: 2px solid #DCDCDC;">
                                <div class="image">
                                    <div class="content">
                                        <a href="${initParam.root}getProduct.do?no=${space.p_no}"><i class="fa fa-search-plus"></i></a>
                                        <img src="p.upload/${space.newfilename}"  class="img-responsive" alt="propety"
                                        style="width:250px; height:300px; ">
                                        <span class="label-property">${space.type}</span>
                                        <span class="label-price">
                                        <c:if test="${space.staravg>'4.5' && space.staravg<='5.0' }">
                                        <img src="img/star.png" width="20px" height="25px"><img src="img/star.png" width="20px" height="25px"><img src="img/star.png" width="20px" height="25px"><img src="img/star.png" width="20px" height="25px"><img src="img/star.png" width="20px" height="25px">
                                        </c:if>
                                         <c:if test="${space.staravg>'4.0' && space.staravg<='4.5' }">
                                        <img src="img/star.png" width="20px" height="25px"><img src="img/star.png" width="20px" height="25px"><img src="img/star.png" width="20px" height="25px"><img src="img/star.png" width="20px" height="25px"><img src="img/halfstar.png" width="20px" height="25px">
                                        </c:if>
                                         <c:if test="${space.staravg>'3.5' && space.staravg<='4.0' }">
                                        <img src="img/star.png" width="20px" height="25px"><img src="img/star.png" width="20px" height="25px"><img src="img/star.png" width="20px" height="25px"><img src="img/star.png" width="20px" height="25px"><img src="img/nostar.png" width="20px" height="25px">
                                        </c:if>
                                         <c:if test="${space.staravg>'3.0' && space.staravg<='3.5' }">
                                        <img src="img/star.png" width="20px" height="25px"><img src="img/star.png" width="20px" height="25px"><img src="img/star.png" width="20px" height="25px"><img src="img/halfstar.png" width="20px" height="25px"><img src="img/nostar.png" width="20px" height="25px">
                                        </c:if>
                                         <c:if test="${space.staravg>'2.5' && space.staravg<='3.0' }">
                                        <img src="img/star.png" width="20px" height="25px"><img src="img/star.png" width="20px" height="25px"><img src="img/star.png" width="20px" height="25px"><img src="img/nostar.png" width="20px" height="25px"><img src="img/nostar.png" width="20px" height="25px">
                                        </c:if>
                                         <c:if test="${space.staravg>'2.0' && space.staravg<='2.5' }">
                                        <img src="img/star.png" width="20px" height="25px"><img src="img/star.png" width="20px" height="25px"><img src="img/halfstar.png" width="20px" height="25px"><img src="img/nostar.png" width="20px" height="25px"><img src="img/nostar.png" width="20px" height="25px">
                                        </c:if>
                                         <c:if test="${space.staravg>'1.5' && space.staravg<='2.0' }">
                                        <img src="img/star.png" width="20px" height="25px"><img src="img/star.png" width="20px" height="25px"><img src="img/nostar.png" width="20px" height="25px"><img src="img/nostar.png" width="20px" height="25px"><img src="img/nostar.png" width="20px" height="25px">
                                        </c:if>
                                         <c:if test="${space.staravg>'1.0' && space.staravg<='1.5' }">
                                        <img src="img/star.png" width="20px" height="25px"><img src="img/halfstar.png" width="20px" height="25px"><img src="img/nostar.png" width="20px" height="25px"><img src="img/nostar.png" width="20px" height="25px"><img src="img/nostar.png" width="20px" height="25px">
                                        </c:if>
                                         <c:if test="${space.staravg>'0.5' && space.staravg<='1.0' }">
                                        <img src="img/star.png" width="20px" height="25px"><img src="img/nostar.png" width="20px" height="25px"><img src="img/nostar.png" width="20px" height="25px"><img src="img/nostar.png" width="20px" height="25px"><img src="img/nostar.png" width="20px" height="25px">
                                        </c:if>
                                         <c:if test="${space.staravg>'0.0' && space.staravg<='0.5' }">
                                        <img src="img/halfstar.png" width="20px" height="25px"><img src="img/nostar.png" width="20px" height="25px"><img src="img/nostar.png" width="20px" height="25px"><img src="img/nostar.png" width="20px" height="25px"><img src="img/nostar.png" width="20px" height="25px">
                                        </c:if>
                                         <c:if test="${space.staravg=='0.0' }">
                                        <img src="img/nostar.png" width="20px" height="25px"><img src="img/nostar.png" width="20px" height="25px"><img src="img/nostar.png" width="20px" height="25px"><img src="img/nostar.png" width="20px" height="25px"><img src="img/nostar.png" width="20px" height="25px">
                                        </c:if>
                                        </span>
                                    </div><!--content-->
                                </div><!--image-->
                                
                                <div class="property-detail">
                                   <a href="${initParam.root}getProduct.do?no=${space.p_no}">${space.title}
                                    <span class="location">${space.hashtag}</span>
                                    <div class="pull-left">
                                        <p><b>${space.price}</b>원/시간</p>
                                    </div>
                                   
                                    <div class="pull-right">
                                        <span><img src="img/icon/review3.png" alt="">${space.reviewcount}</span>
                                        <span><img src="img/icon/good.png" alt="">${space.goodcount}</span>
                                    </div>
                                    </a>
                                </div><!--property details-->
                            </div><!--property-->
                        </div>
                        </td>
                       
                        <c:if test="${i.count%3==0 }">
                        <tr></tr>
                        <tr></tr>
                        </c:if>

                     </c:forEach>
                     </tr>

                    
				</table>
				
				<div id="in1" style="display: none;">
				<table>
	
                    
				</table>
				
				</div>
	</form>
	<div style="height: 100px"></div>
<jsp:include page="/footer.jsp"/>
</body>
</html>