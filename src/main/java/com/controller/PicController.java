package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.model.PicModel;
import com.service.PicService;

@Controller
@RequestMapping("/pic")
public class PicController {
   @Autowired
   private PicService ps;
   private String PATH = "D:/DxOffice/workspace/image/";
   @RequestMapping("/sc")
   @ResponseBody
   public String sc(HttpServletRequest request, String code) throws IllegalStateException, IOException{
       // 将当前上下文初始化给 CommonsMutipartResolver （多部分解析器）
       CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
               request.getSession().getServletContext());
       // 检查form中是否有enctype="multipart/form-data"
       if (multipartResolver.isMultipart(request)) {
           // 将request变成多部分request
           MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
           // 获取multiRequest 中所有的文件名
           Iterator<String> iter = multiRequest.getFileNames();
           // 一次遍历所有文件
           while (iter.hasNext()) {
               MultipartFile file = multiRequest.getFile(iter.next().toString());
               if (file != null) {
                   String filename = file.getOriginalFilename();
                   String saveName = UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
                   String path = PATH + saveName;
                   file.transferTo(new File(path));// 上传
                   //ps.insert(new PicModel(code, saveName, "2"));
                   PicModel pic = new PicModel();
                   pic.setCode(code);
                   pic.setUrl(saveName);
                   pic.setType("2");
                   ps.insert(pic);
               }
           }
       }
       Map<String, String> result = new HashMap<>();
       result.put("code", "0");
       return new JSONObject(result).toString();
   }
   @RequestMapping(value = "select", produces = "application/json;charset=utf-8")
   @ResponseBody
   public String select (PicModel pm) {
	  List<PicModel>list = ps.select(pm);
	  return new JSONArray(list).toString();
   }
   @RequestMapping("/delete")
   @ResponseBody
   public String delete (PicModel pm) {
	   int s = 0;
	   int a= ps.delete(pm);
	   if(a==1) {
		   s=1;
	   }else {
		   s=2;
	   }
	   return String.valueOf(s);
   }
   @RequestMapping("/update")
   @ResponseBody
   public String update (PicModel pm) {
	   String code = ps.select(pm).get(0).getCode();
	   PicModel ss =  new PicModel();
	   ss.setCode(code);
	   ss.setType("2");
	   ps.update2(ss);
	   PicModel model =new PicModel();
	   model.setUrl(pm.getUrl());
	   model.setType("1");
	   int s = 0;
	   int a = ps.update(model);
	   if(a==1) {
		   s=1;
	   }else {
		   s=2;
	   }
	   return String.valueOf(s);
   }
}









