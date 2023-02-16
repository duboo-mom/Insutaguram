<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시 비밀번호 발급</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	
</head>
<body>
	<div id="container">
		<div class="empty-box"></div>
		<section class="d-flex justify-content-center">
			<div class="pw-box text-center box-border pl-5 pr-5 py-4">
				<h2 class="my-3">Insutaguram</h2>
				<h6 class="my-5">비밀번호를 잊었나요?</h6>
				
				<input type="text" class="form-control mb-3" placeholder="id 입력">
				<input type="text" class="form-control mb-3" placeholder="email 입력">
				
				<button type="button" class="btn btn-dark btn-block">임시 비밀번호 발급</button>
				
				<input type="text" class="form-control my-4" placeholder="임시 비밀번호">
				<a href="/user/signin/view">로그인 화면으로</a>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>

</body>
</html>