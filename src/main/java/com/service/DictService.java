package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.DictMapper;
import com.model.DictModel;

@Service
public class DictService {
 @Autowired
   private DictMapper dm;

public List<DictModel> selectList(DictModel dm2) {
	// TODO Auto-generated method stub
	List<DictModel>list = dm.selectAll(dm2);
	return list;
}
}
