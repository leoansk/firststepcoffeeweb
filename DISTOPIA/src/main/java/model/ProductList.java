package model;

import java.util.ArrayList;

public class ProductList {

private ArrayList<Integer> pro_numberlist = new ArrayList<Integer>();
private ArrayList<String> pro_namelist = new ArrayList<String>();
private ArrayList<Integer> pro_pricelist = new ArrayList<Integer>();
private ArrayList<String> pro_explainlist = new ArrayList<String>();
private ArrayList<Integer> sc_numberlist = new ArrayList<Integer>();
private ArrayList<String> pro_modelnamelist = new ArrayList<String>();
private ArrayList<String> pro_datelist = new ArrayList<String>();
private ArrayList<String> pro_makerlist = new ArrayList<String>();
private ArrayList<String> pro_photolist = new ArrayList<String>();
private ArrayList<Integer> pro_avgscorelist = new ArrayList<Integer>();

public Integer[] getPro_number() {
return pro_numberlist.toArray(new Integer[pro_numberlist.size()]);// �÷��� ������ ��ũ��
}

public String[] getPro_name() {
return pro_namelist.toArray(new String[pro_namelist.size()]);
}

public String[] getPro_price() {
return pro_pricelist.toArray(new String[pro_pricelist.size()]);
}

public String[] getPro_explain() {
return pro_explainlist.toArray(new String[pro_explainlist.size()]);
}

public String[] getSc_number() {
return sc_numberlist.toArray(new String[sc_numberlist.size()]);
}
public String[] getPro_modelname() {
return pro_modelnamelist.toArray(new String[pro_modelnamelist.size()]);
}

public String[] getPro_date() {
return pro_datelist.toArray(new String[pro_datelist.size()]);
}

public String[] getPro_maker() {
return pro_makerlist.toArray(new String[pro_makerlist.size()]);
}

public String[] getPro_photo() {
return pro_photolist.toArray(new String[pro_photolist.size()]);
}

public Integer[] getPro_avgscore() {
return pro_avgscorelist.toArray(new Integer[pro_avgscorelist.size()]);	
}

public void setPro_number(int index, int pro_number) {
this.pro_numberlist.add(index, pro_number);
}

public void setPro_name(int index, String pro_name) {
this.pro_namelist.add(index, pro_name);
}

public void setPro_price(int index, int pro_price) {
this.pro_pricelist.add(index, pro_price);
}

public void setPro_explain(int index, String pro_explain) {
this.pro_explainlist.add(index, pro_explain);
}

public void setSc_number(int index, int sc_number) {
this.sc_numberlist.add(index, sc_number);
}

public void setPro_modelname(int index, String pro_modelname) {
this.pro_modelnamelist.add(index, pro_modelname);
}

public void setPro_date(int index, String pro_date) {
this.pro_datelist.add(index, pro_date);
}

public void setPro_maker(int index, String pro_maker) {
this.pro_makerlist.add(index, pro_maker);
}

public void setPro_photo(int index, String pro_photo) {
this.pro_photolist.add(index, pro_photo);
}
public void setPro_avgscore(int index, int pro_avgscore){
this.pro_avgscorelist.add(index, pro_avgscore);
}

public int getListSize() {
	return pro_numberlist.size();
}
}
