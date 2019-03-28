package model;

import org.springframework.web.multipart.MultipartFile;

public class Check {
	private String check;			//체크된 상품명
	private String proName;			//상품명
	private Integer proPrice;		//상품 출고가
	private String proExplain;		//상품 설명
	private String proModelname;	//상품 모델명
	private String proMaker;		//상품 제조사
	private String proPhoto;	//상품 이미지
	private String likeMemo;		//비교하기 메모공간
	
	public String getCheck() {
		return check;
	}
	public void setCheck(String check) {
		this.check = check;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public Integer getProPrice() {
		return proPrice;
	}
	public void setProPrice(Integer proPrice) {
		this.proPrice = proPrice;
	}
	public String getProExplain() {
		return proExplain;
	}
	public void setProExplain(String proExplain) {
		this.proExplain = proExplain;
	}
	public String getProModelname() {
		return proModelname;
	}
	public void setProModelname(String proModelname) {
		this.proModelname = proModelname;
	}
	public String getProMaker() {
		return proMaker;
	}
	public void setProMaker(String proMaker) {
		this.proMaker = proMaker;
	}
	public String getProPhoto() {
		return proPhoto;
	}
	public void setProPhoto(String proPhoto) {
		this.proPhoto = proPhoto;
	}
	public String getLikeMemo() {
		return likeMemo;
	}
	public void setLikeMemo(String likeMemo) {
		this.likeMemo = likeMemo;
	}
}
