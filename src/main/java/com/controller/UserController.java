package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.GoodsModel;
import com.model.OrderModel;
import com.model.UserModel;
import com.service.OrderService;
import com.service.UserService;
@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService uc;
	@Autowired
	private OrderService ds;
    @RequestMapping("/res")
    @ResponseBody
    public String res(UserModel model) {
        UserModel model1 = new UserModel();
        model1.setAccount(model.getAccount());
        int a= uc.getList(model1);
        int s = 0;
        if(a>0) {
        	s=1;
        }
        if(a==0) {
        	UserModel um = new UserModel();
        	um.setAccount(model.getAccount());
        	String password = uc.mmd(model.getPassword());
        	um.setPassword(password);
        	um.setUsername(model.getUsername());
        	uc.insert2(um);
        	s=0;
        }
        return String.valueOf(s);
    }
    @RequestMapping("/login")
    @ResponseBody
    public String login(UserModel mo,HttpSession response,String code,Model model) {
    	UserModel um = new UserModel();
    	um.setAccount(mo.getAccount());
    	String password = uc.mmd(mo.getPassword());
    	um.setPassword(password);
    	int a = uc.getList(um);
    	String s = String.valueOf(response.getAttribute("authCode"));
    	int b = 0;
    	UserModel  s1 = new UserModel();
    	s1.setAccount(mo.getAccount());
    	List<UserModel> l1 = uc.selectList(s1);
        if(a!=1&&s.equals(code)) {
        	b=2;
        }
        if(!s.equals(code)&&a==1) {
        	b=3;
        }
        if(a==1&&s.equals(code)) {   
        	b = 1;
        	response.setAttribute("login", l1.get(0));
        }
        //return "jsp/index";
        return String.valueOf(b);
    }
	@RequestMapping("/usermessage")
	@ResponseBody
	public String usermessage (UserModel model,int pageIndex,int pageLimit) {
		UserModel model1 = new UserModel();
		String code = model.getAccount();
		String account = "%"+code+"%";
		model1.setAccount(account);
		model1.setPageOn(true);
		model1.setPageIndex(pageIndex);
		model1.setPageLimit(pageLimit);
		List<UserModel> list = uc.selectList(model1);
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);		
		map.put("count", uc.getCount(model1));
		return new JSONObject(map).toString();
	}
	@RequestMapping("/select")
	@ResponseBody
	public String select (UserModel model) {
		List<UserModel> list = uc.selectList(model);
		System.out.println(list.toString());
		return new JSONArray(list).toString();
	}
	@RequestMapping("/updateuser")
	@ResponseBody
	public String updateUser(UserModel model) {
		String a = String.valueOf(uc.insert(model));
		return a;
	}
	@RequestMapping("/delete")
	@ResponseBody
	public String delete (UserModel model) {
		int s = 0;
		List<UserModel> list = uc.selectList(model);
		String name = list.get(0).getUsername();
		OrderModel om = new OrderModel();
		om.setUsername(name);
		List<OrderModel>list1 = ds.selectList(om);
		String stat="";
		if(list1.size()>0) {
			 stat = list1.get(0).getStat();
		}
		String s1 = "ÒÑÏÂµ¥";
		if(stat.equals(s1)) {
			s=2;
		}else {
			uc.delete(model);
			s=1;
		}
		return String.valueOf(s);
	}
	@RequestMapping("/zhuxiao")
	public String zhuxiao(HttpSession request) {
		request.removeAttribute("login");
		return "jsp/index";
	}
}
