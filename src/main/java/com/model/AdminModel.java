package com.model;

public class AdminModel extends Pager{
   private String account;
   private String password;
   private String username;
public String getAccount() {
	return account;
}
public void setAccount(String account) {
	this.account = account;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}

@Override
public String toString() {
	return "AdminModel [account=" + account + ", password=" + password + ", username=" + username + "]";
}
   
}
