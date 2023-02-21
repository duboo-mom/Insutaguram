<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인수타구램 타임라인</title>

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
		<section class="ml-3 d-flex justify-content-center">			
			<div class="post-box">
				
				<c:forEach var="post" items="${postList }">
				<!-- 피드 -->
				<div class="users-post mt-3">
					<div class="user my-2 d-flex justify-content-between align-items-center">
						<div class="d-flex">
							<img class="rounded-circle" width="50" src="https://cdn.pixabay.com/photo/2014/11/30/14/11/cat-551554_960_720.jpg">
							<div class="ml-2">
								<span class="font-weight-bold large ml-2">${post.userName }</span>
								<div class="small ml-2">${post.location }</div>						
							</div>						
						</div>
						<i class="bi bi-three-dots"></i>
					</div>

					<img width="550" src="${post.imagePath }">
					<div class="icons my-2">
						${post.like }
						<i class="bi bi-heart mr-2 like-btn" data-post-id="${post.id }"></i>
						<a style="text-decoration:none" href="/post/comment/view" class="bi bi-chat mr-2 text-dark" data-post-id="${post.id }"></a>
						<i class="bi bi-bookmark-plus"></i>
					</div>
					<div class="font-weight-bold">
						좋아요 ${post.likeCount }개
					</div>
					<div class="contents my-2">
						${post.content }					
					</div>
					<!-- 댓글 들 -->
					<div class="comments">
						<hr>
						<div>
							<span class="font-weight-bold">duboo</span> <span>어쩌구저쩌구 내가 머라햇어</span>					
						</div>
						<div>
							<span class="font-weight-bold">kiki</span> <span>떡볶이 맛나보인당</span>					
						</div>
						<div class="d-flex mt-2 mb-4">
							<input type="text" class="form-control" id="commentInput${post.id}">
							<!-- <input type="text" class="form-control" name="${post.id}">  -->
							<button type="button" class="btn btn-primary ml-2 comment-btn" data-post-id="${post.id }">게시</button>
						</div>
					</div>
					<!-- /댓글 들 -->			
				</div>
				<!-- 피드 -->
				</c:forEach>
			</div>
						
		</section>
		
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

	<script>
		$(document).ready(function() {
			
			
			$(".like-btn").on("click", function() {
				
				// 해당하는 버튼에 대응되는 post id 를 얻어오기
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get"
					, url:"/post/like"
					, data:{"postId":postId}
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("좋아요 실패");
						}
					}
					, error:function() {
						alert("좋아요 에러");
					}
				});
				
			});
			
			
			$(".comment-btn").on("click", function() {
				
				// post id, 작성한 댓글 내용
				let id = $(this).data("post-id");
				
				// 형제 태그들 중에 바로 이전에 있는 태그를 가져오는 prev()
				// let comment = $(this).prev().val();
				
				// 나는 name 속성 사용했는데 선생님 풀이에서는 id로 만듦
				// id 셀렉터를 문자열 연산으로 완성
				let comment = $("#commentInput" + id).val();
				// let comment = $("input[name=" + id + "]").val();
				
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