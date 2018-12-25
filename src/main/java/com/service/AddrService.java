package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.AddrMapper;
import com.model.AddrModel;

@Service
public class AddrService {
     @Autowired
     private AddrMapper am;

	public int insert(AddrModel am2) {
		// TODO Auto-generated method stub
		am.insert(am2);
		int a = am.selectAll(am2).size();
		if(a>0) {
			a=1;
		}else {
			a=2;
		}
		return a;
	}

	public List<AddrModel> selectList(AddrModel am2) {
		// TODO Auto-generated method stub
		List<AddrModel>list = am.selectModel(am2);
		return list;
	}

	public int update(AddrModel am2) {
		// TODO Auto-generated method stub
		am.update(am2);
		int a = am.selectAll(am2).size();
		if(a>0) {
			a=1;
		}else {
			a=2;
		}
		return a;
	}
}
