package com.ansk.web.aop;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.ansk.web.controller.BoardController;

//Spring AOP 연습
@Aspect
@Component
public class LogAdvice {
	private static final Logger logger = LoggerFactory.getLogger(LogAdvice.class);
	
	//logBefore() 메소드를 실행시키기 전에 밑에걸 실행시켜라
	@Before("execution(* com.ansk.web.service.SampleService*.*(..))")
	public void logBefore() {
		logger.info("==============LogAdivice @Before===============");
	}
}
