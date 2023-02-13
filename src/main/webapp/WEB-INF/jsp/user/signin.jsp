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
		<section class="signin-content d-flex justify-content-center">
			<div class="d-flex align-items-center">
				<img height="250" src="https://t1.daumcdn.net/cfile/tistory/99B6AB485D09F2132A">
				<div class=" ml-5">
					<div class="signin-input-box text-center">
						<h2 class="mb-4">Insutaguram</h2>
						<form id="loginForm">
							<input type="text" class="form-control mt-2" placeholder="아이디" id="loginIdInput">
							<input type="password" class="form-control mt-2" placeholder="비밀번호" id="passwordInput">
							<button type="submit" id="loginBtn" class="btn btn-primary btn-block mt-2">로그인</button>
						</form>
						<hr>
						<a href="/user/temppw/view" class="text-secondary small">비밀번호를 잊으셨나요?</a>
					</div>
					<div class="mt-4 text-center box-border">
						<div class="m-4">계정이 없으신가요? <a class="font-weight-bold" href="/user/signup/view">가입하기</a></div>
					</div>
				</div>		
			</div>
			
		
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>

	<script>
		$(document).ready(function() {
			
			$("#loginForm").on("submit", function(e) {
			//로그인 과정에 대한 사용자 편의성 enter 입력으로 로그인 되도록			
			//$("#loginBtn").on("click", function() {
				
				// 해당 이벤트의 기능을 모두 취소한다
				e.preventDefault();
				
				let id = $("#loginIdInput").val();
				let password = $("#passwordInput").val();
				
				if(id == "") {
					alert("아이디를 입력하세요");
					return false;
				}
				
				if(password == "") {
					alert("비밀번호를 입력하세요");
					return false;
				}
				
				$.ajax({
					type:"post"
					, url:"/user/signin"
					, data:{"loginId":id, "password":password}
					, success:function(data) {
						if(data.result == "success") {
							location.href="/post/timeline/view"
						} else {
							alert("아이디와 비밀번호를 확인해주세요");
						}
					}
					, error:function() {
						alert("로그인 에러");
					}
					
				});
					
				return false;	
					
			});
			
		});
	
	</script>

</body>
</html>