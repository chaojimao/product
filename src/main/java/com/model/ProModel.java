package com.model;

public class ProModel extends PagerModel{
    private String code;
    private String name;
    private int price;
    private int amount;
    private String des;
    private String stat;
    private String cate;
	private String url;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public String getStat() {
		return stat;
	}
	public void setStat(String stat) {
		this.stat = stat;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "ProModel [code=" + code + ", name=" + name + ", price=" + price + ", amount=" + amount + ", des=" + des
				+ ", stat=" + stat + ", cate=" + cate + ", url=" + url + "]";
	}
	
}
