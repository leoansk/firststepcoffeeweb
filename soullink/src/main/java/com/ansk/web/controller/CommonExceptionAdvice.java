package com.ansk.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

//@ControllerAdvice는 호출되는 메소드에서 발생된 Exception을 모두 처리하는 역할을 합니다.
//1.클래스에 @ControllerAdvice 애노테이션 처리 2.각 메소드에 @ExceptionHandler를 이용해서 적절한 타입의 Exception을 처리

@ControllerAdvice
public class CommonExceptionAdvice {

  private static final Logger logger = LoggerFactory.getLogger(CommonExceptionAdvice.class);

  //@ExceptionHandler(Exception.class)
  public String common(Exception e) {

    logger.info(e.toString());

    return "error_common";
  }

  @ExceptionHandler(Exception.class)
  private ModelAndView errorModelAndView(Exception ex) {

    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("/error_common");
    modelAndView.addObject("exception", ex);
    //error_common.jsp에서는 BoardController의 실행 중에 발생하는 Eception을 상세하게 볼수 있다.
    return modelAndView;
  }

}


