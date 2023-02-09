<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인수타구램 로그인</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
</head>
<body>
	<div id="wrap">
		<div class="empty-box"></div>
		<section class="signin-content d-flex align-items-center justify-content-center">
			<img width="300" height="300" src="https://t1.daumcdn.net/cfile/tistory/99B6AB485D09F2132A">
			<div class="signin-box ml-5">
				<div class="signin-input-box text-center">
					<h2 class="mb-2">Insutaguram</h2>
					<input type="text" class="form-control mt-2" placeholder="아이디">
					<input type="text" class="form-control mt-2" placeholder="비밀번호">
					<button type="button" class="btn btn-primary btn-block mt-2">로그인</button>
					<hr>
					<a href="/user/temppw/view" class="text-secondary small">비밀번호를 잊으셨나요?</a>
				</div>
				<div class="mt-4 text-center">
					<div>계정이 없으신가요? <a class="font-weight-bold" href="/user/signup/view">가입하기</a></div>
				</div>
			</div>
		
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>

</body>
</html>