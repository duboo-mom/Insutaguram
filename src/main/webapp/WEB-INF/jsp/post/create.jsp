<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 게시글</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>
<body>

	<div class="container">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<hr>
		<section class="d-flex justify-content-center">
		
			<div class="post-input-box">
				<div class="mt-4 d-flex justify-content-between">
					<div></div>
					<h3>새 게시글</h3>
					<button type="button" id="uploadBtn" class="btn btn-primary">올리기</button>
				</div>
				<hr>
				<textarea id="contentInput" rows="15" class="form-control" placeholder="내용을 입력해주세요"></textarea>
				<input id="locationInput" type="text" class="form-control my-3" placeholder="위치 추가">
				<input id="fileInput" type="file" class="d-none">
				<div id="imageUploadBtn" class="upload-icon"><i class="bi bi-image"></i></div>
				<hr>
			</div>
		
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	
	<script>
	
		$(document).ready(function() {
			
			$("#imageUploadBtn").on("click", function() {
				// 파일 인풋을 클릭한 효과
				$("#fileInput").click();
			});
			
			
			$("#uploadBtn").on("click", function() {
				let content = $("#contentInput").val();
				let locationInput = $("#locationInput").val();
				// let file = $("#fileInput").val();
				
				if(content == "") {
					alert("내용을 입력하세요");
					return;
				}
				
				// if(file == "") {
				//	alert("사진을 첨부하세요");
				//	return;
				// }
				
				if($("#fileInput")[0].files.length == 0) {
					alert("사진을 첨부해주세요");
					return;
				}
				
				var formData = new FormData();
				formData.append("content", content);
				formData.append("location", locationInput);
				formData.append("file", $("#fileInput")[0].files[0]);
				
				$.ajax({
					type:"post"
					, url:"/post/create"
					, data:formData
					, enctype:"multipart/form-data"
					, processData:false
					, contentType:false
					, success:function(data) {
						if(data.result == "success") {
							location.href="/post/timeline/view";							
						} else {
							alert("게시글 업로드 실패");
						}
					}
					, error:function() {
						alert("게시글 업로드 에러");
					}
					
				});
				
				
			});
			
			
		});
		
	</script>
	
	
</body>
</html>