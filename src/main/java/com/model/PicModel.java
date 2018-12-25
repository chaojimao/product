package com.model;

public class PicModel extends Pager{
   private String code;
   private String url;
   private String type;
public String getCode() {
	return code;
}
public void setCode(String code) {
	this.code = code;
}
public String getUrl() {
	return url;
}
public void setUrl(String url) {
	this.url = url;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
@Override
public String toString() {
	return "PicModel [code=" + code + ", url=" + url + ", type=" + type + "]";
}
   
}
