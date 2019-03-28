package model;

import java.util.ArrayList;

public class ReviewCheckList {
	
private ArrayList<Integer> revck_costefflist = new ArrayList<Integer>();
private ArrayList<Integer> revch_designlist = new ArrayList<Integer>();
private ArrayList<Integer> revch_performancelist = new ArrayList<Integer>();
private ArrayList<Integer> revch_aslist= new ArrayList<Integer>();
private ArrayList<Integer> revch_durabilitylist= new ArrayList<Integer>();

	public Integer[] getRevck_costeff() {
		return revck_costefflist.toArray(new Integer[revck_costefflist.size()]);
		}
	public void setRevck_costeff(int index, int revck_costeff) {
		this.revck_costefflist.add(index, revck_costeff);
		}
	public Integer[] getRevch_design() {
		return revch_designlist.toArray(new Integer[revch_designlist.size()]);
		}
	public void setRevch_design(int index, int revch_design) {
		this.revch_designlist.add(index, revch_design);
		}
	public Integer[] getRevch_performance() {
		return revch_performancelist.toArray(new Integer[revch_performancelist.size()]);
		}
	public void setRevch_performance(int index, int revch_performance) {
		this.revch_performancelist.add(index, revch_performance);
		}
	public Integer[] getRevch_as() {
		return revch_aslist.toArray(new Integer[revch_aslist.size()]);
		}
	public void setRevch_as(int index, int revch_as) {
		this.revch_aslist.add(index, revch_as);
		}
	public Integer[] getRevch_durability() {
		return revch_durabilitylist.toArray(new Integer[revch_durabilitylist.size()]);
		}
	public void setRevch_durability(int index, int revch_durability) {
		this.revch_durabilitylist.add(index, revch_durability);
		}
}
