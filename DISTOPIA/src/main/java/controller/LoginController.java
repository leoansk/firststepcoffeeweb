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

import logic.ProductLogic;
import model.Product;
import model.ProductList;
import model.Rank;
import model.RankList;
import model.Users;
import model.UsersListA;

@Controller
public class LoginController {

	@Autowired
	private SqlSession sqlSession;
	

	@Autowired
	ProductLogic pl;

	// 메인페이지에서 로그인버튼 클릭시_로그인 페이지 show
	@RequestMapping(value = "/login/loginShow.do", method = RequestMethod.GET)
	public ModelAndView loginShow() {
		ModelAndView modelAndView = new ModelAndView("template");// 메인 페이지로 전환
		modelAndView.addObject("BODY", "Login.jsp");
		return modelAndView;
	}

	// LOGIN 버튼을 눌렀을 때
	@RequestMapping(value = "/login/loginButtonClick.do", method = RequestMethod.POST)
	public ModelAndView loginButtonClick(HttpSession session, String id, String pw) {
		System.out.println("login controller");
		ModelAndView modelAndView = null;

		// DB에서 select(일치하는 ID,PW)
		String strPW = sqlSession.selectOne("dystopia.selectPw", id);
		System.out.println(strPW);

		// 마스터 아이디-비번 확인하기
		String masterId = "Master";
		if (strPW != null) {
			if (strPW.equals(masterId)) {
				System.out.println("마스터 컨트롤러 진입");
				System.out.println("마스터권한 아이디/비번 일치");
				session.setAttribute("loginId", id);

				System.out.println(session.getAttribute("loginId"));

				List<Users> usersListA = sqlSession.selectList("dystopia.selectUserReadAll");
				List<Rank> rankList = sqlSession.selectList("dystopia.selectRankReadAll");

				UsersListA userslist = new UsersListA();
				RankList ranklist = new RankList();

				Iterator usersit = usersListA.iterator();
				Iterator rankit = rankList.iterator();

				int usersSize = usersListA.size();
				System.out.println("유저리스트 사이즈 : " + usersSize);

				// 여기서 일단 로그인 되 있는 세션 가져와서 디비 검색 후 넣어줌
				for (int i = 0; i < usersListA.size(); i++) {
					if (usersit.hasNext()) {
						Users users = (Users) usersit.next();
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

						System.out.println("사진추가해줘야함..");
					} else {
						break;
					}
				}
				for (int i = 0; i < rankList.size(); i++) {
					if (rankit.hasNext()) {
						Rank rank = (Rank) rankit.next();
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
					} else {
						break;
					}
				}

				modelAndView = new ModelAndView("template");

				modelAndView.addObject("Users_LIST", userslist); // 회원 가입한 유저
				modelAndView.addObject("Rank_LIST", ranklist); // 유저의 카테고리 별 랭킹
																// 점수
				modelAndView.addObject("Users_LIST_SIZE", usersSize);
				modelAndView.addObject("BODY", "master_page.jsp");
				return modelAndView;
			}
		}
		// 추가추가 마지막

		// 같은 PW가 있을 경우 페이지 전환. 없을경우 에러메세지
		if (strPW != null) {
			if (strPW.equals(pw)) {// 패스워드가 일치할 때
				session.setAttribute("loginId", id);
				System.out.println("id" + id);
				List<Product> productList = sqlSession.selectList("dystopia.selectBestProduct");
				ProductList list= pl.proList(productList);
				modelAndView = new ModelAndView("template");// 메인페이지로 이동
				modelAndView.addObject("Product_LIST",list);
				modelAndView.addObject("BODY", "../jsp/DystopiaMainPage.jsp");

			} else {// 패스워드가 일치하지 않을 때
				modelAndView = new ModelAndView("template");
				modelAndView.addObject("BODY", "../jsp/Login.jsp");
				modelAndView.addObject("errorMessage", "패스워드가 일치하지 않습니다.");
			}
		} else {
			modelAndView = new ModelAndView("template");
			modelAndView.addObject("BODY", "../jsp/Login.jsp");
			modelAndView.addObject("errorMessage", "패스워드를 다시 입력해주세요.");
		}

		return modelAndView;
	}

	// JOIN 버튼을 눌렀을 때
	@RequestMapping(value = "/login/joinShow.do", method = RequestMethod.GET)
	public ModelAndView joinShow() {
		ModelAndView modelAndView = new ModelAndView("template");// 회원가입 폼으로 전환
		modelAndView.addObject("BODY", "../jsp/memberTest.jsp");
		return modelAndView;
	}

	@RequestMapping(value = "/login/Master.do", method = RequestMethod.GET)
	public ModelAndView Master() {
		List<Users> usersListA = sqlSession.selectList("dystopia.selectUserReadAll");
		List<Rank> rankList = sqlSession.selectList("dystopia.selectRankReadAll");

		UsersListA userslist = new UsersListA();
		RankList ranklist = new RankList();

		Iterator usersit = usersListA.iterator();
		Iterator rankit = rankList.iterator();

		int usersSize = usersListA.size();
		System.out.println("유저리스트 사이즈 : " + usersSize);

		// 여기서 일단 로그인 되 있는 세션 가져와서 디비 검색 후 넣어줌
		for (int i = 0; i < usersListA.size(); i++) {
			if (usersit.hasNext()) {
				Users users = (Users) usersit.next();
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

				System.out.println("사진추가해줘야함..");
			} else {
				break;
			}
		}
		for (int i = 0; i < rankList.size(); i++) {
			if (rankit.hasNext()) {
				Rank rank = (Rank) rankit.next();
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
			} else {
				break;
			}
		}

		ModelAndView modelAndView = new ModelAndView("template");// 회원가입 폼으로 전환
		modelAndView = new ModelAndView("template");
		modelAndView.addObject("Users_LIST", userslist); // 회원 가입한 유저
		modelAndView.addObject("Rank_LIST", ranklist); // 유저의 카테고리 별 랭킹 점수
		modelAndView.addObject("Users_LIST_SIZE", usersSize);
		modelAndView.addObject("BODY", "../jsp/master_page.jsp");
		return modelAndView;
	}

}
