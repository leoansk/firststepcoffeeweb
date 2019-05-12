package com.ansk.web.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

//로그인 성공 이후에 특정한 동작을 하도록 제어하고 싶을경우 AuthenticationSuccessHandler 인터페이스를 구현하여 사용

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
		log.warn("Login Success");
		
		List<String> roleNames = new ArrayList<>();
		
		//로그인 한 사용자에 부여된 권한 Authentication객체를 이용해서 사용자가 가진 모든 권한을 문자열로 체크 
		authentication.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		
		log.warn("ROLE NAMES: " + roleNames);
		//만약 사용자가 ROLE_ADMIN권한을 가졌다면 로그인 후에 바로 '/sample/admin'으로 이동하게 하는 방식
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/sample/admin");
			return;
		}
		
		if(roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect("/sample/member");
			return;
		}
		response.sendRedirect("/");
	
	}
}
