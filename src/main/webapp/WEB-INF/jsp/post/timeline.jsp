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
				<div class="users-post mt-3">
					<div class="user my-2">
						<img class="rounded-circle" width="50" src="https://cdn.pixabay.com/photo/2014/11/30/14/11/cat-551554_960_720.jpg">
						<span class="font-weight-bold large ml-2">mizzong</span>
					</div>
					<img width="550" src="https://cdn.pixabay.com/photo/2017/07/27/16/48/toppokki-2545943_960_720.jpg">
					<div class="icons my-2">
						<i class="bi bi-heart mr-2"></i>
						<i class="bi bi-chat mr-2"></i> 
						<i class="bi bi-bookmark-plus"></i>
					</div>
					<div class="font-weight-bold">
						좋아요 20개
					</div>
					<div class="contents my-2">
						피드 작성 내용 블라블라~~~~전직대통령의 신분과 예우에 관하여는 법률로 정한다. 대통령은 국회에 출석하여 발언하거나 서한으로 의견을 표시할 수 있다. 이 헌법시행 당시의 법령과 조약은 이 헌법에 위배되지 아니하는 한 그 효력을 지속한다.					
					</div>
					<div class="comments">
						<div>
							<span class="font-weight-bold">duboo</span> <span>어쩌구저쩌구 내가 머라햇어</span>					
						</div>
						<div>
							<span class="font-weight-bold">kiki</span> <span>떡볶이 맛나보인당</span>					
						</div>
					</div>			
				</div>
			</div>
						
		</section>
		<div class="d-flex justify-content-center">
			<nav class="main-menu box-border mt-4">
				<ul class="nav nav-fill">
					<li class="nav-item"><a class="nav-link text-dark" href="/post/timeline/view"><i class="bi bi-house"></i></a></li>
					<li class="nav-item"><a class="nav-link text-dark" href="#"><i class="bi bi-search"></i></a></li>
					<li class="nav-item"><a class="nav-link text-dark" href="/post/create/view"><i class="bi bi-pencil-square"></i></a></li>
					<li class="nav-item"><a class="nav-link text-dark" href="/post/mypost/view"><i class="bi bi-person-circle"></i></a></li>
				</ul>		
			</nav>
		</div>				
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>

	<script>
		$(document).ready(function() {
			
		});
	
	</script>

</body>
</html>