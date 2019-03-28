package logic;

import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import model.Utopia;
import model.UtopiaList;

@Service
public class UtopiaLogic {
	
	@Autowired
	SqlSession sqlsession;
	
	//글목록
	public ModelAndView UtopiaContentList(){
		ModelAndView modelAndView = new ModelAndView("");
		return modelAndView;
	}
	
	//페이지처리
	public UtopiaList readPageBoard(Integer page) {
		List<Utopia> utopialist = sqlsession.selectList("utopia.selectPageNum",page);
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

		//이전페이지 링크 출력 처리
		if(page==1) {
			list.setFirstPage(true);}
		page =sqlsession.selectOne("utopia.selectPrevPageCount",page);
		if(page == 0) list.setFirstPage(true);
		return list;

	}


	public UtopiaList readPrevBoard(Integer page) {
		System.out.println("read1 controller");
		List<Utopia> utopialist = sqlsession.selectList("utopia.selectPrevPage",page);
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
		page =sqlsession.selectOne("utopia.selectPrevPageCount",page);
		if(page <= 5) list.setFirstPage(true);
		return list;
	}

	public UtopiaList readBoard() {
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
		return list;
	}

	public UtopiaList readNextBoard(Integer page) {
		List<Utopia> utopialist = sqlsession.selectList("utopia.selectNextPage",page);
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
		//다음 페이지 링크 출력 처리
		if( ! it.hasNext()){
			list.setLastPage(true);

		}
		return list;

	}
	public int readPageNum(){
		Integer pageNum = sqlsession.selectOne("utopia.selectPages");
		return (pageNum + 4) / 5;
	}

}
