package com.controller;

import java.util.List;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.GoodsModel;
import com.service.GoodsService;


@Controller
@RequestMapping("/ddgoods")
public class GoodsController {
   @Autowired
   private GoodsService ds;
   @RequestMapping(value = "select", produces = "application/json;charset=utf-8")
   @ResponseBody
   public String select (GoodsModel gm) {
	   List<GoodsModel>list = ds.selectList(gm);
	   System.out.println("111111111111111111111111111111"+list.toString());
	   return new JSONArray(list).toString();
   }
   @RequestMapping("/add")
   @ResponseBody
   public String add(GoodsModel gm) {
	   System.out.println("aaaaaaaaaaaaaaaaaaaaaaaa");
	   int a = 1;
	   ds.insert(gm);
	   return String.valueOf(a);
   }
   @RequestMapping("/delete")
   @ResponseBody
   public String delete (GoodsModel gm) {
	   int a = ds.delete(gm);
	   int s = 0;
	   if(a==1) {
		   s=1;
	   }else {
		   s=2;
	   }
	   return String.valueOf(s);
   }
   @RequestMapping(value = "selectlll", produces = "application/json;charset=utf-8")
   @ResponseBody
   public String selectlll (GoodsModel gm) {
	   List<GoodsModel>list = ds.selectListlll(gm);
	   return new JSONArray(list).toString();
   }
}











