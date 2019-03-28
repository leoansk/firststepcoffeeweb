package controller;

import java.util.List;

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
public class SearchController {

	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	ProductLogic pl;
	
	@RequestMapping(value="/search/searchPro.do", method=RequestMethod.POST)   
	private ModelAndView searchPro(String search){
		System.out.println("search"+search);
		String title= "검색결과";
		List<Product> productList = sqlsession.selectList("utopia.searchPro",search);		
		ProductList list = pl.proList(productList);
		ModelAndView modelAndView = new ModelAndView("template");
		modelAndView.addObject("title",title);
		modelAndView.addObject("Product_LIST",list);
		modelAndView.addObject("BODY","../DK/pro_read.jsp");
		return modelAndView;
	}

}
