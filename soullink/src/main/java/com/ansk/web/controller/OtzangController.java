package com.ansk.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/otzang/*")
public class OtzangController {
	private static final Logger logger = LoggerFactory.getLogger(OtzangController.class);

	
	@RequestMapping(value="/otzangTestPage", method= RequestMethod.GET)
	public String otzangTestPage() throws Exception{
		//저장한 사진을 디비에서 가져온다
		logger.info("otzangTestPage......");
		return "/otzang/otzangTest";
	}
}
