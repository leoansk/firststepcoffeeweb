package model;

import java.util.ArrayList;

public class MemoList {
	private ArrayList<String> proNameList = new ArrayList<String>();	//상품명 저장
	private ArrayList<String> likeMemoList = new ArrayList<String>();	//메모 저장
	
	public int getListSize(){	//출력할 행의 갯수
		return proNameList.size();
	}

	public String[] getProNameList(){
		return proNameList.toArray(new String[proNameList.size()]);
	}
	public String[] getLikeMemoList(){
		return likeMemoList.toArray(new String[likeMemoList.size()]);
	}
	
	public void setProNameList(int index, String proName){
		proNameList.add(index, proName);
	}
	public void setLikeMemoList(int index, String likeMemo){
		likeMemoList.add(index, likeMemo);
	}
}
