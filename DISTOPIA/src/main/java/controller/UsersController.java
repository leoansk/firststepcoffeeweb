package controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.Rank;
import model.RankList;
import model.Users;
import model.UsersListA;

@Controller
public class UsersController {
	@Autowired
	private SqlSession sqlsession;
	
	
	//Master page 에 있는거
	@RequestMapping(value="/users/popForm.do", method=RequestMethod.POST)
	public ModelAndView test(){
		System.out.println("test 컨트롤러 진입");
		ModelAndView modelAndView = new ModelAndView("template");
	    modelAndView.addObject("BODY","our_info.jsp");
	    return modelAndView;
	}
	//mainpage하단에 dystopia클릭 했을 때
	@RequestMapping(value="/users/ourinfo.do", method=RequestMethod.GET)
	public ModelAndView mainDystopiaButtonClick(){
		System.out.println("our_info 컨트롤러 진입");
		ModelAndView modelAndView = new ModelAndView("template");
	    modelAndView.addObject("BODY","our_info.jsp");
	    return modelAndView;
	}
	
	//mypage에서 수정 클릭 했을때
	@RequestMapping(value="/users/updateButtonClick.do", method=RequestMethod.POST)
	 public ModelAndView updateButtonClick(HttpSession session, String us_password, String us_name, String us_age, String us_gender, String us_address, String us_email, String us_phone, String us_birthday){
	      System.out.println("수정하기 controller 진입");
		  //수정한 회원정보 model로 저장
	  	  
	      //login한 유저 아이디 세션에서 불러옴
	      String loginId = (String)session.getAttribute("loginId");
		  
	      Users users = new Users();
		  users.setUs_id(loginId);
		  users.setUs_password(us_password);
		  users.setUs_name(us_name);
		  users.setUs_age(us_age);
		  users.setUs_gender(us_gender);
		  users.setUs_address(us_address);
		  users.setUs_email(us_email);
		  users.setUs_phone(us_phone);
		  users.setUs_birthday(us_birthday);
		  
		  System.out.println("모델에 저장된 아이디 출력:"+users.getUs_id());
		  //model에 저장된 자료 db에 업데이트
	      sqlsession.update("dystopia.updateUser",users);
	      System.out.println("db에 업데이트 완료");
	      List<Users> usersListA = sqlsession.selectList("dystopia.selectUserRead",loginId); 
			List<Rank> rankList = sqlsession.selectList("dystopia.selectRankRead",loginId);	
			
			UsersListA userslist = new UsersListA();
			RankList ranklist = new RankList();
			
			Iterator usersit = usersListA.iterator();
			Iterator rankit = rankList.iterator();
			
			//여기서 일단 로그인 되 있는 세션 가져와서 디비 검색 후 넣어줌
			for(int i=0; i<usersListA.size();i++){
				if(usersit.hasNext()){ 
					Users users1 = (Users)usersit.next();
					userslist.setUs_number(i, users1.getUs_number());
					userslist.setUs_id(i, users1.getUs_id());
					userslist.setUs_password(i, users1.getUs_password());
					userslist.setUs_age(i, users1.getUs_age());
					userslist.setUs_gender(i, users1.getUs_gender());
					userslist.setUs_address(i, users1.getUs_address());
					userslist.setUs_email(i, users1.getUs_email());
					userslist.setUs_phone(i, users1.getUs_phone());
					userslist.setUs_birthday(i, users1.getUs_birthday());
					userslist.setUs_photo(i, users1.getUs_photo());
					userslist.setUs_name(i, users1.getUs_name());
					
					System.out.println(users.getUs_name());
					System.out.println(users.getUs_photo());
					System.out.println("위에 사진 유무 판단");
					}else{
					break;
				}
			}
			for(int i=0; i<rankList.size();i++){
				if(rankit.hasNext()){ 
					Rank rank = (Rank)rankit.next();
					ranklist.setRank_number(i, rank.getRank_number());
					ranklist.setUs_number(i, rank.getUs_number());
					ranklist.setRank_kitchen(i, rank.getRank_kitchen());
					ranklist.setRank_life(i, rank.getRank_life());
					ranklist.setRank_tv(i, rank.getRank_tv());
					ranklist.setRank_digitalcamera(i, rank.getRank_digitalcamera());
					ranklist.setRank_desktop(i, rank.getRank_desktop());
					ranklist.setRank_notebook(i, rank.getRank_notebook());
					ranklist.setRank_2in1(i, rank.getRank_2in1());
					ranklist.setRank_peripheral_com(i, rank.getRank_peripheral_com());
					ranklist.setRank_smartphone(i, rank.getRank_smartphone());
					ranklist.setRank_tablet(i, rank.getRank_tablet());
					ranklist.setRank_smartwatch(i, rank.getRank_smartwatch());
					ranklist.setRank_peripheral_smart(i, rank.getRank_peripheral_smart());
					ranklist.setRank_furniture(i, rank.getRank_furniture());
					ranklist.setRank_clothing(i, rank.getRank_clothing());
					ranklist.setRank_sport(i, rank.getRank_sport());
					ranklist.setRank_stationery(i, rank.getRank_stationery());
					}else{
					break;
				}
			}
			
			ModelAndView modelAndView = new ModelAndView("template");
			modelAndView.addObject("Users_LIST",userslist); //회원 가입한 유저
			modelAndView.addObject("Rank_LIST",ranklist); //유저의 카테고리 별 랭킹 점수
			
	      //변경 되었다는 새로운 jspform 적용 시키면됨
	      modelAndView.addObject("BODY","user_mypage.jsp");
	      return modelAndView;
	  	}

	//mypage click했을때
	@RequestMapping(value="/users/read.do", method=RequestMethod.GET)
	public ModelAndView mypageButtonClick(HttpSession session){
		System.out.println("users, rank controller 들어옴");
		
		//login한 유저 아이디 세션에서 불러옴
		String loginId = (String)session.getAttribute("loginId");
		
		//괜히 리스트로 받아줬다.
		List<Users> usersListA = sqlsession.selectList("dystopia.selectUserRead",loginId); 
		List<Rank> rankList = sqlsession.selectList("dystopia.selectRankRead",loginId);	
		
		UsersListA userslist = new UsersListA();
		RankList ranklist = new RankList();
		
		Iterator usersit = usersListA.iterator();
		Iterator rankit = rankList.iterator();
		
		//여기서 일단 로그인 되 있는 세션 가져와서 디비 검색 후 넣어줌
		for(int i=0; i<usersListA.size();i++){
			if(usersit.hasNext()){ 
				Users users = (Users)usersit.next();
				userslist.setUs_number(i, users.getUs_number());
				userslist.setUs_id(i, users.getUs_id());
				userslist.setUs_password(i, users.getUs_password());
				userslist.setUs_age(i, users.getUs_age());
				userslist.setUs_gender(i, users.getUs_gender());
				userslist.setUs_address(i, users.getUs_address());
				userslist.setUs_email(i, users.getUs_email());
				userslist.setUs_phone(i, users.getUs_phone());
				userslist.setUs_birthday(i, users.getUs_birthday());
				userslist.setUs_photo(i, users.getUs_photo());
				userslist.setUs_name(i, users.getUs_name());
				
				System.out.println(users.getUs_name());
				System.out.println(users.getUs_photo());
				System.out.println("위에 사진 유무 판단");
				}else{
				break;
			}
		}
		for(int i=0; i<rankList.size();i++){
			if(rankit.hasNext()){ 
				Rank rank = (Rank)rankit.next();
				ranklist.setRank_number(i, rank.getRank_number());
				ranklist.setUs_number(i, rank.getUs_number());
				ranklist.setRank_kitchen(i, rank.getRank_kitchen());
				ranklist.setRank_life(i, rank.getRank_life());
				ranklist.setRank_tv(i, rank.getRank_tv());
				ranklist.setRank_digitalcamera(i, rank.getRank_digitalcamera());
				ranklist.setRank_desktop(i, rank.getRank_desktop());
				ranklist.setRank_notebook(i, rank.getRank_notebook());
				ranklist.setRank_2in1(i, rank.getRank_2in1());
				ranklist.setRank_peripheral_com(i, rank.getRank_peripheral_com());
				ranklist.setRank_smartphone(i, rank.getRank_smartphone());
				ranklist.setRank_tablet(i, rank.getRank_tablet());
				ranklist.setRank_smartwatch(i, rank.getRank_smartwatch());
				ranklist.setRank_peripheral_smart(i, rank.getRank_peripheral_smart());
				ranklist.setRank_furniture(i, rank.getRank_furniture());
				ranklist.setRank_clothing(i, rank.getRank_clothing());
				ranklist.setRank_sport(i, rank.getRank_sport());
				ranklist.setRank_stationery(i, rank.getRank_stationery());
				}else{
				break;
			}
		}
		
		ModelAndView modelAndView = new ModelAndView("template");
		modelAndView.addObject("Users_LIST",userslist); //회원 가입한 유저
		modelAndView.addObject("Rank_LIST",ranklist); //유저의 카테고리 별 랭킹 점수
		
		modelAndView.addObject("BODY","user_mypage.jsp");
		return modelAndView;
	}
}
