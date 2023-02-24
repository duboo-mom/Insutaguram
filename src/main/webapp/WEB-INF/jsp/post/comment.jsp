<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 달기</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-center">
		
			<div width="550" class="cotent-comment-box">
				<div class="my-3">
					<h4 class="text-center">댓글</h4>			
				</div>
				<hr>
				<div class="post-content d-flex">
					<img class="rounded-circle" width="50" src="https://cdn.pixabay.com/photo/2014/11/30/14/11/cat-551554_960_720.jpg">
					<div class="small ml-4 mt-2 mb-2">
						<div class="font-weight-bold large">${postDetail.userName }</div>
						<div>${postDetail.content }</div>
					</div>				
				</div>
				<hr>
				<!-- 댓글들 -->
				<c:forEach var="comment" items="${postDetail.commentList }">
				<div>
					<span class="font-weight-bold">${comment.userName }</span> <span>${comment.content }</span>					
				</div>
				</c:forEach>
				<!-- /댓글들 -->
				
				<div class="d-flex mt-2 mb-4">
					<input type="text" class="form-control" id="commentInput${postDetail.id }" placeholder="${userLoginId } 로 댓글 달기 ">
					<button type="button" class="btn btn-primary ml-2 comment-btn" data-post-id="${postDetail.id }">게시</button>
				</div>
				
			</div>
			<div class="empty-box"></div>
			
			<div class="fixed-menu bg-white d-flex justify-content-center">
				<nav class="main-menu box-border mt-4">
					<ul class="nav nav-fill">
						<li class="nav-item"><a class="nav-link text-dark" href="/post/timeline/view"><i class="bi bi-house"></i></a></li>
						<li class="nav-item"><a class="nav-link text-dark" href="#"><i class="bi bi-search"></i></a></li>
						<li class="nav-item"><a class="nav-link text-dark" href="/post/create/view"><i class="bi bi-pencil-square"></i></a></li>
						<li class="nav-item"><a class="nav-link text-dark" href="/post/mypost/view"><i class="bi bi-person-circle"></i></a></li>
					</ul>		
				</nav>
			</div>			
		
		</div>
						
	</div>
	
	<script>
		$(document).ready(function() {
			
			$(".comment-btn").on("click", function() {
				
				// post id, 작성한 댓글 내용
				let id = $(this).data("post-id");
				
				// id 셀렉터를 문자열 연산으로 완성
				let comment = $("#commentInput" + id).val();
				
				if(comment == "") {
					alert("댓글 내용을 입력하세요");
					return;
				}
				
				$.ajax({
					type:"post"
					, url:"/post/comment/create"
					, data:{"postId":id, "content":comment}
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("댓글 등록 실패");
						}
					}
					, error:function() {
						alert("댓글 등록 에러");
					}
				});
				
			});
			
		});
	
	</script>
</body>
</html>