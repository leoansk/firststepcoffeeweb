package model;

public class Memo {
	private String proName;		//상품명
	private String likeMemo;	//메모내용
	private String usId;		//유저아이디(세션)
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getLikeMemo() {
		return likeMemo;
	}
	public void setLikeMemo(String likeMemo) {
		this.likeMemo = likeMemo;
	}
	public String getUsId() {
		return usId;
	}
	public void setUsId(String usId) {
		this.usId = usId;
	}
}
