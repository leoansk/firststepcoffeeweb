package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
	@RequestMapping
	public ModelAndView index(HttpSession session){
		session.setAttribute("loginId", "guest");
		ModelAndView modelAndView = new ModelAndView("index");
		return modelAndView;
	}
	
	@RequestMapping(value="/index/main.do", method=RequestMethod.GET)
	public ModelAndView main(){
		ModelAndView modelAndView = new ModelAndView("template");
		modelAndView.addObject("BODY","DystopiaMainPage.jsp");
		return modelAndView;
	}
	
}
