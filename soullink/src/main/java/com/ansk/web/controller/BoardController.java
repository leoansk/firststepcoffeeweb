package com.ansk.web.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ansk.web.domain.BoardVO;
import com.ansk.web.domain.Criteria;
import com.ansk.web.domain.PageMaker;
import com.ansk.web.domain.SearchCriteria;
import com.ansk.web.service.BoardService;

//중요한 점 BoardController에 @RequestMapping위치값을 선언해 주었으면 WEB-INF/views안에도 같은 이름의 폴더를 지정해 주고 그 안에 jsp를 설정해 주어야
//redirect를 써주고 리턴값을 주지 않을때 그 전 호출한 위치를 다시 출력해 주므로 같은 이름의 폴더를 지정해 주어야 한다!
@Controller
@RequestMapping("/boards/*")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService service;
	
	@RequestMapping(value="/registerPage", method= RequestMethod.GET)
	public String registerPage() throws Exception{
		logger.info("registerPage.......");
		return "register";
	}
	
	/*
	//등록 페이지 처리
	@RequestMapping(value="/register", method= RequestMethod.GET)
	public void registerGET(BoardVO board, Model model) throws Exception{
		logger.info("register get.......");
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPOST(BoardVO board, Model model, RedirectAttributes rttr) throws Exception{
		
		logger.info("regist post..........");
		logger.info(board.toString());
		
		service.regist(board);
		
		//model.addAttribute("result", "success");
		rttr.addFlashAttribute("msg","success");
		//return "/registerSuccess";
		return "redirect:/boards/listAll";
	}
	*/
	//게시판 목록 불러오기
	//중요한 점은 from의 action속성이 지정되지 않으면 현제 경로를 그대로 action의 대상 경로
	//로 잡아준다.
	@RequestMapping(value="/listAll", method= RequestMethod.GET)
	public void listAll(Model model) throws Exception{
		logger.info("show all list..............");
		model.addAttribute("list", service.listAll());
		//BoardVO를 model에 담아준다
	}
	/*
	model.addAttribute의 사용방법엔 두가지가 있다
	1. 사용하는 객체의 이름을 직접 지정해 주는 방법 -> model.addAttribute(attributeName, attributeValue);
	2. 이름 없이 데이터를 넣으면 자동으로 클래스의 이름을 소문자로 시작해서 사용할 수 있다. -> model.addAttribute(attributeValue);
	*/
	//게시판 제목 클릭했을때 내용 불러오기
	@RequestMapping(value="/read", method= RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, Model model) throws Exception{
		//이 코드에 들어가는 데이터는 BoardVO클래스의 객체이므로, boardVO라는 이름으로 저장되게 된다.
		System.out.println("read메소드의 bno값:"+bno);
		model.addAttribute(service.read(bno));
		System.out.println("모델에addAttribute해준값:" + model.toString());
		
	}
	//@RequestParam: 요청에서 특정한 파라미터 의 값을 찾아낼 때 사용하는 애노테이션
	//삭제 처리
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public String remove(@RequestParam("bno") int bno, RedirectAttributes rttr)throws Exception{
		System.out.println("remove컨트롤러 진입");
		service.remove(bno);
		//addFlashAttribute를 사용했으므로 새로고침해도 경고창은 다시 안뜸
		rttr.addFlashAttribute("msg", "success");
		// 삭제 작업 후 redirect를 사용하여 listAll로 보내버림
		return "redirect:/boards/listAll";
	}
	//수정 처리
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void modifyGET(int bno, Model model) throws Exception{
		System.out.println("modifyGET안에 Bno값1:" + bno);
		model.addAttribute(service.read(bno));
		System.out.println("modifyGET안에 Bno값2:" + bno);
		
	}
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(BoardVO board, RedirectAttributes rttr) throws Exception{
		logger.info("mod post......");
		System.out.println("modifyPOST안에 getBno값:" + board.getBno());
		service.modify(board);
		rttr.addFlashAttribute("msg","SUCCESS");
		return "redirect:/boards/listAll";
	}
	
	//Page처리(db에서 10개 만 출력해줌)
	//스프링mvc컨트롤러는 특정url에 해당하는 메소드를 실행할 때, 파라미터의 타입을 보고, 해당 객체르르 자동으로 생성해 냅니다.
	//파라미터가 자동으로 수집되기 때문에, 바로 이전에 만든 Criteria라는 클래스를 그대로 사용할 수 있습니다.
	@RequestMapping(value="/listCri", method=RequestMethod.GET)
	public void listAll(Criteria cri, Model model) throws Exception{
		logger.info("show list Page with Criteria....");
		//http://localhost:8080/boards/listCri?page=6&perPageNum=20 요렇게 쳐주면
		System.out.println("Page번호: "+cri.getPage());
		System.out.println("PerPageNum번호:" + cri.getPerPageNum());
		model.addAttribute("list",service.listCriteria(cri));
	}
	
	/*	
	
	//목록 데이터를 Model에 저장하는 작업과, PageMaker를 구성해서 Model에 담는 작업
	@RequestMapping(value="/listPage", method=RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		logger.info(cri.toString());
		
		model.addAttribute("list",service.listCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		//pageMaker.setTotalCount(131);
		pageMaker.setTotalCount(service.listCountCriteria(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	*/
	
	/*
	//페이지 처리된 후의 readPage
	@RequestMapping(value="/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {

		model.addAttribute(service.read(bno));
	}
	*/

	/*	
	//페이지 처리된 후의 removePage
	//파라미터로 Criteria를 사용하고 jsp로 전송되는 정보 역시 page와,perPageNum이 같이 전송되어야 합니다
	@RequestMapping(value="/removePage", method=RequestMethod.POST)
	public String removePage(@RequestParam("bno") int bno, Criteria cri, RedirectAttributes rttr) throws Exception{
		
		service.remove(bno);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		//삭제 결과는 임시로 사용하는 데이터이므로 addFlashAttribute를 이용해서 처리
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/boards/listPage";
	}*/
	
	/*
	//페이지 처리된 후의 modifyPage(조회 후 수정)
	@RequestMapping(value="/modifyPage", method=RequestMethod.GET)
	public void modifyPagingGET(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		model.addAttribute(service.read(bno));
	}
	@RequestMapping(value="/modifyPage", method=RequestMethod.POST)
	public String modifyPagingPOST(BoardVO board, Criteria cri, RedirectAttributes rttr) throws Exception{
		service.modify(board);
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addFlashAttribute("msg","SUCCESS");
		return "redirect:/boards/listPage";
	}
	*/
	
	//-----------------------------------------------------------------------------------------------
	
	//교재상에는 새로운 컨트롤러인 SearchBoardController를 만들어서  sboard로 쓰지만 난 그대로 쓸꺼다 냐하하하
	
	//목록 데이터를 Model에 저장하는 작업과, PageMaker를 구성해서 Model에 담는 작업
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		logger.info(cri.toString());
		
		//model.addAttribute("list", service.listCriteria(cri));
		model.addAttribute("list", service.listSearchCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		//pageMaker.setTotalCount(service.listCountCriteria(cri));
		pageMaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	//검색어 조회가 포함된 게시물 조회 처리
	@RequestMapping(value="/readPage" , method=RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		model.addAttribute(service.read(bno));
	}
	
	//검색어 조회가 포함된 게시물 삭제 처리
	@RequestMapping(value="/removePage", method=RequestMethod.POST)
	public String remove(@RequestParam("bno") int bno, @ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr) throws Exception{
		
		service.remove(bno);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:/boards/list";
	}
	
	//검색어 조회가 포함된 게시물 수정 처리
	@RequestMapping(value="/modifyPage" , method=RequestMethod.GET)
	public void modifyPagingGET(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		model.addAttribute(service.read(bno));
	}
	@RequestMapping(value="/modifyPage", method=RequestMethod.POST)
	public String modifyPagingPOST(BoardVO board, SearchCriteria cri, RedirectAttributes rttr) throws Exception{
		logger.info(cri.toString());
		service.modify(board);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		logger.info(rttr.toString());
		
		return "redirect:/boards/list";
	}
	
	//검색어 조회가 포함된 등록 처리(기존것과 동일)
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registGET() throws Exception{
		logger.info("regist get...............");
	}
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registPOST(BoardVO board, RedirectAttributes rttr) throws Exception{
		
		logger.info("regist post........");
		logger.info(board.toString());
		
		service.regist(board);
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:/boards/list";
	}
}
