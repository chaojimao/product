package com.model;

public class DictModel {
   private String code;
   private String name;
   private String parentcode;
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
@Override
public String toString() {
	return "DictModel [code=" + code + ", name=" + name + ", parentcode=" + parentcode + "]";
}
   
}
