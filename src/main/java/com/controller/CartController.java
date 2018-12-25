package com.controller;

import java.io.Console;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.AddrModel;
import com.model.CartModel;
import com.model.GoodsModel;
import com.model.OrderModel;
import com.service.AddrService;
import com.service.CartService;
import com.service.GoodsService;
import com.service.OrderService;

import util.FormatEmpty;

@Controller
@RequestMapping("/cart")
public class CartController {
  @Autowired
  private CartService cs;
  @Autowired
  private OrderService os;
  @Autowired
  private AddrService as;
  @Autowired
  private GoodsService gs;
  @RequestMapping("/insert")
  @ResponseBody
  public String insert (CartModel cm) {
	  CartModel cm1 = new CartModel();
	  cm1.setAccount(cm.getAccount());
	  cm1.setCode(cm.getCode());
	  int m = cs.selectList(cm1).size();
	  int s = 0;
	  if(m>0) {
		  cm1.setAmount(cm.getAmount()+cs.selectList(cm1).get(0).getAmount());
		  int a = cs.update2(cm1);
		  if(a==1) {
			  s=1;
		  }else {
			  s=2;
		  }
	  }else {
		  int a = cs.insert(cm);
		  if(a==1) {
			  s=1;
		  }else {
			  s=2;
		  }
	  }
	  return String.valueOf(s);
  }
  @RequestMapping(value="select",produces="appliaction/json;charset=utf-8")
  @ResponseBody
  public String select (CartModel cm) {
	  List<CartModel>list = cs.selectList(cm);
	  return new JSONArray(list).toString();
  }
  @RequestMapping("/delete")
  @ResponseBody
  public String delete (CartModel cm) {
	  System.out.println("1111111111111111111111111111111"+cm.getId());
	  int a = cs.delete(cm);
	  int s = 0;
	  if(a==1) {
		  s=2;
	  }else {
		  s=1;
	  }
	  return String.valueOf(s);
  }
  @RequestMapping("/update")
  @ResponseBody
  public String update (CartModel cm) {
	  int a = cs.update(cm);
	  int s = 0;
	  if(a==1) {
		  s=1;
	  }else {
		  s=2;
	  }
	  return String.valueOf(s);
  }
  @RequestMapping("/delete2")
  @ResponseBody
  public String delete2 (String []id,String m,String stat) {
	  Date day=new Date();
      SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	  String time = df.format(day);
	  String code = UUID.randomUUID().toString();
	  AddrModel am = new AddrModel();
	  am.setId(Integer.parseInt(m));
	  List<AddrModel> l = as.selectList(am);
	  String address = l.get(0).getAddress1()+l.get(0).getAddress2()+l.get(0).getAddress3()+l.get(0).getAddr4();
	  String username = l.get(0).getUsername();
	  String account  = l.get(0).getAccount();
	  OrderModel om = new OrderModel();
	  om.setCode(code);
	  om.setAddress(address);
	  om.setUsername(username);
	  om.setStat(stat);
	  om.setAccount(account);
	  om.setTime(time);
	  os.insert(om);
	  for(String s :id) {
		  CartModel cm = new CartModel();
		  cm.setId(Integer.parseInt(s));
		  List<CartModel>list=cs.selectList(cm);
		  String code2 = list.get(0).getCode();
		  int amount = list.get(0).getAmount();
		  int price = list.get(0).getPrice();
		  int price2 = price*amount;
		  GoodsModel gm = new GoodsModel();
		  gm.setAmount(amount);
		  gm.setCode(code);
		  gm.setCode2(code2);
		  gm.setPrice(price2);
		  gs.insert(gm);
	  }
	  for(String a:id) {
		  CartModel cm = new CartModel();
		  cm.setId(Integer.parseInt(a));
		  cs.delete(cm);
	  }
	  return "1";
  }
}








