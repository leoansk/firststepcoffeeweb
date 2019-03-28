package com.ansk.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ansk.web.domain.JoinMemberInfoVO;

@Controller
public class JoinMembershipController {
	private static final Logger logger = LoggerFactory.getLogger(JoinMembershipController.class);
	
	//회원가입
	@RequestMapping(value="joinMembership",method=RequestMethod.GET)
	public String joinMembershipGET() throws Exception{
		//회원가입 jsp로 넘겨준다
		logger.info("회원가입GET");
		return "joinMembership";
	}
	/*
	 * jsp에서 controller로 값을 넘길때 controller에서 사용방식
	 * 1.HttpServletRequest방식 (HttpServletRequest request)
	 * 2.VO방식 (@ModelAttrivute NameVO nameVO)
	 * 3.@RequestParam (@RequestParam String name)
	 */
	@RequestMapping(value="joinMembership",method=RequestMethod.POST)
	public String joinMembershipPOST(@ModelAttribute JoinMemberInfoVO join) throws Exception{
		
		//회원가입 service처리 후 로그인 화면으로 넘겨
		logger.info("회원가입POST");
		return "about";
	} 
}