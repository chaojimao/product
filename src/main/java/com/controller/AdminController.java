package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.AdminModel;
import com.model.UserModel;
import com.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService uc;
	@RequestMapping("/login")
	@ResponseBody
    public String login (AdminModel model,HttpSession session,String code) {
		int a = uc.getList(model);
    	String s = String.valueOf(session.getAttribute("authCode"));
    	int b = 0;
    	AdminModel am = new AdminModel();
    	am.setAccount(model.getAccount());
    	List<AdminModel>list = uc.selectList(am);
        if(a!=1&&s.equals(code)) {
        	b=2;
        }
        if(!s.equals(code)&&a==1) {
        	b=3;
        }
        if(a==1&&s.equals(code)) {   
        	b = 1;
        	session.setAttribute("login1",list.get(0));
        }
        return String.valueOf(b);
    }
	@RequestMapping("/zhuxiao")
	public String zhuxiao(HttpSession request) {
		request.removeAttribute("login1");
		return "jsp/adminlogin";
	}
}
