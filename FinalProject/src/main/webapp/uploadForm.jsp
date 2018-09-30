<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
$(function() {
	$('#upload').on("change", previewImages_Master);
	$('#uploads').on("change", previewImages_Sub);
	
	function previewImages_Master() {
		var $preview = $('#preview_master').empty();
		if (this.files)
			$.each(this.files, readAndPreview);
	
		function readAndPreview(i, file) {
			
			if(i>5){
				return alert("5개 이상 등록 안돼")
			}
			else if (!/\.(jpe?g|png|gif)$/i.test(file.name)) {
				return alert(file.name + " is not an image");
			} // else...
			var reader = new FileReader();
	
			$(reader).on("load", function() {
				$preview.append($("<img/>",	{src : this.result, width:100, height : 100}));
			});
			reader.readAsDataURL(file);
		}
	}
	function previewImages_Sub() {
		var $preview = $('#preview_sub').empty();
		if (this.files)
			$.each(this.files, readAndPreview);
	
		function readAndPreview(i, file) {
			
			if(i<5){
				if (!/\.(jpe?g|png|gif)$/i.test(file.name)) {
					return alert(file.name + " is not an image");
				} // else...
				var reader = new FileReader();
		
				$(reader).on("load", function() {
					$preview.append($("<img/>",	{src : this.result, width:100, height : 100}));
				});
				reader.readAsDataURL(file);
			}//if
			else{
				alert("5개 이상 안돼");
				return false;
			}
		}
	}
});
</script>	
</head>
<body>
	<div class="form-group">
		<label for="label-registerProduct">대표이미지</label>
		<div id="preview_master" class="form-control" style="width: 170px; height: 114px;" >
			<div>*대표이미지를 설정*</div>
		</div><p>						 	
		<p><label for="upload" class="form-control" style="width: 110px;">이미지 선택</label><p>
			<input id="upload" name="upload" type="file" style="display: none;"><br>
			
		<label for="label-registerProduct">상세이미지</label>
		<div id="preview_sub" class="form-control" style="width:530px; height: 114px;" >
			<div>*이미지 최대 5개<br>
			*JPEG, PNG, GIF 파일형식만 가능!</div>
			</div><p>
		<p><label for="uploads" class="form-control" style="width: 110px;">이미지 선택</label><p>
			<input id="uploads" name="uploads" type="file" multiple="multiple" style="display: none;">

					<p class="help-block"></p>
	</div><!-- form-group -->
</body>
</html>