package controller;

import java.util.Calendar;
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
import logic.UtopiaLogic;
import model.Utopia;
import model.UtopiaList;
import model.UtopiaReply;
import model.UtopiaReplyList;

@Controller
public class UtopiaController {

	@Autowired
	private SqlSession sqlsession;
	@Autowired
	UtopiaLogic ulogic;
	@Autowired
	ProductLogic pl;
	@RequestMapping
	public ModelAndView utopiamain(){
		ModelAndView modelAndView = new ModelAndView("template");
		modelAndView.addObject("BODY","../HDYJSP/utopia.jsp");
		return modelAndView;
	}

	@RequestMapping
	public ModelAndView utopia1(){
		ModelAndView modelAndView = new ModelAndView("template");
		modelAndView.addObject("BODY","../HDYJSP/utopiainput.jsp");
		return modelAndView;
	}

	//유토피아 게시글 삽입 메소드
	@RequestMapping(value="/utopia/utoinsert.do", method=RequestMethod.POST)
	public ModelAndView utoinsert121(String boa_title,String boa_content,HttpSession session,Integer page_no,Integer f_seq,Integer l_seq){
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("로그인한 아이디"+loginId);
		Integer usernum = sqlsession.selectOne("utopia.selectIDnum",loginId);
		Integer utonum = sqlsession.selectOne("utopia.selectUtopiaNumber");
		String date = pl.returnDate();
		Utopia uto = new Utopia();
		uto.setBoa_number(utonum+1);
		uto.setBoa_title(boa_title);
		uto.setBoa_date(date);
		uto.setUs_number(usernum);
		uto.setBoa_content(boa_content);
		sqlsession.insert("utopia.insertUtopia",uto);
		System.out.println(uto.getBoa_content()+","+uto.getBoa_title());
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


	//글 내용 읽어오는 메소드
	@RequestMapping(value="utopia/content.do", method=RequestMethod.GET)
	public ModelAndView content(Integer boa_number,HttpSession session){
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("loginid"+loginId);
		ModelAndView modelAndView = new ModelAndView("template");
		modelAndView.addObject("BODY","../HDYJSP/utopiacontent.jsp");
		Utopia uto = sqlsession.selectOne("utopia.selectUtopiaContent",boa_number);
		modelAndView.addObject("list",uto);
		modelAndView.addObject("loginId",loginId);
		return modelAndView;

	}

	//부모댓글 삽입 메소드
	@RequestMapping(value="utopia/boardReply.do", method=RequestMethod.POST)
	public ModelAndView boardReplyinsert(String rep_content, Integer boa_number,HttpSession session){
		System.out.println("부모 댓글 삽입");
		String loginId = (String) session.getAttribute("loginId");
		Integer replynum = sqlsession.selectOne("utopia.selectUtopiaRepNum");
		Integer groupnum = sqlsession.selectOne("utopia.selectUtopiaRepGroupnum");
		Integer order = sqlsession.selectOne("utopia.selectUtopiaRepOrder");
		Integer loginNum = sqlsession.selectOne("dystopia.selectUserNum",loginId);
		String date = pl.returnDate();
		UtopiaReply ureply = new UtopiaReply();
		ureply.setBoa_number(boa_number);
		ureply.setRep_content(rep_content);
		ureply.setRep_date(date);
		ureply.setRep_groupnum(groupnum+1);
		ureply.setRep_parentsnum(0);
		ureply.setRep_number(replynum+1);
		ureply.setRep_order(order+1);
		ureply.setUs_number(loginNum);
		sqlsession.insert("utopia.insertUtopiaReply",ureply);
		List<UtopiaReply> ureList = sqlsession.selectList("utopia.selectUtopiaReply",boa_number) ;
		UtopiaReplyList list = new UtopiaReplyList();
		Iterator it = ureList.iterator();
		System.out.println(boa_number);
		for(int i=0;  i< ureList.size(); i++){
			if(it.hasNext()){ 
				System.out.println("start");
				UtopiaReply uReply = (UtopiaReply)it.next();
				list.setRep_number(i, uReply.getRep_number());
				if(uReply == null) {System.out.println("uReply is null"); break;}
				list.setBoa_number(i, uReply.getBoa_number());
				list.setRep_contentlist(i, uReply.getRep_content());
				list.setRep_date(i, uReply.getRep_date());
				list.setUs_id(i, uReply.getUs_id());
			}else{
				break;
			}
		}
		Utopia uto = sqlsession.selectOne("utopia.selectUtopiaContent",boa_number);
		ModelAndView modelAndView = new ModelAndView("template");
		modelAndView.addObject("BODY","../HDYJSP/utopiacontent.jsp");
		modelAndView.addObject("replylist",list);
		modelAndView.addObject("list",uto);
		return modelAndView;
	}
	//댓글 읽는 메서드
	@RequestMapping(value="utopia/boardReplyread.do", method=RequestMethod.GET)
	public ModelAndView replyRred(Integer boa_number){
		List<UtopiaReply> ureList = sqlsession.selectList("utopia.selectUtopiaReply",boa_number) ;
		UtopiaReplyList list = new UtopiaReplyList();
		Iterator it = ureList.iterator();
		System.out.println(boa_number);

		for(int i=0;  i< ureList.size(); i++){
			if(it.hasNext()){ 
				System.out.println("start");
				UtopiaReply uReply = (UtopiaReply)it.next();
				if(uReply.getRep_number() == null){
					break;
				}
				list.setRep_number(i, uReply.getRep_number());
				if(uReply == null) {System.out.println("uReply is null"); break;}
				list.setBoa_number(i, uReply.getBoa_number());
				list.setRep_contentlist(i, uReply.getRep_content());
				list.setRep_date(i, uReply.getRep_date());
				list.setUs_id(i, uReply.getUs_id());
				list.setRep_parentsnum(i, uReply.getRep_parentsnum());
				list.setRep_groupnum(i, uReply.getRep_groupnum());
				list.setRep_order(i, uReply.getRep_order());
			}else{
				break;
			}
		}
		Utopia uto = sqlsession.selectOne("utopia.selectUtopiaContent",boa_number);
		ModelAndView modelAndView = new ModelAndView("template");
		modelAndView.addObject("BODY","../HDYJSP/utopiacontent.jsp");
		modelAndView.addObject("replylist",list);
		modelAndView.addObject("list",uto);
		return modelAndView;

	}
	//수정하기 눌렀을때 수정페이지로 바꿔주는 메소드
	@RequestMapping(value="utopia/edit.do", method=RequestMethod.GET)
	public ModelAndView edit(Integer boa_number){
		System.out.println("수정하기 페이지 " +boa_number);
		ModelAndView modelAndView = new ModelAndView("template");
		modelAndView.addObject("BODY","../HDYJSP/updatecontent.jsp");
		Utopia uto = sqlsession.selectOne("utopia.selectUtopiaContent",boa_number);
		modelAndView.addObject("list",uto);
		return modelAndView;
	}

	//게시글 수정하는 메서드
	@RequestMapping(value="utopia/updateContent.do", method=RequestMethod.POST)
	public ModelAndView updateContent(Integer boa_number,String boa_title,String boa_content,HttpSession session,Integer page_no,Integer f_seq,Integer l_seq){
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("유토피아 게시글 수정");
		String date = pl.returnDate();
		Utopia uto = new Utopia();
		uto.setBoa_number(boa_number);
		uto.setBoa_title(boa_title);
		uto.setBoa_date(date);
		uto.setUs_number(1);
		uto.setBoa_content(boa_content);
		sqlsession.update("utopia.updateContent",uto);
		System.out.println(uto.getBoa_content()+","+uto.getBoa_title());
		List<Utopia> utopialist = sqlsession.selectList("utopia.selectUtopiaList");
		//==========글목록불러오기==========
		UtopiaList list = new UtopiaList();
		if(f_seq != null){
			list = ulogic.readPrevBoard(f_seq); 
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
		modelAndView.addObject("list",list);
		modelAndView.addObject("loginId",loginId);	
		return modelAndView;
	}
	//글삭제
	@RequestMapping(value="utopia/deleteBoardContent.do", method=RequestMethod.GET)
	public ModelAndView deleteBoardContent(Integer boa_number,Integer page_no,Integer f_seq,Integer l_seq,HttpSession session){
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("글삭제 " +boa_number);
		Integer uto2 = sqlsession.delete("utopia.deleteRBoardContent",boa_number);
		Integer uto = sqlsession.delete("utopia.deleteBoardContent",boa_number);
		System.out.println("uto"+uto);
		List<Utopia> utopialist = sqlsession.selectList("utopia.selectUtopiaList");
		UtopiaList list = new UtopiaList();
		if(f_seq != null){
			list = ulogic.readPrevBoard(f_seq); 
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
		modelAndView.addObject("list",list);
		modelAndView.addObject("loginId",loginId);	
		return modelAndView;
	}

	//글 검색
	@RequestMapping(value="/utopia/Search.do", method=RequestMethod.POST)
	public ModelAndView Search(String search){
		System.out.println("글 검색 controller");
		List<Utopia> utopialist = sqlsession.selectList("utopia.selectSearchUtipoa",search);
		System.out.println("검색어"+search);
		UtopiaList list = new UtopiaList();
		Iterator it = utopialist.iterator();
		for(int i=0;  i< 5; i++){
			if(it.hasNext()){ 
				System.out.println("글목록! start");
				Utopia uto = (Utopia)it.next();
				list.setBoa_number(i, uto.getBoa_number());
				list.setBoa_title(i, uto.getBoa_title());
				list.setUs_id(i, uto.getUs_id());
				list.setBoa_date(i, uto.getBoa_date());
			}else{
				break;
			}
		}
		ModelAndView modelAndView = new ModelAndView("template");
		modelAndView.addObject("BODY","../HDYJSP/utopia.jsp");
		System.out.println("글목록 건수:"+list.getListSize());
		modelAndView.addObject("list",list);
		return modelAndView;

	}

	//글목록 읽어오는 메소드
	@RequestMapping(value="/utopia/utopia.do", method=RequestMethod.GET)
	public ModelAndView read(HttpSession session){
		System.out.println("read1 controller");
		String loginId = (String) session.getAttribute("loginId");
		List<Utopia> utopialist = sqlsession.selectList("utopia.selectUtopiaList");
		UtopiaList list = new UtopiaList();
		Iterator it = utopialist.iterator();
		for(int i=0;  i< 5; i++){
			if(it.hasNext()){ 
				System.out.println("글목록! start");
				Utopia uto = (Utopia)it.next();
				list.setBoa_number(i, uto.getBoa_number());
				list.setBoa_title(i, uto.getBoa_title());
				list.setUs_id(i, uto.getUs_id());
				list.setBoa_date(i, uto.getBoa_date());
			}else{
				break;
			}
		}
		ModelAndView modelAndView = new ModelAndView("template");
		modelAndView.addObject("BODY","../HDYJSP/utopia.jsp");
		System.out.println("글목록 건수:"+list.getListSize());
		modelAndView.addObject("list",list);
		modelAndView.addObject("loginId",loginId);
		return modelAndView;
	}
	//댓글삭제 메서드
	@RequestMapping(value="/utopia/replyDelete.do", method=RequestMethod.GET)
	public ModelAndView replyDelete(Integer rep_number,HttpSession session,Integer boa_number){

		System.out.println("uto"+rep_number);
		Integer uto2 = sqlsession.delete("utopia.deleteReply",rep_number);

		//글내용불러오기
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("loginid"+loginId);
		List<UtopiaReply> ureList = sqlsession.selectList("utopia.selectUtopiaReply",boa_number) ;
		UtopiaReplyList list = new UtopiaReplyList();
		Iterator it = ureList.iterator();
		System.out.println(boa_number);

		for(int i=0;  i< ureList.size(); i++){
			if(it.hasNext()){ 
				System.out.println("start");
				UtopiaReply uReply = (UtopiaReply)it.next();
				if(uReply.getRep_number() == null){
					break;
				}
				list.setRep_number(i, uReply.getRep_number());
				if(uReply == null) {System.out.println("uReply is null"); break;}
				list.setBoa_number(i, uReply.getBoa_number());
				list.setRep_contentlist(i, uReply.getRep_content());
				list.setRep_date(i, uReply.getRep_date());
				list.setUs_id(i, uReply.getUs_id());
				list.setRep_parentsnum(i, uReply.getRep_parentsnum());
				list.setRep_groupnum(i, uReply.getRep_groupnum());
				list.setRep_order(i, uReply.getRep_order());
			}else{
				break;
			}
		}
		Utopia uto = sqlsession.selectOne("utopia.selectUtopiaContent",boa_number);
		ModelAndView modelAndView = new ModelAndView("template");
		modelAndView.addObject("BODY","../HDYJSP/utopiacontent.jsp");
		System.out.println("글목록 건수:"+list.getListSize());
		modelAndView.addObject("replylist",list);
		modelAndView.addObject("list",uto);
		modelAndView.addObject("loginId",loginId);
		return modelAndView;
	}
	
	
	//댓글수정하는 페이지로 이동
	@RequestMapping(value="utopia/updatereplyshow.do", method=RequestMethod.GET)
	public ModelAndView updatereplyshow(Integer rep_number){
		System.out.println("rep"+rep_number);
		UtopiaReply uto = sqlsession.selectOne("utopia.selectUpdateReply",rep_number);
		ModelAndView modelAndView = new ModelAndView("template");
		modelAndView.addObject("BODY","../HDYJSP/updateReply.jsp");
		System.out.println("댓글수정"+uto);
		modelAndView.addObject("replylist",uto);
		return modelAndView;
	}
	//수정페이지에서 수정하기를 눌렀을때
	@RequestMapping(value="utopia/updateReply.do", method=RequestMethod.POST)
	public ModelAndView updateReply(Integer rep_number,String rep_content,Integer boa_number,HttpSession session){
		Calendar today = Calendar.getInstance();
		String date = pl.returnDate();
		UtopiaReply reply = new UtopiaReply();
		reply.setRep_number(rep_number);
		reply.setRep_content(rep_content);
		reply.setRep_date(date);
		sqlsession.update("utopia.updateRelpy",reply);
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("loginid"+loginId);
		List<UtopiaReply> ureList = sqlsession.selectList("utopia.selectUtopiaReply",boa_number) ;
		UtopiaReplyList list = new UtopiaReplyList();
		Iterator it = ureList.iterator();
		System.out.println(boa_number);

		for(int i=0;  i< ureList.size(); i++){
			if(it.hasNext()){ 
				System.out.println("start");
				UtopiaReply uReply = (UtopiaReply)it.next();
				if(uReply.getRep_number() == null){
					break;
				}
				list.setRep_number(i, uReply.getRep_number());
				if(uReply == null) {System.out.println("uReply is null"); break;}
				list.setBoa_number(i, uReply.getBoa_number());
				list.setRep_contentlist(i, uReply.getRep_content());
				list.setRep_date(i, uReply.getRep_date());
				list.setUs_id(i, uReply.getUs_id());
				list.setRep_parentsnum(i, uReply.getRep_parentsnum());
				list.setRep_groupnum(i, uReply.getRep_groupnum());
				list.setRep_order(i, uReply.getRep_order());
			}else{
				break;
			}
		}
		Utopia uto = sqlsession.selectOne("utopia.selectUtopiaContent",boa_number);
		ModelAndView modelAndView = new ModelAndView("template");
		modelAndView.addObject("BODY","../HDYJSP/utopiacontent.jsp");
		modelAndView.addObject("replylist",list);
		modelAndView.addObject("list",uto);
		modelAndView.addObject("loginId",loginId);
		return modelAndView;
	}

}