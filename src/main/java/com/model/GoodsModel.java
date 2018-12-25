package com.model;

public class GoodsModel {
   private Integer id;
   private String code;
   private int price;
   private int amount;
   private String code2;
   private String name;
   private String url;
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getCode() {
	return code;
}
public void setCode(String code) {
	this.code = code;
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
public String getCode2() {
	return code2;
}
public void setCode2(String code2) {
	this.code2 = code2;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getUrl() {
	return url;
}
public void setUrl(String url) {
	this.url = url;
}
@Override
public String toString() {
	return "GoodsModel [id=" + id + ", code=" + code + ", price=" + price + ", amount=" + amount + ", code2=" + code2
			+ ", name=" + name + ", url=" + url + "]";
}
   
}
