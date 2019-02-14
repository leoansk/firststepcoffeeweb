package com.ansk.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	//첫 화면
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		logger.info("Welcome home!");
		
		return "mainPage";
	}
	//현재 설정된 mainPage
	@RequestMapping(value = "mainPage", method = RequestMethod.GET)
	public String mainPage() {
		logger.info("Main page!");
		
		return "mainPage";
	}
	
	//aboutPage
	@RequestMapping(value = "aboutPage", method = RequestMethod.GET)
	public String aboutPage() {
		logger.info("About page!");
		
		
		return "aboutPage";
	}
	
	//menuPage
	@RequestMapping(value= "menuPage", method = RequestMethod.GET)
	public String menuPage() {
		logger.info("Menu Page!");
		return "menuPage";
	}
	
	//boardPage
	@RequestMapping(value= "boardPage", method = RequestMethod.GET)
	public String boardPage() {
		logger.info("board Page");
		return "boardPage";
	}
}