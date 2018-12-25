package com.controller;

import java.util.List;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.AddrModel;
import com.service.AddrService;

@Controller
@RequestMapping("/addr")
public class AddrController {
    @Autowired
    private AddrService as;
    @RequestMapping("/insert")
    @ResponseBody
    public String insert (AddrModel am) {
    	int a = as.insert(am);
    	int s = 0;
    	if(a==1) {
    		s=1;
    	}else {
    		s=2;
    	}
    	return String.valueOf(s);
    }
    @RequestMapping(value="select",produces="appliaction/json;charset=utf-8")
    @ResponseBody
    public String select (AddrModel am) {
    	List<AddrModel>list = as.selectList(am);
    	return new JSONArray(list).toString();
    }
    @RequestMapping("/update")
    @ResponseBody
    public String update (AddrModel am) {
    	int a = as.update(am);
    	int s = 0;
    	if(a==1) {
    		s=1;
    	}else {
    		s=2;
    	}
    	return String.valueOf(s);
    }
}
