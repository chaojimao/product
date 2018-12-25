package com.model;

public class OrderModel extends Pager{
   private String code;
   private String username;
   private String address;
   private String stat;
   private String account;
   private String time;
public String getCode() {
	return code;
}
public void setCode(String code) {
	this.code = code;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getStat() {
	return stat;
}
public void setStat(String stat) {
	this.stat = stat;
}
public String getAccount() {
	return account;
}
public void setAccount(String account) {
	this.account = account;
}
public String getTime() {
	return time;
}
public void setTime(String time) {
	this.time = time;
}
@Override
public String toString() {
	return "OrderModel [code=" + code + ", username=" + username + ", address=" + address + ", stat=" + stat
			+ ", account=" + account + ", time=" + time + "]";
}
   
}
