package logic;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletContext;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import model.Product;
import model.Review;
import model.UserInfo;

@Service
public class BoardService {
	
	@Autowired
	ImageUtility imgUtil;
	@Autowired
	SqlSession sqlsession;
	public void fileUpload(MultipartHttpServletRequest mRequest, 
			Integer seq_number, String kinds){
		String[] photo=new String[3];
		String uploadPath=makeFolder(mRequest,kinds);//종류에 따라 폴더 생성
		
		int i=0;
		Iterator<String> iter =mRequest.getFileNames();
		while(iter.hasNext()){
			String uploadFileName = iter.next();
			
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			String originalFileName = mFile.getOriginalFilename();	//파일의 원래 이름을 얻음
			int index1 = originalFileName.lastIndexOf(".");	//마지막 점까지의 숫자
			String newNameEnd="";
			String extName="";
			String newFileName="";
			long saveFileSize=0;
			String name="";
			if(index1 >0){
				newNameEnd = originalFileName.substring(index1);	//.확장자
				extName = originalFileName.substring(index1+1);	//확장자
				//이름에 시간을 더한 값으로 파일 이름을 만듦
				newFileName = originalFileName.substring(0,index1)+System.currentTimeMillis()+newNameEnd;
				saveFileSize = mFile.getSize();	//파일 크기
				name = mFile.getName();	//jsp에서 name	
			}
			System.out.println("originalFileName : "+originalFileName);
			System.out.println("saveFileSize : "+saveFileSize);
			System.out.println("getName : "+name);
			System.out.println("index1 : "+index1);
			System.out.println("newName : "+newFileName);
			System.out.println("newNameEnd : "+newNameEnd);
			photo[i]=newFileName; 
			System.out.println(i);
			System.out.println("photo"+i+" : "+photo[i]);
			i=i+1;
			try{
				mFile.transferTo(new File(uploadPath + newFileName));	//파일 생성
				String originFilePath = uploadPath + newFileName;
				String smallFilePath = uploadPath + "small"+newFileName;
				File originalFile = new File(originFilePath);
				File smallFile = new File(smallFilePath);
				
				//(원래 파일, 작게만들 파일, 가로, 세로,파일 확장자)
				//가로 또는 세로에 수치를 쓰면 그 수치로 작게 파일을 생성
				//가로 또는 세로에 SAME을 쓰면 원래 파일과 같은 크기로 생성
				//가로 또는 세로 중 한쪽에 원하는 크기를 쓰고 RATIO를 쓰면 비율을 계산해서 같은 비율의 원하는 크기로 생성
				
				Integer size= returnSize(kinds); //종류에 따라 사진 가로크기 리턴
				if(index1 >0){
					imgUtil.resize(originalFile, smallFile, size, imgUtil.RATIO,extName);
				}
				
				//사진 이름을 변수에 담음
				
			}catch(IllegalStateException e){
				e.printStackTrace();
			}catch(IOException e){
				e.printStackTrace();
			}
		}
			//DB에 update
			if(kinds.equals("review")){
				Review review = new Review();
				review.setRev_photo1(photo[0]);
				review.setRev_photo2(photo[1]);
				review.setRev_photo3(photo[2]);
				review.setRev_number(seq_number);
				sqlsession.update("dystopia.updateReviewPhoto",review);
			}else if(kinds.equals("products")){
				Product product = new Product();
				product.setPro_number(seq_number);
				product.setPro_photo(photo[0]);
				sqlsession.update("dystopia.updateProPhoto",product);
			}else if(kinds.equals("membership")){
				UserInfo userinfo = new UserInfo();
				userinfo.setUsnumber(seq_number);
				userinfo.setUs_photoname(photo[0]);
				sqlsession.update("dystopia.updateuserPhoto",userinfo);
				
			}
	}
	public String makeFolder(MultipartHttpServletRequest mRequest, String kinds){
		ServletContext context = mRequest.getSession().getServletContext();
		String path="";
		if(kinds.equals("review")){
			path = context.getRealPath("reviewimg");
		}else if(kinds.equals("products")){
			path = context.getRealPath("proimage");
		}else if(kinds.equals("membership")){
			path = context.getRealPath("userimage");
		}
		
		String uploadPath=path+"/";
		File dir = new File (uploadPath);
		System.out.println(uploadPath);
		if(!dir.exists()){
			dir.setWritable(true);
			dir.mkdir();	//경로가 없으면 폴더를 생성
		}
		return uploadPath;
	}
	public Integer returnSize(String kinds){
		Integer size=0;
		if(kinds.equals("review")){
			size=150;
		}else if(kinds.equals("products")){
			size=100;
		}else if(kinds.equals("membership")){
			size=100;
		}
		return size;
	}
}
