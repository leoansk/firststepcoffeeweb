package controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

//아이디, 패스워드 찾아주는 페이지 컨드롤러
@Controller
public class IdpwfindController {

	@Autowired
	private SqlSession sqlSession;
	
	//ID,PW 찾기 페이지로 이동
	@RequestMapping
	public ModelAndView sendRequest(String page, String what){
		ModelAndView modelAndView = new ModelAndView(page);
		 modelAndView.addObject("what",what);
		return modelAndView;
	}
	
	//ID,PW 링크 클릭시 
	@RequestMapping(value="/idpwfind/confirm.do", method=RequestMethod.GET)    
	   public ModelAndView confirm(String page, String what){
		  ModelAndView modelAndView = new ModelAndView("template");
	      System.out.println(what);
		  modelAndView.addObject("BODY",page);  
		  modelAndView.addObject("what",what);    
	      return modelAndView;
	   }
	
	//ID,PW를 DB에서 가져와서 다음페이지로 전송
	@RequestMapping(value="/idpwfind/view.do", method=RequestMethod.POST)
	public ModelAndView view(String treasure, String idOrPw){
		System.out.println("컨트롤러 성공");
		String result="";
		System.out.println(treasure);
		System.out.println(idOrPw);
		if(idOrPw.equals("ID")){//ID찾기를 클릭했을 경우
			result = sqlSession.selectOne("dystopia.selectIdTre",treasure);
			System.out.println("ID:"+result);
		}else if(idOrPw.equals("PW")){//PW찾기를 클릭했을 경우
			result = sqlSession.selectOne("dystopia.selectPwTre",treasure);
			System.out.println("PW:"+result);
		}
	
		ModelAndView modelAndView = new ModelAndView("template");//힌트(보물)입력 창으로 전환
		modelAndView.addObject("result",result);
		modelAndView.addObject("idOrPw",idOrPw);
		modelAndView.addObject("BODY","../jsp/idPwView.jsp");
		return modelAndView;
		
	}
}
