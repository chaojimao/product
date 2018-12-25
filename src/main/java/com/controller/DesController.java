package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.DesModel;
import com.service.DesService;

@Controller
@RequestMapping("/goods")
public class DesController {
   @Autowired
   private  DesService ds ;
   @RequestMapping(value="page",produces="appliaction/json;charset=utf-8")
   @ResponseBody
   public String select (DesModel des,int pageIndex,int pageLimit) {
	    System.out.println("!111");
	    String code1 = des.getCode();
	    DesModel model1 = new DesModel();
		String code = "%"+code1+"%";
		model1.setCode(code);
		model1.setPageOn(true);
		model1.setPageIndex(pageIndex);
		model1.setPageLimit(pageLimit);
		List<DesModel> list = ds.selectList(model1);
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);	
		System.out.println(list.toString());
		map.put("count", ds.getCount(model1));
		System.out.println(ds.getCount(model1));
		return new JSONObject(map).toString();
   }
   @RequestMapping(value="add",produces="appliaction/json;charset=utf-8")
   @ResponseBody
   public String add(DesModel des) {
	   List<DesModel> list = ds.selectList(des);
	   return new JSONArray(list).toString();
   }
   @RequestMapping("/add1")
   @ResponseBody
   public String add1(DesModel des) {
	   System.out.println("!!!!"+des.getDes());
	   int a = 0;
	   DesModel model = new DesModel();
	   model.setCode(des.getCode());
	   int d = ds.selectList(model).size();
	   System.out.println(des.getCode());
	   if(d==0&&ds.insert(des)>0) {
		   a=1;
	   }else {
		   a=2;
	   }
	   System.out.println(d);
	   System.out.println(a);
	   return String.valueOf(a);
   }
   @RequestMapping("/update")
   @ResponseBody
   public String update (DesModel des) {
	   int s = 0;
	   int a = ds.update(des);
	   if(a>0) {
		   s = 1;
	   }else {
		   s=2;
	   }
	   return String.valueOf(s);
   }
   @RequestMapping("/delete")
   @ResponseBody
   public String delete (DesModel des) {
	   DesModel model = new DesModel();
	   model.setParentcode(des.getCode());
	   int a = ds.selectList(model).size();
	   int d = 0;
	   if(a>0) {
		   d=2;
	   }
	   if(a==0) {
		   d = 1;
		   ds.delete(des);
	   }
	   return String.valueOf(d);
   }
}
