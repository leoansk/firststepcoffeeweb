package com.ansk.web.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import lombok.extern.log4j.Log4j;

//spring web security에서 AccessDeniedHandler 인터페이스를 직접 구현할 경우
//즉 허용되지 않은 사용자가 admin page로 접근할 경우 접근제한에 걸리는경우 리다이렉트로 동작하도록 설계
@Log4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler{
	
	//handle() 메서드는 하나고 HttpServletRequest,Response를 파라미터로 사용하기 때문에 직접적으로 서블릿 api를 이용하는 처리가 가능하다
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException) throws IOException, ServletException {
		
		log.error("Access Denied Handler");
		log.error("Redirect...");
		
		response.sendRedirect("/sample/accessError");
	}

}
