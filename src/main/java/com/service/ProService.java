package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.ProMapper;
import com.model.ProModel;

@Service
public class ProService {
  @Autowired
  private ProMapper pro;

public List<ProModel> selectList(ProModel po) {
	// TODO Auto-generated method stub
	List<ProModel>list = pro.selectAll(po); 
	System.out.println("11111111111111111111111111111111111111111111111111111111111111111111111"+po.getCode());
	System.out.println(list.toString());
	return list;
}

public int getCount(ProModel po) {
	// TODO Auto-generated method stub
	int a = 0;
	a = pro.selectCount(po);
	return a;
}

public int insert(ProModel po) {
	// TODO Auto-generated method stub
	pro.insert(po);
	int a = pro.selectAll(po).size();
	if(a>0) {
		a=1;
	}
	return a;
}

public int update(ProModel po) {
	// TODO Auto-generated method stub
	pro.update(po);
	int a = pro.selectAll(po).size();
	if(a>0) {
		a = 1;
	}else {
		a=2;
	}
	return a;
}

public int delete(ProModel po) {
	// TODO Auto-generated method stub
	pro.delete(po);
	int a = pro.selectAll(po).size();
	if(a==0) {
		a=1;
	}else {
		a=2;
	}
	return a;
}
  
}
