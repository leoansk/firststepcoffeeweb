package com.ansk.web.controller;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ansk.web.domain.JoinMemberInfoVO;
import com.ansk.web.service.MembershipManagementService;

@Controller
public class JoinMembershipController {
	private static final Logger logger = LoggerFactory.getLogger(JoinMembershipController.class);
	
	@Inject
	private MembershipManagementService service;
	
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
	 * -> nameVO 객체가 view 단까지 전달됨(사실 일반적인 형태의(get,set이 있고 일반적인 dto형태)는 
	 * @ModelAttrivute안해줘도 자동으로 view까지 객체가 넘어간다)
	 * 사용해야 할 경우는 일반적인 int형 같은 원시 데이터로 받을땐 뷰까지 안넘어가므로 앞에다 @ModelAttribute를 사용해주면
	 * 뷰화면까지 넘어간다
	 * 3.@RequestParam (@RequestParam("username") String name) 
	 * -> 파라미터로 사용된 변수의 이름과 전달되는 파라미터의 이름이 다른경우에 유용하게 사용
	 */
	@RequestMapping(value="joinMembership",method=RequestMethod.POST)
	public ModelAndView joinMembershipPOST(JoinMemberInfoVO join, HttpServletRequest request) throws Exception{
//		System.out.println(request.getParameter("id"));
		System.out.println("자동으로 받아오지?");
		System.out.println(join.getId());
//		join.setId(request.getParameter("id"));
//		System.out.println(join.getId());
		
		//회원가입 service처리 후 로그인 화면으로 넘겨
		logger.info("회원가입POST");
		service.create(join);
		logger.info("회원가입 완료");
		
		//데이터와 뷰를 동시에 설정이 가능
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mainPage"); //view로 보낼 이름
		mv.addObject("join",join);
		mv.addObject("result", "true");
		
		return mv;
	}
	
	@RequestMapping(value="checkId")
	@ResponseBody
	//ResponseBody는 결과를 리턴할 때 해당 메소드를 호출한 함수의 dataType에 따라서 객체를 리턴한다.
	public int checkUserId(JoinMemberInfoVO join) throws Exception{
		HashMap<String,Object> map = new HashMap<String,Object>();
		System.out.println("체크 데이터 값은?? "+join.getId());
		map.put("id", join.getId());
		int checkResult = service.selectUserId(map);
		System.out.println("DB에서 아이디 검색 완료고 리턴된 숫자는?"+checkResult);
		return checkResult;
	}
	
}