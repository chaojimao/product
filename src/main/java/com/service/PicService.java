package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.PicMapper;
import com.model.PicModel;

@Service
public class PicService {
   @Autowired
   private PicMapper pm;

public void insert(PicModel pc) {
	// TODO Auto-generated method stub
	pm.insert(pc);
}

public List<PicModel> select(PicModel pc) {
	// TODO Auto-generated method stub
	List<PicModel>list = pm.selectAll(pc);
	return list;
}

public int delete(PicModel pc) {
	// TODO Auto-generated method stub
	pm.delete(pc);
	int a = pm.selectAll(pc).size();
	if(a>0) {
		a=2;
	}
	if(a==0) {
		a=1;
	}
	return a;
}

public int update(PicModel pc) {
	// TODO Auto-generated method stub
	pm.update(pc);
	int a = pm.selectAll(pc).size();
	if(a>0) {
		a=1;
	}
	if(a==0) {
		a=2;
	}
	return a;
}

public void update2(PicModel pc) {
	// TODO Auto-generated method stub
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
	pm.update2(pc);
}
}
