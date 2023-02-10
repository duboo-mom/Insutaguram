<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
</head>
<body>
	<section class="signup-content mt-5 d-flex justify-content-center align-items-center">
		<div class="m-3 signup-main">
			<div class="box-border mb-4">
				<h2 class="text-center mt-5 mb-3">Insutaguram</h2>
				<h6 class="text-center text-secondary font-weight-bold">친구들의 사진과 동영상을 보려면 <br> 가입하세요.</h6>
				<div class="m-4">
					<div class="d-flex">
						<input type="text" class="form-control" placeholder="아이디" id="loginidInput">
						<button class="btn btn-primary ml-2" id="duplicateBtn">중복확인</button>			
					</div>			
					
					<div class="small text-info d-none" id="availableId">사용가능한 아이디 입니다.</div>
					<div class="small text-danger d-none" id="duplicatedId">중복된 아이디 입니다.</div>
					
					<input type="password" class="form-control mt-3" placeholder="비밀번호" id="passwordInput">
					<input type="password" class="form-control mt-3" placeholder="비밀번호 확인" id="passwordConfirm">
					<input type="text" class="form-control mt-3" placeholder="사용자 이름" id="nameInput">
					<input type="text" class="form-control mt-3" placeholder="이메일" id="emailInput">
					<button type="button" class="btn btn-primary btn-block my-5" id="joinBtn">가입하기</button>
				</div>			
			</div>
			<div class="box-border text-center">
				<div class="mt-3 mb-3">계정이 있으신가요? <a href="/user/signin/view">로그인</a> </div>
			</div>		
		
		</div>
	</section>
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	
	<script>
		$(document).ready(function() {
			
			var isCheckedId = false;
			var isDuplicateId = true;
			
			$("#loginidInput").on("input", function() {
				isCheckedId = false;
				isDuplicateId = true;
				
				$("#availableId").addClass("d-none");
				$("#duplicatedId").addClass("d-none");
			});
			
			$("#duplicateBtn").on("click", function() {
								
				let id = $("#loginidInput").val();
				
				if(id == "") {
					alert("아이디를 입력하세요");
					return;
				}
				
				$.ajax({
					type:"get"
					, url:"/user/duplicate_id"
					, data:{"loginId":id}
					, success:function(data) {
						isCheckedId = true;
						
						if(data.is_duplicate) {
							isDuplicateId = true;
							$("#duplicatedId").removeClass("d-none");
							$("#availableId").addClass("d-none");
						} else {
							isDuplicateId = false;
							$("#availableId").removeClass("d-none");
							$("#duplicatedId").addClass("d-none");
						}
					}
					, error:function() {
						alert("중복체크 에러");
					}
					
				});
				
			});
			
			$("#joinBtn").on("click", function() {
				
				let id = $("#loginidInput").val();
				let password = $("#passwordInput").val();
				let passwordConfirm = $("#passwordConfirm").val();
				let name = $("#nameInput").val();
				let email = $("#emailInput").val();
				
				if(id == "") {
					alert("아이디를 입력하세요");
					return;
				}
				
				// 중복체크 유효성 검사
				if(!isCheckedId) {
					alert("아이디 중복확인을 해주세요");
					return;
				}
				
				// 아이디 중복여부 유효성 검사
				// 중복된 상태로 회원가입 버튼을 눌렀을때
				if(isDuplicateId) {
					alert("중복된 아이디 입니다");
					return;
				}
				
				if(password == "") {
					alert("비밀번호를 입력하세요");
					return;
				}
				
				if(password != passwordConfirm) {
					alert("비밀번호가 일치하지 않습니다");
					return;
				}
				
				if(name == "") {
					alert("이름을 입력하세요");
					return;
				}
				
				if(email == "") {
					alert("이메일을 입력하세요");
					return;
				}
				
				$.ajax({
					type:"post"
					, url:"/user/signup"
					, data:{"loginId":id, "password":password, "name":name, "email":email}
					, success:function(data) {
						if(data.result == "success") {
							location.href="/user/signin/view"
						} else {
							alert("회원가입 실패");
						}
					}
					, error:function() {
						alert("회원가입 에러");
					}
				});
				
			});
			
			
		});
	
	
	</script>
	
</body>
</html>