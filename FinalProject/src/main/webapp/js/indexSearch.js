   $(function() { /* //$(":input:radio[name=search_type]:checked").val(); */
      $(':input:radio[name=licence1]').prop("checked", false);
      $('#checkArea').click(function() {
         var f = $(':input:radio[name=licence1]:checked').val();
         //f2=$(':input:radio[name=licence2]:checked').val();
         if (f == '서울시') {
            $('#modal-area1-1').modal();
         } else if (f == '경기도') {
            $('#modal-area2').modal();
         } else if (f == '인천시') {
            $('#modal-area3').modal();
         } else if (f == '부산시') {
            $('#modal-area4').modal();
         } else if (f == '대전시') {
            $('#modal-area5').modal();
         } else if (f == '대구시') {
            $('#modal-area6').modal();
         } else if (f == '울산시') {
            $('#modal-area7').modal();
         } else if (f == '광주시') {
            $('#modal-area8').modal();
         } else if (f == '강원도') {
            $('#modal-area9').modal();
         } else if (f == '충청북도') {
            $('#modal-area10').modal();
         } else if (f == '충청남도') {
            $('#modal-area11').modal();
         } else if (f == '경상북도') {
            $('#modal-area12').modal();
         } else if (f == '경상남도') {
            $('#modal-area13').modal();
         } else if (f == '전라북도') {
            $('#modal-area14').modal();
         } else if (f == '전라남도') {
            $('#modal-area15').modal();
         } else if (f == '제주도') {
            $('#modal-area16').modal();
         } else if (f == '전체지역') {
            $('#Select-Area').html("전체지역");
            $(':input:radio[name=licence1]').prop("checked", false);
         }

      }); //click1
      $('#finalAreaCheck').click(function() {
         var f = $(':input:radio[name=licence1]:checked').val();
         var f2 = $(':input:radio[name=licence2]:checked').val();
         $('#Select-Area').html("<font size='3px'>" + f + " " + f2 + "</font>");
         var k = f+" "+f2;
         $('#rar').attr('value',k);
         alert(document.getElementById("rar").value);
         $(':input:radio[name=licence1]').prop("checked", false);
         $(':input:radio[name=licence2]').prop("checked", false);
      }); //click
      $('#finalAreaCheck2').click(function() {
         var f = $(':input:radio[name=licence1]:checked').val();
         var f2 = $(':input:radio[name=licence2]:checked').val();
         $('#Select-Area').html("<font size='3px'>" + f + " " + f2 + "</font>");
         var k = f+" "+f2;
         $('#rar').attr('value',k);
         alert(document.getElementById("rar").value);
         $(':input:radio[name=licence1]').prop("checked", false);
         $(':input:radio[name=licence2]').prop("checked", false);
      }); //click
      $('#finalAreaCheck3').click(function() {
         var f = $(':input:radio[name=licence1]:checked').val();
         var f2 = $(':input:radio[name=licence2]:checked').val();
         $('#Select-Area').html("<font size='3px'>" + f + " " + f2 + "</font>");
         var k = f+" "+f2;
         $('#rar').attr('value',k);
         alert(document.getElementById("rar").value);
         $(':input:radio[name=licence1]').prop("checked", false);
         $(':input:radio[name=licence2]').prop("checked", false);
      }); //click
      $('#finalAreaCheck4').click(function() {
         var f = $(':input:radio[name=licence1]:checked').val();
         var f2 = $(':input:radio[name=licence2]:checked').val();
         $('#Select-Area').html("<font size='3px'>" + f + " " + f2 + "</font>");
         var k = f+" "+f2;
         $('#rar').attr('value',k);
         alert(document.getElementById("rar").value);
         $(':input:radio[name=licence1]').prop("checked", false);
         $(':input:radio[name=licence2]').prop("checked", false);
      }); //click   
      $('#finalAreaCheck5').click(function() {
         var f = $(':input:radio[name=licence1]:checked').val();
         var f2 = $(':input:radio[name=licence2]:checked').val();
         $('#Select-Area').html("<font size='3px'>" + f + " " + f2 + "</font>");
         var k = f+" "+f2;
         $('#rar').attr('value',k);
         alert(document.getElementById("rar").value);
         $(':input:radio[name=licence1]').prop("checked", false);
         $(':input:radio[name=licence2]').prop("checked", false);
      }); //click   
      $('#finalAreaCheck6').click(function() {
         var f = $(':input:radio[name=licence1]:checked').val();
         var f2 = $(':input:radio[name=licence2]:checked').val();
         $('#Select-Area').html("<font size='3px'>" + f + " " + f2 + "</font>");
         var k = f+" "+f2;
         $('#rar').attr('value',k);
         alert(document.getElementById("rar").value);
         $(':input:radio[name=licence1]').prop("checked", false);
         $(':input:radio[name=licence2]').prop("checked", false);
      }); //click   
      $('#finalAreaCheck7').click(function() {
         var f = $(':input:radio[name=licence1]:checked').val();
         var f2 = $(':input:radio[name=licence2]:checked').val();
         $('#Select-Area').html("<font size='3px'>" + f + " " + f2 + "</font>");
         var k = f+" "+f2;
         $('#rar').attr('value',k);
         alert(document.getElementById("rar").value);
         $(':input:radio[name=licence1]').prop("checked", false);
         $(':input:radio[name=licence2]').prop("checked", false);
      }); //click   
      $('#finalAreaCheck8').click(function() {
         var f = $(':input:radio[name=licence1]:checked').val();
         var f2 = $(':input:radio[name=licence2]:checked').val();
         $('#Select-Area').html("<font size='3px'>" + f + " " + f2 + "</font>");
         var k = f+" "+f2;
         $('#rar').attr('value',k);
         alert(document.getElementById("rar").value);
         $(':input:radio[name=licence1]').prop("checked", false);
         $(':input:radio[name=licence2]').prop("checked", false);
      }); //click   
      $('#finalAreaCheck9').click(function() {
         var f = $(':input:radio[name=licence1]:checked').val();
         var f2 = $(':input:radio[name=licence2]:checked').val();
         $('#Select-Area').html("<font size='3px'>" + f + " " + f2 + "</font>");
         var k = f+" "+f2;
         $('#rar').attr('value',k);
         alert(document.getElementById("rar").value);
         $(':input:radio[name=licence1]').prop("checked", false);
         $(':input:radio[name=licence2]').prop("checked", false);
      }); //click
      $('#finalAreaCheck10').click(function() {
         var f = $(':input:radio[name=licence1]:checked').val();
         var f2 = $(':input:radio[name=licence2]:checked').val();
         $('#Select-Area').html("<font size='3px'>" + f + " " + f2 + "</font>");
         var k = f+" "+f2;
         $('#rar').attr('value',k);
         alert(document.getElementById("rar").value);
         $(':input:radio[name=licence1]').prop("checked", false);
         $(':input:radio[name=licence2]').prop("checked", false);
      }); //click
      $('#finalAreaCheck11').click(function() {
         var f = $(':input:radio[name=licence1]:checked').val();
         var f2 = $(':input:radio[name=licence2]:checked').val();
         $('#Select-Area').html("<font size='3px'>" + f + " " + f2 + "</font>");
         var k = f+" "+f2;
         $('#rar').attr('value',k);
         alert(document.getElementById("rar").value);
         $(':input:radio[name=licence1]').prop("checked", false);
         $(':input:radio[name=licence2]').prop("checked", false);
      }); //click
      $('#finalAreaCheck12').click(function() {
         var f = $(':input:radio[name=licence1]:checked').val();
         var f2 = $(':input:radio[name=licence2]:checked').val();
         $('#Select-Area').html("<font size='3px'>" + f + " " + f2 + "</font>");
         var k = f+" "+f2;
         $('#rar').attr('value',k);
         alert(document.getElementById("rar").value);
         $(':input:radio[name=licence1]').prop("checked", false);
         $(':input:radio[name=licence2]').prop("checked", false);
      }); //click
      $('#finalAreaCheck13').click(function() {
         var f = $(':input:radio[name=licence1]:checked').val();
         var f2 = $(':input:radio[name=licence2]:checked').val();
         $('#Select-Area').html("<font size='3px'>" + f + " " + f2 + "</font>");
         var k = f+" "+f2;
         $('#rar').attr('value',k);
         alert(document.getElementById("rar").value);
         $(':input:radio[name=licence1]').prop("checked", false);
         $(':input:radio[name=licence2]').prop("checked", false);
      }); //click
      $('#finalAreaCheck14').click(function() {
         var f = $(':input:radio[name=licence1]:checked').val();
         var f2 = $(':input:radio[name=licence2]:checked').val();
         $('#Select-Area').html("<font size='3px'>" + f + " " + f2 + "</font>");
         var k = f+" "+f2;
         $('#rar').attr('value',k);
         alert(document.getElementById("rar").value);
         $(':input:radio[name=licence1]').prop("checked", false);
         $(':input:radio[name=licence2]').prop("checked", false);
      }); //click
      $('#finalAreaCheck15').click(function() {
         var f = $(':input:radio[name=licence1]:checked').val();
         var f2 = $(':input:radio[name=licence2]:checked').val();
         $('#Select-Area').html("<font size='3px'>" + f + " " + f2 + "</font>");
         var k = f+" "+f2;
         $('#rar').attr('value',k);
         alert(document.getElementById("rar").value);
         $(':input:radio[name=licence1]').prop("checked", false);
         $(':input:radio[name=licence2]').prop("checked", false);
      }); //click
      $('#finalAreaCheck16').click(function() {
         var f = $(':input:radio[name=licence1]:checked').val();
         var f2 = $(':input:radio[name=licence2]:checked').val();
         $('#Select-Area').html("<font size='3px'>" + f + " " + f2 + "</font>");
         var k = f+" "+f2;
         $('#rar').attr('value',k);
         alert(document.getElementById("rar").value);
         $(':input:radio[name=licence1]').prop("checked", false);
         $(':input:radio[name=licence2]').prop("checked", false);
      }); //click
      /* 예약인원 설정 부분 */
      $('#downAcmo').click(function(){
         $('#accomodation').removeAttr("readonly");
         var c = $('#accomodation').val();
         if($('#accomodation').val()=='전체인원'){
            $('#accomodation').val(1);
         }
         else if(c==1){
            return false;
         }else{
            $('#accomodation').val(c-1);
         }
      });
      $('#upAcmo').click(function(){
         $('#accomodation').removeAttr("readonly");
         if($('#accomodation').val()=='전체인원'){
            $('#accomodation').val(1);
         }
         var c = $('#accomodation').val();
         $.ajax({
            type:"post",
            url:"${initParam.root}plus.do",
            data:"cnt="+c,
            success:function(data){
               $('#accomodation').val(data.d);
            }
         });
      });
      $('#checkAccomodation1').click(function(){
         $('#accomodation').attr("readonly","readonly");
         $('#accomodation').val("전체인원");
      });
      $('#checkAccomodation2').click(function(){
         if($('#accomodation').val()=='전체인원'){
            $('#Select-Accomodation').html($('#accomodation').val());
            $('#rac').attr("value",$('#accomodation').val());
            alert($('#rac').val());
         }else{
            $('#Select-Accomodation').html($('#accomodation').val()+"명");   
            $('#rac').attr("value",$('#accomodation').val());
            alert(document.getElementById("rac").value);
         }
         
         
      });
   
      $('#checkType').click(function(){
         var t = $(':input:radio[name=licence3]:checked').val();
         $('#Select-Type').html(t);
         if($(':input:radio[name=licence3]:checked').val()=='공간'){
            $('#rty').attr('value','space');   
         }else if($(':input:radio[name=licence3]:checked').val()=='휴테크'){
            $('#rty').attr('value','tech');
         }
         alert($('#rty').val());
         $(':input:radio[name=licence3]').prop("checked", false);
      });
      
      $('#searchButton').click(function(){
          var searchFrm = document.searchByConditionFrm;
         searchFrm.submit();
      });
      
      
   });
   

   $("#tabs").tabs();
   function aa(str) {
      var frm = document.hashFrm;
      frm.hash.value = str;
      frm.submit();
   }
