package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.GoodsMapper;
import com.model.GoodsModel;

@Service
public class GoodsService {
    @Autowired
    private GoodsMapper gm;

	public List<GoodsModel> selectList(GoodsModel gm2) {
		// TODO Auto-generated method stub
		List<GoodsModel>list = gm.selectAll(gm2);
		return list;
	}

	public void insert(GoodsModel gm2) {
		// TODO Auto-generated method stub
		gm.insert(gm2);
	}

	public int delete(GoodsModel gm2) {
		// TODO Auto-generated method stub
		gm.delete(gm2);
		int a = gm.selectAll(gm2).size();
		if(a==0) {
			a=1;
		}else {
			a=2;
		}
		return a;
	}

	public List<GoodsModel> selectListlll(GoodsModel gm2) {
		// TODO Auto-generated method stub
		List<GoodsModel>list = gm.selectModel(gm2);
		return list;
	}
    
}
