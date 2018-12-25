package com.model;

public class AddrModel extends Pager {
   private String  account;
   private Integer id;
   private String  username;
   private String  tel;
   private String  addr1;
   private String  addr2;
   private String  addr3;
   private String  addr4;
   private String  address1;
   private String  address2;
   private String  address3;
   private String  address4;
   private String  type1;
public String getAccount() {
	return account;
}
public void setAccount(String account) {
	this.account = account;
}
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getTel() {
	return tel;
}
public void setTel(String tel) {
	this.tel = tel;
}
public String getAddr1() {
	return addr1;
}
public void setAddr1(String addr1) {
	this.addr1 = addr1;
}
public String getAddr2() {
	return addr2;
}
public void setAddr2(String addr2) {
	this.addr2 = addr2;
}
public String getAddr3() {
	return addr3;
}
public void setAddr3(String addr3) {
	this.addr3 = addr3;
}
public String getAddr4() {
	return addr4;
}
public void setAddr4(String addr4) {
	this.addr4 = addr4;
}
public String getAddress1() {
	return address1;
}
public void setAddress1(String address1) {
	this.address1 = address1;
}
public String getAddress2() {
	return address2;
}
public void setAddress2(String address2) {
	this.address2 = address2;
}
public String getAddress3() {
	return address3;
}
public void setAddress3(String address3) {
	this.address3 = address3;
}
public String getAddress4() {
	return address4;
}
public void setAddress4(String address4) {
	this.address4 = address4;
}
public String getType1() {
	return type1;
}
public void setType1(String type1) {
	this.type1 = type1;
}
@Override
public String toString() {
	return "AddrModel [account=" + account + ", id=" + id + ", username=" + username + ", tel=" + tel + ", addr1="
			+ addr1 + ", addr2=" + addr2 + ", addr3=" + addr3 + ", addr4=" + addr4 + ", address1=" + address1
			+ ", address2=" + address2 + ", address3=" + address3 + ", address4=" + address4 + ", type1=" + type1 + "]";
}

   
}
