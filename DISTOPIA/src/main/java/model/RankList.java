package model;

import java.util.ArrayList;

public class RankList {
	private ArrayList<Integer> rank_numberlist = new ArrayList<Integer>();
	private ArrayList<Integer> us_numberlist = new ArrayList<Integer>();
	private ArrayList<Integer> rank_kitchenlist = new ArrayList<Integer>();
	private ArrayList<Integer> rank_lifelist = new ArrayList<Integer>();
	private ArrayList<Integer> rank_tvlist = new ArrayList<Integer>();
	private ArrayList<Integer> rank_digitalcameralist = new ArrayList<Integer>();
	private ArrayList<Integer> rank_desktoplist = new ArrayList<Integer>();
	private ArrayList<Integer> rank_notebooklist = new ArrayList<Integer>();
	private ArrayList<Integer> rank_2in1list = new ArrayList<Integer>();
	private ArrayList<Integer> rank_peripheral_comlist = new ArrayList<Integer>();
	private ArrayList<Integer> rank_smartphonelist = new ArrayList<Integer>();
	private ArrayList<Integer> rank_tabletlist = new ArrayList<Integer>();
	private ArrayList<Integer> rank_smartwatchlist = new ArrayList<Integer>();
	private ArrayList<Integer> rank_peripheral_smartlist = new ArrayList<Integer>();
	private ArrayList<Integer> rank_furniturelist = new ArrayList<Integer>();
	private ArrayList<Integer> rank_clothinglist = new ArrayList<Integer>();
	private ArrayList<Integer> rank_sportlist = new ArrayList<Integer>();
	private ArrayList<Integer> rank_stationerylist = new ArrayList<Integer>();
	
	
	public Integer[] getRank_number() {
		return rank_numberlist.toArray(new Integer[rank_numberlist.size()]);
	}
	public Integer[] getUs_number() {
		return us_numberlist.toArray(new Integer[us_numberlist.size()]);
	}
	public Integer[] getRank_kitchen() {
		return rank_kitchenlist.toArray(new Integer[rank_kitchenlist.size()]);
	}
	public Integer[] getRank_life() {
		return rank_lifelist.toArray(new Integer[rank_lifelist.size()]) ;
	}
	public Integer[] getRank_tv() {
		return rank_tvlist.toArray(new Integer[rank_tvlist.size()]) ;
	}
	public Integer[] getRank_digitalcamera() {
		return rank_digitalcameralist.toArray(new Integer[rank_digitalcameralist.size()]) ;
	}
	public Integer[] getRank_desktop() {
		return rank_desktoplist.toArray(new Integer[rank_desktoplist.size()]);
	}
	public Integer[] getRank_notebook() {
		return rank_notebooklist.toArray(new Integer[rank_notebooklist.size()]);
	}
	public Integer[] getRank_2in1() {
		return rank_2in1list.toArray(new Integer[rank_2in1list.size()]);
	}
	public Integer[] getRank_peripheral_com() {
		return rank_peripheral_comlist.toArray(new Integer[rank_peripheral_comlist.size()]);
	}
	public Integer[] getRank_smartphone() {
		return rank_smartphonelist.toArray(new Integer[rank_smartphonelist.size()]);
	}
	public Integer[] getRank_tablet() {
		return rank_tabletlist.toArray(new Integer[rank_tabletlist.size()]);
	}
	public Integer[] getRank_smartwatch() {
		return rank_smartwatchlist.toArray(new Integer[rank_smartwatchlist.size()]);
	}
	public Integer[] getRank_peripheral_smart() {
		return rank_peripheral_smartlist.toArray(new Integer[rank_peripheral_smartlist.size()]);
	}
	public Integer[] getRank_furniture() {
		return rank_furniturelist.toArray(new Integer[rank_furniturelist.size()]);
	}
	public Integer[] getRank_clothing() {
		return rank_clothinglist.toArray(new Integer[rank_clothinglist.size()]);
	}
	public Integer[] getRank_sport() {
		return rank_sportlist.toArray(new Integer[rank_sportlist.size()]);
	}
	public Integer[] getRank_stationery() {
		return rank_stationerylist.toArray(new Integer[rank_stationerylist.size()]);
	}
	
	
	
	//setter
	public void setRank_number(int index, int rank_number) {
		this.rank_numberlist.add(index, rank_number);
	}
	
	public void setUs_number(int index, int us_number) {
		this.us_numberlist.add(index, us_number);;
	}
	public void setRank_kitchen(int index, int rank_kitchen) {
		this.rank_kitchenlist.add(index, rank_kitchen);
	}
	public void setRank_life(int index, int rank_life) {
		this.rank_lifelist.add(index, rank_life);
	}
	public void setRank_tv(int index, int rank_tv) {
		this.rank_tvlist.add(index, rank_tv);
	}
	public void setRank_digitalcamera(int index, int rank_digitalcamera) {
		this.rank_digitalcameralist.add(index, rank_digitalcamera);
	}
	public void setRank_desktop(int index, int rank_desktop) {
		this.rank_desktoplist.add(index, rank_desktop);
	}
	public void setRank_notebook(int index, int rank_notebook) {
		this.rank_notebooklist.add(index, rank_notebook);
	}
	public void setRank_2in1(int index, int rank_2in1) {
		this.rank_2in1list.add(index, rank_2in1);
	}
	public void setRank_peripheral_com(int index, int rank_peripheral_com) {
		this.rank_peripheral_comlist.add(index, rank_peripheral_com);
	}
	public void setRank_smartphone(int index, int rank_smartphone) {
		this.rank_smartphonelist.add(index, rank_smartphone);
	}
	public void setRank_tablet(int index, int rank_tablet) {
		this.rank_tabletlist.add(index, rank_tablet);
	}
	public void setRank_smartwatch(int index, int rank_smartwatch) {
		this.rank_smartwatchlist.add(index, rank_smartwatch);
	}
	public void setRank_peripheral_smart(int index, int rank_peripheral_smart) {
		this.rank_peripheral_smartlist.add(index, rank_peripheral_smart);
	}
	public void setRank_furniture(int index, int rank_furniture) {
		this.rank_furniturelist.add(index, rank_furniture);
	}
	public void setRank_clothing(int index, int rank_clothing) {
		this.rank_clothinglist.add(index, rank_clothing);
	}
	public void setRank_sport(int index, int rank_sport) {
		this.rank_sportlist.add(index, rank_sport);
	}
	public void setRank_stationery(int index, int rank_stationery) {
		this.rank_stationerylist.add(index, rank_stationery);
	}
	
	
	
}
