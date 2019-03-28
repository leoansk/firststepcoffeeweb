package model;

import java.util.ArrayList;

public class LikeList {
//	private String proPhoto;		//상품 이미지
//	private String proName;			//상품 이름
//	private Integer proModelname;	//상품 모델명
//	private Integer proPrice;		//상품 출고가
	
//	private String likeMemo;		//관심목록 메모공간
//	private Integer usNumber;		//유저 번호 = 검색용
//	private String usId;			//유저 아이디 = 세션에서 받아야함
	
	private ArrayList<String> proPhotoList = new ArrayList<String>();
	private ArrayList<String> proNameList = new ArrayList<String>();
	private ArrayList<String> proModelnameList = new ArrayList<String>();
	private ArrayList<Integer> proPriceList = new ArrayList<Integer>();
	private ArrayList<String> likeMemoList = new ArrayList<String>();
	
//	private ArrayList<String> checkList = new ArrayList<String>();//비교할것들
//	public String[] getCheckList(){
//		return checkList.toArray(new String[checkList.size()]);
//	}
//	public void setCheckList(int index, String check){
//		checkList.add(index, check);
//	}
	
	public int getListSize(){	//출력할 행의 갯수
		return proNameList.size();
	}
	
	public String[] getProPhotoList(){
		return proPhotoList.toArray(new String[proPhotoList.size()]);
	}
	public String[] getProNameList(){
		return proNameList.toArray(new String[proNameList.size()]);
	}
	public String[] getProModelnameList(){
		return proModelnameList.toArray(new String[proModelnameList.size()]);
	}
	public Integer[] getProPriceList(){
		return proPriceList.toArray(new Integer[proPriceList.size()]);
	}
	public String[] getLikeMemoList(){
		return likeMemoList.toArray(new String[likeMemoList.size()]);
	}
	
	public void setProPhotoList(int index, String proPhoto){
		proPhotoList.add(index, proPhoto);
	}
	public void setProNameList(int index, String proName){
		proNameList.add(index, proName);
	}
	public void setProModelnameList(int index, String proModelname){
		proModelnameList.add(index, proModelname);
	}
	public void setProPriceList(int index, Integer proPrice){
		proPriceList.add(index, proPrice);
	}
	public void setLikeMemoList(int index, String likeMemo){
		likeMemoList.add(index, likeMemo);
	}
}
