package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import javax.validation.Valid;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;
import org.springframework.jdbc.support.lob.LobHandler;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.Image;
import model.Rank;
import model.RankList;
import model.Users;
import model.UsersListA;

@Controller
public class ImageController {
   @Autowired
   private SqlSession sqlSession;
   
//   private DataSource dataSource;
//   InputStream pictures = null;
//   ServletOutputStream os = null;
   
   @Autowired
   private LobHandler lobHandler;
   private SimpleJdbcTemplate template;
   private JdbcTemplate jdbcTemplate;
   private DataSource dataSource;
   
   @Autowired
   public void setDataSource(DataSource dataSource){
      this.template = new SimpleJdbcTemplate(dataSource);
      this.jdbcTemplate = new JdbcTemplate(dataSource);
      this.dataSource = dataSource;
   }
   
   //이미지 insert 페이지
   @RequestMapping(value="/image/imageBLOB.do", method=RequestMethod.GET)
   public ModelAndView BLOBView(){
	   System.out.println("BLOB controller");
      ModelAndView modelAndView = new ModelAndView("template");
      
      modelAndView.addObject("BODY","../KJMJSP/imageBLOB.jsp");
      return modelAndView;
   }
   
   //이미지 저장
   @RequestMapping(value="/image/imageInput.do", method=RequestMethod.POST)//상품정보를 DB에 저장한다
   public ModelAndView register(@Valid Image image, BindingResult bindingResult, HttpSession session){//@Valid=>바로 이 위치에서 유효성검사를 진행한다
	   
	   String loginId = (String)session.getAttribute("loginId");//유저 아이디가 이게 맞음?
	   System.out.println("이미지 저장시: "+loginId);
	   if(bindingResult.hasErrors()){//실패시
         ModelAndView modelAndView = new ModelAndView("template");
         modelAndView.addObject("BODY","../KJMJSP/imageBLOB.jsp");
         modelAndView.getModel().putAll(bindingResult.getModel());
         return modelAndView;
      }
      if(image == null) System.out.println("image is null");
//      this.imageService.entryImage(image);
      try{
         HashMap<String,Object> map = new HashMap<String, Object>();
         map.put("usPhoto", image.getUsPhoto().getBytes());
         map.put("loginId",loginId);
         if(image.getUsPhoto() == null) System.out.println("image is null");
         
         System.out.println("update 전");
         sqlSession.update("likehome.updateImage", map);
         
         System.out.println("update 후");
         
      }catch(Exception e){
         e.printStackTrace();
      }
      
//       return this.index();//완료를 보여준다
      
      //==================회원정보 불러오기==========================
      List<Users> usersListA = sqlSession.selectList("dystopia.selectUserRead",loginId); 
		List<Rank> rankList = sqlSession.selectList("dystopia.selectRankRead",loginId);	
		
		UsersListA userslist = new UsersListA();
		RankList ranklist = new RankList();
		
		Iterator usersit = usersListA.iterator();
		Iterator rankit = rankList.iterator();
		
		//여기서 일단 로그인 되 있는 세션 가져와서 디비 검색 후 넣어줌
		for(int i=0; i<usersListA.size();i++){
			if(usersit.hasNext()){ 
				Users users = (Users)usersit.next();
				userslist.setUs_number(i, users.getUs_number());
				userslist.setUs_id(i, users.getUs_id());
				userslist.setUs_password(i, users.getUs_password());
				userslist.setUs_age(i, users.getUs_age());
				userslist.setUs_gender(i, users.getUs_gender());
				userslist.setUs_address(i, users.getUs_address());
				userslist.setUs_email(i, users.getUs_email());
				userslist.setUs_phone(i, users.getUs_phone());
				userslist.setUs_birthday(i, users.getUs_birthday());
				userslist.setUs_photo(i, users.getUs_photo());
				userslist.setUs_name(i, users.getUs_name());
				
				System.out.println(users.getUs_name());
				System.out.println(users.getUs_photo());
				System.out.println("위에 사진 유무 판단");
				}else{
				break;
			}
		}
		for(int i=0; i<rankList.size();i++){
			if(rankit.hasNext()){ 
				Rank rank = (Rank)rankit.next();
				ranklist.setRank_number(i, rank.getRank_number());
				ranklist.setUs_number(i, rank.getUs_number());
				ranklist.setRank_kitchen(i, rank.getRank_kitchen());
				ranklist.setRank_life(i, rank.getRank_life());
				ranklist.setRank_tv(i, rank.getRank_tv());
				ranklist.setRank_digitalcamera(i, rank.getRank_digitalcamera());
				ranklist.setRank_desktop(i, rank.getRank_desktop());
				ranklist.setRank_notebook(i, rank.getRank_notebook());
				ranklist.setRank_2in1(i, rank.getRank_2in1());
				ranklist.setRank_peripheral_com(i, rank.getRank_peripheral_com());
				ranklist.setRank_smartphone(i, rank.getRank_smartphone());
				ranklist.setRank_tablet(i, rank.getRank_tablet());
				ranklist.setRank_smartwatch(i, rank.getRank_smartwatch());
				ranklist.setRank_peripheral_smart(i, rank.getRank_peripheral_smart());
				ranklist.setRank_furniture(i, rank.getRank_furniture());
				ranklist.setRank_clothing(i, rank.getRank_clothing());
				ranklist.setRank_sport(i, rank.getRank_sport());
				ranklist.setRank_stationery(i, rank.getRank_stationery());
				}else{
				break;
			}
		}
		
		ModelAndView modelAndView = new ModelAndView("template");
		modelAndView.addObject("Users_LIST",userslist); //회원 가입한 유저
		modelAndView.addObject("Rank_LIST",ranklist); //유저의 카테고리 별 랭킹 점수
	
      //=====================================================
      modelAndView.addObject("BODY","../jsp/user_mypage.jsp");
      
      return modelAndView;
   }
   
   
   
   
   
   //이미지 불러오기용
   @RequestMapping(value = "/image/imagePrint.do", method = RequestMethod.GET)
   public void imagePrint(HttpSession session, HttpServletResponse response, String id) {
      System.out.println("이미지프린트 컨트롤러 진입");
      String loginId = (String)session.getAttribute("loginId");//세션
      System.out.println(loginId);
//      int usNumber = sqlSession.selectOne("likehome.selectUserNumber",usId);//유저번호 받아옴
      // MyBatis를 사용한 BLOB 출력
      response.setContentType("image/jpeg");//이미지 형식
      
      System.out.println("imagePrint ok1");
      ServletOutputStream sos = null;//바이트 출력//바이트형식으로 넣어준다
      try {
         sos = response.getOutputStream();//이미지를 넣어주기 위하여 생성
      }catch (Exception e) {
         e.printStackTrace();
      }
      ServletOutputStream os = sos;

      final HttpServletResponse resp = response;//브라우저에 넣어주기 위하여
      
      try {
         int data = 0;
         // ***********
         int bufferSize =  ((((((8192*2)*2)*2)*2)*2)*2)*2;//1024메가
         final byte[] buffer = new byte[bufferSize];
         // ************
         ///////////////////////////////////////
//         System.out.println("usNumber : " + usNumber);
//         Map<String, Object> maps = sqlSession.selectOne("likehome.selectUuserPhoto",usId);
         ///////////////////////////////////////
//         Map<String, Object> map = imageService.getUserPhoto(usId);
         Map<String, Object> map = sqlSession.selectOne("likehome.selectUuserPhoto",loginId);
         
         byte[] blob = (byte[])map.get("picture");   
         if(blob == null) System.out.println(loginId+"검색된 이미지 없슴!");
         //////////////////////////////////////

         if (blob != null) {
            os.write(blob);
            resp.flushBuffer();
            os.close();
         } else {
            System.out.println("blob is null");
         }
      } catch (Exception e) {
         throw new RuntimeException(e);
      } finally {
         try {
            
            if (os != null)
               os.close();
            
         } catch (IOException e) {

         }
      } // End of Try
   }
}