package controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import logic.UtopiaLogic;
import model.UtopiaList;


@Controller
public class PageController {
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	UtopiaLogic ulogic;

	@RequestMapping(value="/page/page.do", method=RequestMethod.GET)
	public ModelAndView read(Integer page_no,Integer f_seq,Integer l_seq,HttpSession session){
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("페이지처리 시작");
		UtopiaList list = new UtopiaList();
		if(f_seq != null){
			list = ulogic.readPrevBoard(f_seq); //이전페이지가 널이아니면
		}else if(l_seq != null){
			list = ulogic.readNextBoard(l_seq);

		}else if(page_no != null){
			list = ulogic.readPageBoard(page_no);
		}else {
			list = ulogic.readBoard();
			list.setFirstPage(true);
		}
		list.setPageNum(ulogic.readPageNum());
		list.setPageNum(ulogic.readPageNum());
		ModelAndView modelAndView = new ModelAndView("template");
		modelAndView.addObject("BODY","../HDYJSP/utopia.jsp");
		System.out.println("글목록 건수:"+list.getListSize());
		modelAndView.addObject("list",list);
		modelAndView.addObject("loginId",loginId);
		return modelAndView;
	}
	//=================================================================================

//=================댓글페이지처리==============================
}
