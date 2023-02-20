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
		<div class="cotent-comment-box">
			<div class="my-3">
				<h4 class="text-center">댓글</h4>			
			</div>
			<hr>
			<div class="post-content d-flex">
				<img class="rounded-circle" width="50" src="https://cdn.pixabay.com/photo/2014/11/30/14/11/cat-551554_960_720.jpg">
				<div class="small ml-4 mt-2 mb-2">
					<div class="font-weight-bold large">mizzong</div>
					<div>어ㅉㅓ구 저쩌구...</div>
				</div>				
			</div>
			<hr>
			<!-- 댓글들 -->
			<div>
				<span class="font-weight-bold">duboo</span> <span>어쩌구저쩌구 내가 머라햇어</span>					
			</div>
			<div>
				<span class="font-weight-bold">kiki</span> <span>떡볶이 맛나보인당</span>					
			</div>
			<!-- /댓글들 -->
			
			<div class="d-flex">
				<input type="text" class="form-control mt-5" placeholder="${userName} 으로 댓글달기">
				<button class="btn btn-primary">게시</button>			
			</div>
			
		</div>
	
	</div>

</body>
</html>