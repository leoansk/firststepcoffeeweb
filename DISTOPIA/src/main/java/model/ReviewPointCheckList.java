package model;

import java.util.ArrayList;

public class ReviewPointCheckList {
	private ArrayList<Integer> rpc_numberlist = new ArrayList<Integer>();
	private ArrayList<Integer> us_numberlist = new ArrayList<Integer>();
	private ArrayList<Integer> rev_numberlist = new ArrayList<Integer>();

	public Integer[] getRpc_number() {
		return rpc_numberlist.toArray(new Integer[rpc_numberlist.size()]);
		}
	public void setRpc_number(int index, int rpc_number) {
		this.rpc_numberlist.add(index, rpc_number);
		}
	public Integer[] getUs_number() {
		return us_numberlist.toArray(new Integer[us_numberlist.size()]);
		}
	public void setUs_number(int index, int us_number) {
		this.us_numberlist.add(index, us_number);
		}
	public Integer[] getRev_number() {
		return rev_numberlist.toArray(new Integer[rev_numberlist.size()]);
		}
	public void setRev_number(int index, int rev_number) {
		this.rev_numberlist.add(index, rev_number);
		}
	public int getListSize() {
		return rpc_numberlist.size();
	}
}
