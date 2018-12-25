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

import com.model.ProModel;
import com.service.ProService;

@Controller
@RequestMapping("/product")
public class ProController {
    @Autowired
    private ProService ps;
    @RequestMapping(value="page",produces="appliaction/json;charset=utf-8")
    @ResponseBody
    public String select (ProModel pm,int pageIndex, int pageLimit) {
    	System.out.println("!111");
	    String code1 = pm.getCode();
	    ProModel model1 = new ProModel();
		String code = code1;
		model1.setCode(code);
		model1.setPageOn(true);
		model1.setPageIndex(pageIndex);
		model1.setPageLimit(pageLimit);
		List<ProModel> list = ps.selectList(model1);
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);	
		System.out.println(list.toString());
		map.put("count", ps.getCount(model1));
		System.out.println(ps.getCount(model1));
		return new JSONObject(map).toString();
    }
    @RequestMapping(value="select",produces="appliaction/json;charset=utf-8")
    @ResponseBody
    public String selectall (ProModel pm) {
    	List<ProModel>list = ps.selectList(pm);
    	return new JSONArray(list).toString();
    }
    @RequestMapping("/insert")
    @ResponseBody
    public String insert (ProModel pm) {
    	int s = 0;
    	ProModel model = new ProModel();
    	model.setCode(pm.getCode());
    	int b = ps.selectList(model).size();
    	int a= 0;
    	if(b>0) {
    		s=2;
    	}
    	if(b==0)
    	{
    	   a = ps.insert(pm);
    	}
    	if(b==0&&a>0) {
    		s=1;
    	}
    	return String.valueOf(s);
    }
    @RequestMapping("/update")
    @ResponseBody
    public String update (ProModel pro) {
    	int s =0;
    	int a = ps.update(pro);
    	if(a==1) {
    		s=1;
    	}else {
    		s=2;
    	}
    
    	return String.valueOf(s);
    }
    @RequestMapping("/delete")
    @ResponseBody
    public String delete (ProModel pro) {
    	int s = 0;
    	int a =ps.delete(pro);
    	if(a==1){
    		s=1;
    	}else {
    		s=2;
    	}
    	return String.valueOf(s);
    }
    @RequestMapping(value="zhanshi",produces="appliaction/json;charset=utf-8")
    @ResponseBody
    public String zhanshi (ProModel pm,int pageIndex, int pageLimit) {
	    ProModel model1 = new ProModel();
		String name = pm.getName();
		System.out.println(pm.getName());
		model1.setName(name);
		model1.setPageOn(true);
		model1.setPageIndex(pageIndex);
		model1.setPageLimit(pageLimit);
		List<ProModel> list = ps.selectList(model1);
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);	
		System.out.println(list.toString());
		map.put("count", ps.getCount(model1));
		System.out.println(ps.getCount(model1));
		return new JSONObject(map).toString();
    }
    @RequestMapping(value="zs",produces="appliaction/json;charset=utf-8")
    @ResponseBody
    public String zs (ProModel pm,int pageIndex, int pageLimit) {
	    ProModel model1 = new ProModel();
		String cate = pm.getCate();
		model1.setCate(cate);;
		model1.setPageOn(true);
		model1.setPageIndex(pageIndex);
		model1.setPageLimit(pageLimit);
		List<ProModel> list = ps.selectList(model1);
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);	
		System.out.println(list.toString());
		map.put("count", ps.getCount(model1));
		System.out.println(ps.getCount(model1));
		return new JSONObject(map).toString();
    }
}










