package com.model;

public class DesModel extends Pager{
   private String code;
   private String name;
   private String parentcode;
   private String des;
   private String name2;
   private String code2;
   
public String getName2() {
	return name2;
}
public void setName2(String name2) {
	this.name2 = name2;
}
public String getCode2() {
	return code2;
}
public void setCode2(String code2) {
	this.code2 = code2;
}
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
public String getParentcode() {
	return parentcode;
}
public void setParentcode(String parentcode) {
	this.parentcode = parentcode;
}
public String getDes() {
	return des;
}
public void setDes(String des) {
	this.des = des;
}
@Override
public String toString() {
	return "DesModel [code=" + code + ", name=" + name + ", parentcode=" + parentcode + ", des=" + des + ", name2="
			+ name2 + ", code2=" + code2 + "]";
}

   
}
