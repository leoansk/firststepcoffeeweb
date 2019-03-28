package com.ansk.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ansk.web.domain.Criteria;
import com.ansk.web.domain.PageMaker;
import com.ansk.web.domain.ReplyVO;
import com.ansk.web.service.ReplyService;

@RestController
@RequestMapping(value="/replies")
public class ReplyController {
	
	@Inject
	private ReplyService service;
	
	/* 
	 * @RestController는 별도의 뷰를 제공하지 않는 형태로 서비스를 실행하기 때문에, 때로는 결과 데이터가 예외적인 상황에서 문제가 발생할 수 있습니다.
	 * @ResponseEntity<> 타입은 개발자가 직접 결과 데이터 + HTTP의 상태 코드를 직접 제어할 수 있는 클래스입니다.
	 * 이를 이용하면 개발자는 404나 500같은 HTTP 상태 코드를 전송하고 싶은 데이터와 함께 전송할 수 있기 때문에 좀 더 세밀한 제어가 필요한 경우에 사용해 볼 수 있습니다.
	 */
	//ResponseEntity<String>으로 리턴 타입을 정해주었고 새로운 댓글을 등록하는데 실패하면 예외의 원인 메시지를 전송하고
	//사용자에게는 BAD_REQUEST(400)를 결과로 전송합니다
	//데이터의 전송방식은 JSON 포맷을 이용할 것이므로 이를 처리하는 @RequestBody애노테이션이 필요합니당
	
	
	//댓글쓰기
	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyVO vo){
		System.out.println("register메소드 입니다");
		System.out.println(vo.getBno());
		
		ResponseEntity<String> entity = null;
		try{
			service.addReply(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	//@PathVariable은 URI의 경로에서 원하는 데이터를 추출하는 용도로 사용
	@RequestMapping(value="/all/{bno}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("bno") Integer bno){
		System.out.println("bno의 값 :" + bno);
		ResponseEntity<List<ReplyVO>> entity = null;
		
		try{
			entity = new ResponseEntity<>(service.listReply(bno),HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	//수정처리
	//@RequestBody는 전송된 json데이터를 객체로 변환해 주는 애노테이션으로 @ModelAttribute와 유사한 역할을 하지만 json에서 사용된다는 점의 차이
	//REST방식에서 update 작업은 PUT,PATCH방식을 이용하여 처리합니다 일반적으로 전체 데이터를 수정하는 경우엔 PUT,일부의 데이터를 수정하는 경우는 PATCH를 이용합니다
	@RequestMapping(value="/{rno}", method= {RequestMethod.PUT,RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("rno") Integer rno, @RequestBody ReplyVO vo){
		
		ResponseEntity<String> entity = null;
		
		try{
			vo.setRno(rno);
			service.modifyReply(vo);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	//삭제처리
	@RequestMapping(value="/{rno}", method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("rno") Integer rno){
		
		ResponseEntity<String> entity = null;
		
		try{
			service.removeReply(rno);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//페이징 처리 된 listPage
	/* 페이징 처리를 위해서/게시물번호/페이지 번호를 패턴으로 처리하고 있습니다
	 * Ajax로 호출될 것이므로 Model을 사용하지 못한다는 점입니다.
	 * 전달해야 하는 데이터들을 담기 위해서 Map타입의 객체를 별도로 생성해야 합니다
	 * 화면으로 전달되는 Map 데이터는 페이징 처리된 댓글의 목록(list)와 PageMaker클래스의 객체를 담습니다(pageMaker)
	 * 게시물의 페이징과 달리 댓글은 페이지당 보여주는 수가 변경되는 경우는 드물기 때문에 10,20,50,100 등으로 결정해 주는 것이 일반적입니다
	 */
	@RequestMapping(value="/{bno}/{page}", method=RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> listPage(@PathVariable("bno") Integer bno, @PathVariable("page") Integer page){
		ResponseEntity<Map<String,Object>> entity = null;
		
		try{
			Criteria cri = new Criteria();
			cri.setPage(page);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			Map<String,Object> map = new HashMap<String,Object>();
			List<ReplyVO> list = service.listReplyPage(bno, cri);
			
			map.put("list", list);
			
			int replyCount = service.count(bno);
			pageMaker.setTotalCount(replyCount);
			
			map.put("pageMaker", pageMaker);
			
			entity = new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
