package controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import logic.ProductLogic;
import model.Image;
import model.Product;

@Controller
public class ProimageController {
	@Autowired
	private SqlSession sqlsession;
	@Autowired
	ProductLogic pl;
	
	@RequestMapping(value="/product/insert.do", method=RequestMethod.POST)
	public ModelAndView insert(@RequestParam HashMap<String, Object> map){
		
		return null;
	}
}
