package controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import logic.BoardService;
import model.UserInfo;

@Controller
public class MembershipController {
	@Autowired
	BoardService boardService;
	
	@Autowired
	private SqlSession sqlSession;

	// 회원가입 페이지 show
	@RequestMapping(value = "/membership/membershipShow.do", method = RequestMethod.GET)
	public ModelAndView show() {
		ModelAndView modelAndView = new ModelAndView("Membership.jsp");
		return modelAndView;
	}

	//Id 중복체크 컨트롤러
	@RequestMapping(value = "/membership/idDupCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public String idDupCheck(HttpServletRequest request){
		System.out.println("중복체크 컨트롤러 진입");
		//해당되는 아이디 갯수
		int chkPoint = sqlSession.selectOne("dystopia.dupIdCnt", request.getParameter("user_id"));
		
		//해당 아이디가 없을경우
		if(chkPoint == 0)
			return "0";
		else //해당 아이디가 있을경우
			return "1";
	}
		
	// DB에 insert
	@RequestMapping(value = "/membership/insert.do", method = RequestMethod.POST)
	public ModelAndView insert(@Valid UserInfo userinfo, HttpSession session, MultipartHttpServletRequest mRequest) {
		int usnumber = 0;
		int rankNumber = 0;
		
		// 글번호 갱신
		int maxUsnumber = sqlSession.selectOne("dystopia.selectMaxSeqno");
		if (maxUsnumber >= 0) {
			usnumber = maxUsnumber + 1;
		}
		int maxRankNumber = sqlSession.selectOne("dystopia.selectRankMaxSeqno");
		if (maxRankNumber >= 0) {
			rankNumber = maxRankNumber + 1;
		}
		System.out.println(usnumber);
		System.out.println(userinfo.getUsid());
		System.out.println(userinfo.getUspassword());
		System.out.println(userinfo.getUsgender());
		System.out.println(userinfo.getUsaddress());
		System.out.println(userinfo.getUsemail());
		System.out.println(userinfo.getUsphone());
		System.out.println(userinfo.getUsbirthday());
		System.out.println(userinfo.getUsname());
		System.out.println(userinfo.getUstreasure());
		if(userinfo.getUsphoto() == null){
			System.out.println("사진이 널이다 제발 ");
		}
		// 빈 생성
//		UserInfo userInfo = new UserInfo();
//		Rank rank = new Rank();
		
		
		try{
			HashMap<String,Object> map = new HashMap<String, Object>();
			map.put("usphoto", userinfo.getUsphoto().getBytes());
			map.put("usnumber", usnumber);
			map.put("usid", userinfo.getUsid());
			map.put("uspassword", userinfo.getUspassword());
			map.put("usgender", userinfo.getUsgender());
			map.put("usaddress", userinfo.getUsaddress());
			map.put("usemail", userinfo.getUsemail());
			map.put("usphone", userinfo.getUsphone());
			map.put("usbirthday", userinfo.getUsbirthday());
			map.put("usname", userinfo.getUsname());
			map.put("ustreasure", userinfo.getUstreasure());
			
			
			sqlSession.insert("dystopia.insertUserInfo",map);
		}catch(Exception e){
			
		}
		String membership="membership";
		boardService.fileUpload(mRequest,usnumber,membership);
		//id 중복체크
		ModelAndView modelAndView = new ModelAndView("template");
//		if (id.equals("")) {
//			modelAndView.addObject("ID", id);
//			return modelAndView;
//		} else {
			// db insert
//			System.out.println(hgender);
			//sqlSession.insert("dystopia.insertUserInfo", userinfo);
//			sqlSession.insert("dystopia.insertPoint", rank);
//			modelAndView.addObject("id", userinfo.getUsid());
			session.setAttribute("loginId", userinfo.getUsid());
			modelAndView.addObject("BODY","loginresult.jsp");
			return modelAndView;
//		}
	}
}
