package com.controller;

import java.util.List;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.DictModel;
import com.service.DictService;

@Controller
@RequestMapping("/dict")
public class DictController {
  @Autowired
  private DictService ds;
  @RequestMapping(value = "select", produces = "application/json;charset=utf-8")
  @ResponseBody
  public String select (DictModel dm) {
	  System.out.println(dm.getParentcode());
	  List<DictModel>list = ds.selectList(dm);
	  System.out.println(list.toString());
	  return new JSONArray(list).toString();
  }
}
