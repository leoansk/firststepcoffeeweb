package model;

public class Like {
	private String proPhoto;		//상품 이미지
	private String proName;			//상품 이름
	private String proModelname;	//상품 모델명
	private Integer proPrice;		//상품 출고가
	private String likeMemo;		//관심목록 메모공간
	private Integer usNumber;		//유저 번호 = 검색용
	private String usId;			//유저 아이디 = 세션에서 받아야함
	
	public String getProPhoto() {
		return proPhoto;
	}
	public void setProPhoto(String proPhoto) {
		this.proPhoto = proPhoto;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getProModelname() {
		return proModelname;
	}
	public void setProModelname(String proModelname) {
		this.proModelname = proModelname;
	}
	public Integer getProPrice() {
		return proPrice;
	}
	public void setProPrice(Integer proPrice) {
		this.proPrice = proPrice;
	}
	public String getLikeMemo() {
		return likeMemo;
	}
	public void setLikeMemo(String likeMemo) {
		this.likeMemo = likeMemo;
	}
	public Integer getUsNumber() {
		return usNumber;
	}
	public void setUsNumber(Integer usNumber) {
		this.usNumber = usNumber;
	}
	public String getUsId() {
		return usId;
	}
	public void setUsId(String usId) {
		this.usId = usId;
	}
	
	
//	public Integer getListSize(){ //한번에 몇줄 출력할 건지
//		return 5;
//	}
}
