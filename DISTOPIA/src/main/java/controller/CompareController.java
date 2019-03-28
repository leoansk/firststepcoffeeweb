package controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.Check;
import model.CheckList;
import model.Memo;
import model.Temp;

@Controller
public class CompareController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/compare/compare.do", method=RequestMethod.POST)
	public ModelAndView compare(HttpSession session, String[] check, String[] delete){
		System.out.println("compare controller");
		String usId = (String)session.getAttribute("loginId");
		//체크가 0개이면 메세지
		//체크가 5개이상이면 메세지
		//체크가 1~4개일때만 보내준다
		CheckList list = new CheckList();
		for(int i=0;i<check.length;i++){//체크된 것을 검색
			Temp temp = new Temp();
			temp.setUsId(usId);
			temp.setCheck(check[i]);
			Check chk = sqlSession.selectOne("likehome.selectCheck", temp);
			System.out.println("여기"+temp);
			if(chk != null){
				list.setProNameList(i, chk.getProName());
				list.setProPriceList(i, chk.getProPrice());
				list.setProExplainList(i, chk.getProExplain());
				list.setProModelnameList(i, chk.getProModelname());
				list.setProMakerList(i, chk.getProMaker());
				list.setProPhotoList(i, chk.getProPhoto());
				list.setLikeMemoList(i, chk.getLikeMemo());
			}
		}
		System.out.println("checklist size:"+list.getListSize());
		ModelAndView modelAndView = new ModelAndView("template");
		modelAndView.addObject("CHECK_LIST", list);
		modelAndView.addObject("BODY","../KJMJSP/compare.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/compare/updateMemo.do", method=RequestMethod.POST)
	public ModelAndView updateMemo(HttpSession session, String[] proName, String[] CONTENT){
		String usId = (String)session.getAttribute("loginId");
		if(usId==null) usId="a";
		Memo memo = new Memo();
		for(int i=0;i<proName.length;i++){//체크된 것을 검색
			memo.setProName(proName[i]);
			memo.setLikeMemo(CONTENT[i]);
			memo.setUsId(usId);
			sqlSession.selectOne("likehome.updateMemo", memo);
		}
		ModelAndView modelAndView = new ModelAndView("template");
		modelAndView.addObject("BODY","../KJMJSP/memoSave.jsp");
		return modelAndView;
	}
}
