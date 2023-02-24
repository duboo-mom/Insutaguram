package com.duboomom.insutaguram.common;

import java.io.IOException;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class PermissionInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler) throws IOException {
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		
		String uri = request.getRequestURI();
		
		// 로그인 된 경우
		if(userId != null) {
			// /user로 시작하는 페이지로 접근시도할 경우 메모 리스트 보여주기
			if(uri.startsWith("/user")) {
				response.sendRedirect("/post/list/view");
				return false;
			}
			
		} else { // 로그인 안된 경우
			// /post 로 시작하는 페이지로 접근 안되고 로그인페이지 보여주기
			if(uri.startsWith("/post")) {
				response.sendRedirect("/user/signin/view");
				return false;
			}
		}
		
		return true;		
		
	}
	
	@Override
	public void postHandle(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler
			, ModelAndView modelAndView) {
		
	}
	
	@Override
	public void afterCompletion(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler
			, Exception ex) {
		
	}
	
}
