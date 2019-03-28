package controller;

import java.util.HashMap;
import java.util.List;

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
import model.Likes;
import model.Product;
import model.ProductList;

@Controller
public class ProductController {
	@Autowired
	BoardService boardService;
	
	@Autowired
	ProductLogic pl;
	
	@Autowired
	SqlSession sqlsession;
	
	@RequestMapping 	//get으로 받을 때(페이지 돌려주는 빈 메소드)
	public ModelAndView sendRequest(String page){
		System.out.println("sendrequest controller");
		ModelAndView modelAndView = new ModelAndView(page);
		return modelAndView;
	}
	@RequestMapping(value="/product/insertLike.do", method=RequestMethod.POST)
	public ModelAndView insertLike(HttpSession session, String proNum){
		System.out.println("zj");
		Integer pro_number = Integer.parseInt(proNum);
		System.out.println(pro_number);
		String userId = (String)session.getAttribute("loginId");
		System.out.println(userId);
		Integer UserNumber = sqlsession.selectOne("dystopia.selectUserNum",userId);
		Integer likeSeq= sqlsession.selectOne("dystopia.selectLikeSeq"); 
		String date=pl.returnDate();
		String memo = "";
		Likes likes = new Likes();
		likes.setLike_date(date);
		likes.setLike_memo(memo);
		likes.setLike_number(likeSeq+1);
		likes.setPro_number(pro_number);
		likes.setUs_number(UserNumber);
		sqlsession.insert("dystopia.insertLikes",likes);
		return pl.returnContent(pro_number, session);
	}
	
	
	//싱품 불러오기
	@RequestMapping(value="/product/read.do", method=RequestMethod.GET)
	public ModelAndView read(Integer SCnum){
		return pl.returnProRead(SCnum);
	}	
	
	
	@RequestMapping(value="/product/beatproduct.do", method=RequestMethod.GET)
	public ModelAndView bestproduct(){
		System.out.println("메인페이지 사진불러오기");
		List<Product> productList = sqlsession.selectList("dystopia.selectBestProduct");
		ProductList list= pl.proList(productList);
		ModelAndView modelAndView = new ModelAndView("template");
		modelAndView.addObject("Product_LIST",list);
		modelAndView.addObject("BODY","../jsp/DystopiaMainPage.jsp");
		return modelAndView;

		
	}
	


	
	
	
	
	
	//상품등록===========================================================
	@RequestMapping(value="/product/proinsertview.do", method=RequestMethod.GET)
	public ModelAndView proinsertview(){
		ModelAndView modelAndView = new ModelAndView("template");
		modelAndView.addObject("BODY","../DK/pro_insert.jsp");
		return modelAndView;
	}
	
	
	@RequestMapping(value="/product/insert.do", method=RequestMethod.POST)
	public ModelAndView insert(@RequestParam HashMap<String, String> map, 
			MultipartHttpServletRequest mRequest, HttpSession session){
		System.out.println("pro insert controller");
		System.out.println("sc_number : "+Integer.parseInt(map.get("sc_number")));
		//DB저장
		Integer proSeq = sqlsession.selectOne("dystopia.selectProSeq");
		if(proSeq == null) proSeq=0;
		System.out.println("seqNum : "+proSeq);
		String date = pl.returnDate();
		Product pro = new Product();
		pro.setPro_number(proSeq+1); 	
		pro.setPro_name(map.get("pro_name"));
		pro.setPro_price(Integer.parseInt(map.get("pro_price")));
		pro.setPro_explain(map.get("pro_explain"));
		pro.setSc_number(Integer.parseInt(map.get("sc_number")));
		pro.setPro_modelname(map.get("pro_modelname"));
		pro.setPro_date(date);
		pro.setPro_maker(map.get("pro_maker"));
		sqlsession.insert("dystopia.insertProduct",pro);
		ModelAndView modelAndView = new ModelAndView("template");
		modelAndView.addObject("BODY","../DK/pro_insert.jsp");
		modelAndView.addObject("title","상품 등록");
		
		String products = "products";
		boardService.fileUpload(mRequest,proSeq+1,products);	//사진생성
		return pl.returnProRead(Integer.parseInt(map.get("sc_number")));
	}
	//=============================================================
	//상품 내용
	@RequestMapping(value="/product/viewContent.do", method=RequestMethod.GET)
	public ModelAndView viewContent(HttpSession session,@RequestParam HashMap<String, String> map){
		Integer proNum=Integer.parseInt(map.get("proNum"));
		System.out.println(proNum);
		return pl.returnContent(proNum,session);
	}
	
}
