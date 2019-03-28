package controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import logic.BoardService;
import logic.ProductLogic;
import model.Review;
import model.ReviewCheck;
import model.ReviewPointCheck;

@Controller
public class ReviewController {
	@Autowired
	BoardService boardService;
	@Autowired
	ProductLogic pl;
	@Autowired
	SqlSession sqlsession;
	
	@RequestMapping
	public ModelAndView goInsert(){
		ModelAndView modelAndView = new ModelAndView("DK/insert_Review");
		modelAndView.addObject("title","리뷰 쓰기");
		return modelAndView;
	}
	@RequestMapping(value="/review/insert.do", method=RequestMethod.POST)
	public ModelAndView insert(HttpSession session, 
			@RequestParam HashMap<String, String> map, MultipartHttpServletRequest mRequest){
		System.out.println("insert controller");
		System.out.println(map.get("content"));
		System.out.println(map.get("title"));
		System.out.println(map.get("pro_number"));
		String user_id = (String)session.getAttribute("loginId");
		if(user_id==null) user_id="test";
		Integer intUserNum = sqlsession.selectOne("dystopia.selectUserNum",user_id);
		ReviewCheck reck = new ReviewCheck();
		
		Integer rev_number = sqlsession.selectOne("dystopia.selectReviewSeq");
		if(rev_number==null) rev_number=0;
		
		String date = pl.returnDate();
		Review re = new Review();
		Integer pro_number = Integer.parseInt(map.get("pro_number"));
		Integer userProductScore = Integer.parseInt(map.get("rev_point"));
		if(userProductScore==null) userProductScore=3;
		
		re.setPro_numer(pro_number);
		re.setRev_content(map.get("content"));
		re.setRev_date(date);
		re.setRev_number(rev_number+1);
		re.setRev_point(0);
		re.setRev_title(map.get("title"));
		re.setUs_number(intUserNum);
		re.setRev_userproductscore(userProductScore);
		
		
		reck.setRev_number(rev_number+1);
		reck.setRevck_costeff(point(map.get("revck_costeff")));
		reck.setRevch_design(point(map.get("revch_design")));
		reck.setRevch_performance(point(map.get("revch_performance")));
		reck.setRevch_as(point(map.get("revch_as")));
		reck.setRevch_durability(point(map.get("revch_durability")));
		sqlsession.insert("dystopia.insertReview",re);
		sqlsession.insert("dystopia.insertReviewCheck",reck);
		String review = "review";
		boardService.fileUpload(mRequest,rev_number+1,review);	//사진생성
		
		return pl.returnContent(pro_number,session);
	}

	@RequestMapping(value="/review/deletereview.do", method=RequestMethod.GET)
	public ModelAndView deleteReview(HttpSession session, String reviewNum, String pro_number){
		Integer proNum=Integer.parseInt(pro_number);
		Integer reviewN=Integer.parseInt(reviewNum);
		sqlsession.delete("dystopia.deleteReviewcheck",reviewN);
		sqlsession.delete("dystopia.deleteReview",reviewN);
		
		return pl.returnContent(proNum,session);
	}
	@RequestMapping(value="/review/selectreview.do", method=RequestMethod.GET)
	public ModelAndView selectReview(String reviewNum){
		Integer reviewN=Integer.parseInt(reviewNum);
		Review review = sqlsession.selectOne("dystopia.selectReview",reviewN);
		
		ModelAndView modelAndView = new ModelAndView("template");
		modelAndView.addObject("review_List",review);
		modelAndView.addObject("BODY","../DK/reviewUpdate.jsp");
		return modelAndView;
	}
	@RequestMapping(value="/review/update.do", method=RequestMethod.POST)
	public ModelAndView updateReview(HttpSession session, @RequestParam HashMap<String,String> map){
		String date = pl.returnDate();
		ReviewCheck reck = new ReviewCheck();
		Review re = new Review();
		Integer pro_number = Integer.parseInt(map.get("pro_number"));
		re.setPro_numer(pro_number);
		re.setRev_content(map.get("content"));
		re.setRev_date(date);
		re.setRev_number(Integer.parseInt(map.get("rev_number")));
		re.setRev_point(Integer.parseInt(map.get("rev_point")));
		re.setRev_title(map.get("title"));
		re.setUs_number(Integer.parseInt(map.get("us_number")));
		re.setRev_userproductscore(Integer.parseInt(map.get("setRev_userproductscore")));
		
		reck.setRev_number(Integer.parseInt(map.get("rev_number")));
		reck.setRevck_costeff(point(map.get("revck_costeff")));
		reck.setRevch_design(point(map.get("revch_design")));
		reck.setRevch_performance(point(map.get("revch_performance")));
		reck.setRevch_as(point(map.get("revch_as")));
		reck.setRevch_durability(point(map.get("revch_durability")));
		sqlsession.update("dystopia.updateReview",re);
		sqlsession.update("dystopia.updateReviewCheck",reck);
		
		return pl.returnContent(pro_number,session);
	}
	@RequestMapping(value="/review/updateReviewScore.do")
	public ModelAndView updateReviewScore(HttpSession session,
			String sc, String reviewNum, String proNum){
		String userId = (String)session.getAttribute("loginId");
		Integer userNum = sqlsession.selectOne("dystopia.selectUserNum",userId);
		Integer scNum = Integer.parseInt(sc);
		Integer pro_number = Integer.parseInt(proNum);
		Integer rev_number = Integer.parseInt(reviewNum);
		ModelAndView modelAndView = pl.returnContent(pro_number,session);
		System.out.println("추천한 유저 : "+userNum);
		ReviewPointCheck rpc = new ReviewPointCheck();
		rpc.setRev_number(rev_number);
		rpc.setUs_number(userNum);
		
		Integer pointedUserNum = sqlsession.selectOne("dystopia.selectPointUser",rpc);
		System.out.println("검색된 유저 : "+pointedUserNum);
		System.out.println("추천되는 리뷰 : "+rev_number);
		
		if(pointedUserNum ==null){
			System.out.println("유저 없음");
		Integer beforeRP = sqlsession.selectOne("dystopia.selectReviewPoint",rev_number);
		Integer afterRP = beforeRP+scNum;
		Review review = new Review();
		review.setRev_point(afterRP);
		review.setRev_number(rev_number);
		sqlsession.update("dystopia.updateReviewPoint",review);
		Integer ReviewPointCheckSeq = sqlsession.selectOne("dystopia.selectReviewPointCheckSeq");
		if(ReviewPointCheckSeq==null) ReviewPointCheckSeq=0;
		rpc.setRpc_number(ReviewPointCheckSeq+1);
		System.out.println("리턴된 시퀀스 넘버 : "+ReviewPointCheckSeq);
		sqlsession.insert("dystopia.insertPointUser",rpc);
		}
		else if(userNum == pointedUserNum){
			System.out.println("유저 있음");
		}
		return pl.returnContent(pro_number, session);
	}
	
	
	private Integer point(String onOff){
		if(onOff==null) return 0; 
		else return 1;
	}
	
}
