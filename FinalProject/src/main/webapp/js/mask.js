function wrapWindowByMask(){
	//화면의 높이와 너비를 구한다.
	var maskHeight = $(document).height();
	var maskWidth = $(window).width();
	var width = maskWidth-320;
	//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
	$('#mask').css({'width':width,'height':maskHeight});  

	//애니메이션 효과 - 일단 1초동안 까맣게 됐다가 80% 불투명도로 간다.
	//$('#mask').fadeIn(1000);      
	$('#mask').fadeTo("slow",0.6);    
}

$(function(){
	//검은 막 띄우기
	$('.openMask').click(function(e){
		e.preventDefault();
		wrapWindowByMask();
		document.getElementById("mySidenav").style.width = "320px";
	});
	//닫기 버튼을 눌렀을 때
     

	//검은 막을 눌렀을 때
	$('#mask').click(function () {  
	    $(this).hide();  
	    $('.window').hide();
	    document.getElementById("mySidenav").style.width = "0";
	    document.getElementById("main").style.marginLeft = "0";
	}); 
	$('#close').click(function () {  
	    $('#mask, .window').hide();
		document.getElementById("mySidenav").style.width = "0";
	    document.getElementById("main").style.marginLeft = "0";
	});
	
});