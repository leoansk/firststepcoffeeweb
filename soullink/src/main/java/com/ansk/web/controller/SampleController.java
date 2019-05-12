package com.ansk.web.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/sample/*")
public class SampleController {
	
	@GetMapping("/all")
	public void doAll() {
		log.info("do all can access everybody");
	}
	@GetMapping("/member")
	public void doMember() {
		log.info("logined member");
	}
	@GetMapping("/admin")
	public void doAdmin() {
		log.info("admin only");
	}
	
	//허가되지 않은 사용자 접근 제어 페이지 Authentication 타입의 파라미터를 받도록 설계해서 필요한 경우 사용자의 정보를 확인할 수 있도록 한다.
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied: " + auth);
		
		model.addAttribute("msg","Access Denied");
	}
	
	//login Page직접 만들어서 접근
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		log.info("error: " + error);
		log.info("logout: " + logout);
		
		if(error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		if(logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
	}
	
	//logout Page
	@GetMapping("/customLogout")
	public void logoutGET() {
		log.info("custom logout");
	}
	
	@PostMapping("/customLogout")
	public void logoutPost() {
		log.info("post custom logout");
	}
}
