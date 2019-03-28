package controller;

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

@Controller
public class LogoutController {
	
	
	@Autowired
	ProductLogic pl;
	
	@Autowired
	SqlSession sqlsession;
	
	
	@RequestMapping(value="/logout/logout.do", method=RequestMethod.POST)
	public ModelAndView loginShow(HttpSession session){
//		session.removeAttribute("loginId");
		session.setAttribute("loginId", "guest");
		ModelAndView modelAndView = new ModelAndView("template");//메인 페이지로 전환
		List<Product> productList = sqlsession.selectList("dystopia.selectBestProduct");
		ProductList list= pl.proList(productList);
		modelAndView = new ModelAndView("template");// 메인페이지로 이동
		modelAndView.addObject("Product_LIST",list);
		modelAndView.addObject("BODY", "../jsp/DystopiaMainPage.jsp");
		
		return modelAndView;
	}

}
