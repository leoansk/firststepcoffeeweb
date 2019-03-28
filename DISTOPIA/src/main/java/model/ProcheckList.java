package model;

import java.util.ArrayList;

public class ProcheckList {
	private ArrayList<Integer> pro_numberlist = new ArrayList<Integer>();
	private ArrayList<Integer> prock_costefflist = new ArrayList<Integer>();
	private ArrayList<Integer> prock_designlist = new ArrayList<Integer>();
	private ArrayList<Integer> prock_performancelist = new ArrayList<Integer>();
	private ArrayList<Integer> prock_aslist = new ArrayList<Integer>();
	private ArrayList<Integer> prock_durabilitylist = new ArrayList<Integer>();
	private ArrayList<Integer> prock_totalscorelist = new ArrayList<Integer>();
	
	public Integer[] getPro_number() {
		return pro_numberlist.toArray(new Integer[pro_numberlist.size()]);
		}
	public Integer[] getProck_costeff() {
		return prock_costefflist.toArray(new Integer[prock_costefflist.size()]);
		}
	public Integer[] getProck_design() {
		return prock_designlist.toArray(new Integer[prock_designlist.size()]);
		}
	public Integer[] getProck_performance() {
		return prock_performancelist.toArray(new Integer[prock_performancelist.size()]);
		}
	public Integer[] getProck_as() {
		return prock_aslist.toArray(new Integer[prock_aslist.size()]);
		}
	public Integer[] getProck_durability() {
		return prock_durabilitylist.toArray(new Integer[prock_durabilitylist.size()]);
		}
	public Integer[] getProck_totalscore() {
		return prock_totalscorelist.toArray(new Integer[prock_totalscorelist.size()]);
		}
	public void setPro_number(int index, int pro_number) {
		this.pro_numberlist.add(index, pro_number);
		}
	public void setProck_costeff(int index, int prock_costeff) {
		this.prock_costefflist.add(index, prock_costeff);
		}
	public void setProck_design(int index, int prock_design) {
		this.prock_designlist.add(index, prock_design);
		}
	public void setProck_performance(int index, int prock_performance) {
		this.prock_performancelist.add(index, prock_performance);
		}
	public void setProck_as(int index, int prock_as) {
		this.prock_aslist.add(index, prock_as);
		}
	public void setProck_durability(int index, int prock_durability) {
		this.prock_durabilitylist.add(index, prock_durability);
		}
	public void setProck_totalscore(int index, int prock_totalscore) {
		this.prock_totalscorelist.add(index, prock_totalscore);
		}
	public int getListSize() {
		return pro_numberlist.size();
	}
}







