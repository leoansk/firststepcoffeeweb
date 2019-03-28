package model;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

public class CheckList {
//	private String check;			//체크된 상품명
//	private String proName;			//상품명
//	private Integer proPrice;		//상품 출고가
//	private String proExplain;		//상품 설명
//	private String proModelname;	//상품 모델명
//	private String proMaker;		//상품 제조사
//	private MultipartFile proPhoto;	//상품 이미지
//	private String likeMemo;		//비교하기 메모공간
	private ArrayList<String> checkList = new ArrayList<String>();//비교할것들
	private ArrayList<String> proNameList = new ArrayList<String>();
	private ArrayList<Integer> proPriceList = new ArrayList<Integer>();
	private ArrayList<String> proExplainList = new ArrayList<String>();
	private ArrayList<String> proModelnameList = new ArrayList<String>();
	private ArrayList<String> proMakerList = new ArrayList<String>();
	private ArrayList<String> proPhotoList = new ArrayList<String>();
	private ArrayList<String> likeMemoList = new ArrayList<String>();
	
	public int getListSize(){	//출력할 행의 갯수
		return proNameList.size();
	}
	
	public String[] getCheckList(){//겟으로 보냄
		return checkList.toArray(new String[checkList.size()]);
	}
	public String[] getProNameList(){
		return proNameList.toArray(new String[proNameList.size()]);
	}
	public Integer[] getProPriceList(){
		return proPriceList.toArray(new Integer[proPriceList.size()]);
	}
	public String[] getProExplainList(){
		return proExplainList.toArray(new String[proExplainList.size()]);
	}
	public String[] getProModelnameList(){
		return proModelnameList.toArray(new String[proModelnameList.size()]);
	}
	public String[] getProMakerList(){
		return proMakerList.toArray(new String[proMakerList.size()]);
	}
	public String[] getProPhotoList(){
		return proPhotoList.toArray(new String[proPhotoList.size()]);
	}
	public String[] getLikeMemoList(){
		return likeMemoList.toArray(new String[likeMemoList.size()]);
	}
	
	public void setCheckList(int index, String check){//셋으로 받음
		checkList.add(index, check);
	}
	public void setProNameList(int index, String proName){
		proNameList.add(index, proName);
	}
	public void setProPriceList(int index, Integer proPrice){
		proPriceList.add(index, proPrice);
	}
	public void setProExplainList(int index, String explain){
		proExplainList.add(index, explain);
	}
	public void setProModelnameList(int index, String proModelname){
		proModelnameList.add(index, proModelname);
	}
	public void setProMakerList(int index, String proMaker){
		proMakerList.add(index, proMaker);
	}
	public void setProPhotoList(int index, String proPhoto){
		proPhotoList.add(index, proPhoto);
	}
	public void setLikeMemoList(int index, String likeMemo){
		likeMemoList.add(index, likeMemo);
	}
}
