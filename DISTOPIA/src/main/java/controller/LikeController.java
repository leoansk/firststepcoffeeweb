package controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.DeleteLike;
import model.Like;
import model.LikeList;

@Controller
public class LikeController {
   @Autowired
   private SqlSession sqlSession;
   
   @RequestMapping(value="/like/readLike.do", method=RequestMethod.GET)
   public ModelAndView readLike(HttpSession session){
      System.out.println("like controller");
      String usId = (String)session.getAttribute("loginId");//세션
//      Integer usNumber = sqlSession.selectOne("likehome.selectUserNumber",usId);//유저아이디로 유저넘버 검색

      List<Like> likeList = sqlSession.selectList("likehome.selectLike",usId);//맵퍼
      ModelAndView modelAndView = new ModelAndView("template");
      
      //likeList -> LikeLIst 빈에 저장
      LikeList list = new LikeList();
      Iterator it = likeList.iterator();
      for(int i=0;i<likeList.size();i++){
         if(it.hasNext()){
            Like like = (Like)it.next();
            list.setProPhotoList(i, like.getProPhoto());
            list.setProNameList(i, like.getProName());
            list.setProModelnameList(i, like.getProModelname());
            list.setProPriceList(i, like.getProPrice());
         }else{
            break;
         }
      }
      
      modelAndView.addObject("LIKE_LIST", list);//list에 담긴것들을 LIKE_LIST에 담아서 jsp로 넘겨준다
      modelAndView.addObject("BODY","../KJMJSP/like.jsp");
      
      return modelAndView;
   }
   
   @RequestMapping(value="/like/delete.do", method=RequestMethod.GET)
   public ModelAndView delete(HttpSession session, String NAME){
      System.out.println(NAME);
      
      String usId = (String)session.getAttribute("loginId");//세션
      if(usId==null) usId="a";//임시 세션기능
      DeleteLike del = new DeleteLike();
      del.setUsId(usId);
      del.setProModelname(NAME);
      
      System.out.println(del.getProModelname());
      
      sqlSession.selectList("likehome.deleteLike",del);//맵퍼
      
//      return this.index();//상품목록을 그대로 다시 보여준다
//      return this.readLike();
      ModelAndView modelAndView = new ModelAndView("template");
      System.out.println("여기까지 오나2?");
      modelAndView.addObject("BODY","../KJMJSP/deleteLike.jsp");
      return modelAndView;
   }
}