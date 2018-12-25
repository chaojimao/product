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

import com.model.AddrModel;
import com.model.OrderModel;
import com.service.AddrService;
import com.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
   @Autowired
   private OrderService os;
   @Autowired
   private AddrService as;
   @RequestMapping(value = "page", produces = "application/json;charset=utf-8")
   @ResponseBody
   public String page (OrderModel om,int pageIndex,int pageLimit) {
	    String code1 = om.getCode();
	    OrderModel model1 = new OrderModel();
		String code = "%"+code1+"%";
		model1.setCode(code);
		model1.setPageOn(true);
		model1.setPageIndex(pageIndex);
		model1.setPageLimit(pageLimit);
		List<OrderModel> list = os.selectList(model1);
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);	
		System.out.println(list.toString());
		map.put("count", os.getCount(model1));
		return new JSONObject(map).toString();
   }
   @RequestMapping(value = "select", produces = "application/json;charset=utf-8")
   @ResponseBody
   public String selete (OrderModel om) {
	   System.out.println(om.getCode());
	   List<OrderModel>list = os.selectList(om);
	   return new JSONArray(list).toString();
   }
   @RequestMapping("/update")
   @ResponseBody
   public String update(OrderModel om) {
	   int s = 0;
	   int a = os.update(om);
	   if(a>0) {
		   s=1;
	   }else {
		   s=2;
	   }
	   return String.valueOf(s);
   }
   @RequestMapping("/delete")
   @ResponseBody
   public String delete (OrderModel om) {
	   int a = os.delete(om);
	   int s = 0;
	   if(a>0) {
		   s=1;
	   }else {
		   s=2;
	   }
	   return String.valueOf(s);
   }

}










