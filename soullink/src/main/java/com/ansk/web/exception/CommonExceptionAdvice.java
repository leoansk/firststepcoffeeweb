package com.ansk.web.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

//@ControllerAdvice는 해당객체가 스프링의 컨트롤러에서 발생하는 예외를 처리하는 존재임을 명시하는 용도로 사용.
//@ExceptionHandler는 해당 메서드가 () 들어가는 예외 타입을 처리한다는 것을 의미한다.
//ExceptionHandler 어노테이션의 속성으로는 Exception클래스 타입을 지정할 수 있다.
//1.클래스에 @ControllerAdvice 애노테이션 처리 2.각 메소드에 @ExceptionHandler를 이용해서 적절한 타입의 Exception을 처리

@ControllerAdvice
public class CommonExceptionAdvice {

  private static final Logger logger = LoggerFactory.getLogger(CommonExceptionAdvice.class);

  //@ExceptionHandler(Exception.class)
  public String common(Exception e) {

    logger.info(e.toString());

    return "error_common";
  }
  
  //Exception.class로 지정하였으모로 모든 예외에 대한 처리가 errorModelAndView만을 이용해서 처리된다.
  @ExceptionHandler(Exception.class)
  private ModelAndView errorModelAndView(Exception ex) {

    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("/error_common");
    modelAndView.addObject("exception", ex);
    //error_common.jsp에서는 BoardController의 실행 중에 발생하는 Exception을 상세하게 볼수 있다.
    return modelAndView;
  }
  
  //404(was 내부에서 발생하는 에러)에러 처리해서 뷰로 넘겨주기
  @ExceptionHandler(NoHandlerFoundException.class)
  @ResponseStatus(HttpStatus.NOT_FOUND)
  public String handle404(NoHandlerFoundException ex) {
	  return "custom404";
  }

}


