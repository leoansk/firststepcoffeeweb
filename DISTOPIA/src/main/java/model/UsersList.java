package model;

import java.util.ArrayList;

public class UsersList {
	private ArrayList<String> us_idlist = new ArrayList<String>();
	private ArrayList<String> us_photonamelist = new ArrayList<String>();
	
	public String[] getUs_photoname() {
		return us_photonamelist.toArray(new String[us_photonamelist.size()]);
	}
	public void setUs_photoname(int index, String us_photoname){
		this.us_photonamelist.add(index, us_photoname);
	}
	public String[] getUs_id() {
		return us_idlist.toArray(new String[us_idlist.size()]);
		}
	public void setUs_id(int index, String us_id) {
		this.us_idlist.add(index, us_id);
		}
}
