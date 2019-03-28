package logic;

import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import model.Likes;
import model.Product;
import model.ProductList;
import model.Review;
import model.ReviewCheck;
import model.ReviewCheckList;
import model.ReviewList;
import model.ReviewPointCheck;
import model.ReviewPointCheckList;
import model.UsersList;

@Service
public class ProductLogic {
	
	@Autowired
	SqlSession sqlsession;
	
	public ModelAndView returnProRead(Integer SCnum){
		String title = title(SCnum);
		List<Product> productList = sqlsession.selectList("dystopia.selectProRead",SCnum);
		ProductList list = proList(productList);
		ModelAndView modelAndView = new ModelAndView("template");
		modelAndView.addObject("title",title);
		modelAndView.addObject("Product_LIST",list);
		modelAndView.addObject("BODY","../DK/pro_read.jsp");
		return modelAndView;
	}
	public ModelAndView returnContent(Integer pro_number, HttpSession session){
		String userId = (String)session.getAttribute("loginId");
		if(userId==null) userId="guest";
		Integer us_number = sqlsession.selectOne("dystopia.selectUserNum",userId);
		// user 정보를 select 해서 pro_number 뭐가있는지
		Likes likes = new Likes();
		likes.setUs_number(us_number);
		likes.setPro_number(pro_number);
		Integer proresult = sqlsession.selectOne("selectUserProNum",likes);
		if(proresult == null ){
			proresult = 0; //없는거
			
		}else if(proresult != null){
			
			proresult = 1; //있는거
		}
		System.out.println("proresult"+proresult);
		//========================
		Product pro = sqlsession.selectOne("dystopia.selectProContent",pro_number);
		Float avgScore = sqlsession.selectOne("dystopia.selectProScore",pro_number);
		if(avgScore==null) avgScore=(float)-1.0;
		Review review = new Review();
		review.setPro_number(pro_number);
		review.setUs_number(us_number);
		List<Review> reviewList = sqlsession.selectList("dystopia.selectReviewlist",review);
		ReviewList rlist = reviewList(pro_number, reviewList);
		ReviewCheckList clist = reviewCheckList(pro_number, reviewList);
		UsersList ulist = usersList(pro_number, reviewList);
		ReviewCheck keyword = sqlsession.selectOne("dystopia.selectKeyWord",pro_number);
		List<Review> bestReviewList = sqlsession.selectList("dystopia.selectBestReview",pro_number);
		UsersList bestUlist = bestUlist(bestReviewList);
		ReviewList bestRlist = bestRlist(bestReviewList);
		List<ReviewPointCheck> reviewPointCheckList = 
				sqlsession.selectList("dystopia.selectPointCheck", us_number);
		ReviewPointCheckList rpc = reviewPointCheckList(reviewPointCheckList);
		
		ModelAndView modelAndView = new ModelAndView("template");
		modelAndView.addObject("title","상품 리뷰");
		modelAndView.addObject("keyword",keyword);
		modelAndView.addObject("score",avgScore);
		modelAndView.addObject("Product_LIST",pro);
		modelAndView.addObject("review_list",rlist);
		modelAndView.addObject("check_list",clist);
		modelAndView.addObject("user_list",ulist);
		modelAndView.addObject("BODY","../DK/pro_content.jsp");
		modelAndView.addObject("Bestreview_list",bestRlist);
		modelAndView.addObject("Bestuser_list",bestUlist);
		modelAndView.addObject("ProResultNum",proresult);
		modelAndView.addObject("reviewPointCheck_list",rpc);
		return modelAndView;
	}
	public ReviewPointCheckList reviewPointCheckList
	(List<ReviewPointCheck> reviewPointCheckList){
		ReviewPointCheckList reviewPointChecklist = new ReviewPointCheckList();
		Iterator it = reviewPointCheckList.iterator();
		for(int i=0; i<reviewPointCheckList.size();i++){
			if(it.hasNext()){ 
				ReviewPointCheck revpoint = (ReviewPointCheck)it.next();
				reviewPointChecklist.setRev_number(i, revpoint.getRev_number());
				reviewPointChecklist.setRpc_number(i, revpoint.getRpc_number());
				reviewPointChecklist.setUs_number(i, revpoint.getUs_number());
			}else break;}
		return reviewPointChecklist;
	}
	public UsersList bestUlist(List<Review> bestReviewList){
		UsersList bestUlist = new UsersList();
		Iterator it = bestReviewList.iterator();
		for(int i=0; i<bestReviewList.size();i++){
			if(it.hasNext()){ 
				Review rev = (Review)it.next();
				bestUlist.setUs_id(i, rev.getUs_id());
			}else break;}
		return bestUlist;
	}

	public ReviewList bestRlist(List<Review> bestReviewList){
		ReviewList bestRlist = new ReviewList();
		Iterator it = bestReviewList.iterator();
		for(int i=0; i<bestReviewList.size();i++){
			if(it.hasNext()){ 
				Review rev = (Review)it.next();
				bestRlist.setRev_content(i, rev.getRev_content());
				bestRlist.setRev_date(i, rev.getRev_date());
				bestRlist.setRev_number(i, rev.getRev_number());
				bestRlist.setRev_point(i, rev.getRev_point());
				bestRlist.setRev_title(i, rev.getRev_title());
				bestRlist.setRev_userproductscore(i, rev.getRev_userproductscore());
			}else break;}
		return bestRlist;
	}
	public ProductList proList(List<Product> productList){
		ProductList list = new ProductList();
		Iterator it = productList.iterator();
		for(int i=0; i<productList.size();i++){
			if(it.hasNext()){ 
				Product pro = (Product)it.next();
				list.setPro_photo(i, pro.getPro_photo());
				list.setPro_number(i, pro.getPro_number());
				list.setPro_name(i, pro.getPro_name());
				list.setPro_modelname(i, pro.getPro_modelname());
				if(pro.getPro_avgscore()==null) pro.setPro_avgscore(-1);
				list.setPro_avgscore(i, pro.getPro_avgscore());
			}else{break;}
		}
		return list;
	}
	public UsersList usersList(int proNum, List<Review> reviewList){
		UsersList ulist = new UsersList();
		Iterator it = reviewList.iterator();
		for(int i=0; i<reviewList.size();i++){
			if(it.hasNext()){ 
				Review rev = (Review)it.next();
				ulist.setUs_id(i, rev.getUs_id());
				ulist.setUs_photoname(i, rev.getUs_photoname());
			}else break;
		}
		return ulist;
	}
	public ReviewList reviewList(int proNum, List<Review> reviewList){
		Integer checkedUser=0;
		ReviewList rlist = new ReviewList();
		Iterator it = reviewList.iterator();
		for(int i=0; i<reviewList.size();i++){
			if(it.hasNext()){ 
				Review rev = (Review)it.next();
				rlist.setRev_content(i, rev.getRev_content());
				rlist.setRev_date(i, rev.getRev_date());
				rlist.setRev_number(i, rev.getRev_number());
				rlist.setRev_photo1(i, rev.getRev_photo1());
				rlist.setRev_photo2(i, rev.getRev_photo2());
				rlist.setRev_photo3(i, rev.getRev_photo3());
				rlist.setRev_point(i, rev.getRev_point());
				rlist.setRev_title(i, rev.getRev_title());
				rlist.setRev_userproductscore(i, rev.getRev_userproductscore());
//				if(rev.getCheckedUser()==null) {
//					checkedUser=0;
//				}else{
//					checkedUser=1;
//				}
				//rlist.setCheckedUser(i, checkedUser);
			}else break;}
		return rlist;
	}
	
	public ReviewCheckList reviewCheckList(int proNum, List<Review> reviewList){
		ReviewCheckList clist = new ReviewCheckList();
		Iterator it = reviewList.iterator();
		for(int i=0; i<reviewList.size();i++){
			if(it.hasNext()){ 
				Review rev = (Review)it.next();
				clist.setRevch_as(i, rev.getRevch_as());
				clist.setRevch_design(i, rev.getRevch_design());
				clist.setRevch_durability(i, rev.getRevch_durability());
				clist.setRevch_performance(i, rev.getRevch_performance());
				clist.setRevck_costeff(i, rev.getRevck_costeff());
			}else break;}
		return clist;
	}
	
	public String getStrCal(int cal){//한자리면 앞에 0붙여주는 메서드
		String strRtn="";
		if(cal<10) strRtn="0"+cal;
		else strRtn=""+cal;
		return strRtn;
	}
	public String returnDate(){
		Calendar today = Calendar.getInstance();
		String date = getStrCal(today.get(Calendar.YEAR));
		date += "/"+getStrCal(today.get(Calendar.MONTH)+1);
		date += "/"+getStrCal(today.get(Calendar.DATE));
		date += " "+getStrCal(today.get(Calendar.HOUR_OF_DAY));
		date += ":"+getStrCal(today.get(Calendar.MINUTE));
		date += ":"+getStrCal(today.get(Calendar.SECOND));
		return date;
	}
	public String title(Integer SCnum){
		String title="";
		switch(SCnum){
		case 1: title="주방가전"; break;
		case 2: title="생활가전"; break;
		case 3: title="티비"; break;
		case 4: title="디카"; break;
		case 5: title="데스크탑"; break;
		case 6: title="노트북"; break;
		case 7: title="2in1"; break;
		case 8: title="주변기기"; break;
		case 9: title="스마트폰"; break;
		case 10: title="테블릿"; break;
		case 11: title="스마트워치"; break;
		case 12: title="주변기기"; break;
		case 13: title="가구"; break;
		case 14: title="의류"; break;
		case 15: title="스포츠"; break;
		case 16: title="문구"; break;
		}
		return title;
	}
}
