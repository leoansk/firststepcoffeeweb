package com.ansk.web.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ansk.web.dto.Test;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/otzang/*")
public class OtzangController {
	private static final Logger logger = LoggerFactory.getLogger(OtzangController.class);
	
	
	@RequestMapping(value="/otzangTestPage", method= RequestMethod.GET)
	public String otzangTestPage() throws Exception{
		//저장한 사진을 디비에서 가져온다
		logger.info("otzangTestPage......");
		return "/otzang/otzangTest";
	}
	
	
	@RequestMapping(value="/exUploadPost", method=RequestMethod.POST)
	public String exUploadPost(ArrayList<MultipartFile> files) {
		files.forEach(file -> {
			logger.info("--------------");
			logger.info("name" + file.getOriginalFilename());
			logger.info("size:"  + file.getSize());
		});
		return "/otzang/otzangTest";
	}
	
	//jsp와 controller 데이터 주고 받기 test
	@RequestMapping(value="/javascriptTest", method=RequestMethod.GET)
	public String javascriptTest() {
		logger.info("javascriptTest Controller 진입성공");
		
		return "/otzang/otzangTest";
	}
	//fail retest
	@RequestMapping(value="/ajaxTest", method= RequestMethod.GET)
	public String ajaxText(@RequestParam("ajaxTest") ModelMap ajaxTest) {
		logger.info("ajaxTest Controller 진입성공");
		logger.info(ajaxTest.toString());
		return "/otzang/otzangTestPage";
	}
	
	
	//성공함
	@RequestMapping(value="/test", method= RequestMethod.GET)
	public @ResponseBody Test test(Test test) {
		logger.info("테스트 중입니다.");
		logger.info("잘 출력되나?"+test.key_1 + test.key_2);
		return test;
	}
}