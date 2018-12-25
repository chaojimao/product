package com.model;

public class CartModel {
   private Integer id; 
   private String account;
   private String code;
   private int amount;
   private String url;
   private String name;
   private int price;
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getAccount() {
	return account;
}
public void setAccount(String account) {
	this.account = account;
}
public String getCode() {
	return code;
}
public void setCode(String code) {
	this.code = code;
}
public int getAmount() {
	return amount;
}
public void setAmount(int amount) {
	this.amount = amount;
}
public String getUrl() {
	return url;
}
public void setUrl(String url) {
	this.url = url;
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
@Override
public String toString() {
	return "CartModel [id=" + id + ", account=" + account + ", code=" + code + ", amount=" + amount + ", url=" + url
			+ ", name=" + name + ", price=" + price + "]";
}
   
}
