package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.OrderMapper;
import com.model.OrderModel;

@Service
public class OrderService {
   @Autowired
   private OrderMapper om;

public List<OrderModel> selectList(OrderModel od) {
	// TODO Auto-generated method stub
	List<OrderModel> list = om.selectAll(od);
	return list;
}

public int getCount(OrderModel od) {
	// TODO Auto-generated method stub
	int a = om.selectCount(od);
	return a;
}

public int update(OrderModel od) {
	// TODO Auto-generated method stub
	om.update(od);
	int a = om.selectAll(od).size();
	if(a>0) {
		a=1;
	}else {
		a=2;
	}
	return a;
}

public int delete(OrderModel od) {
	// TODO Auto-generated method stub
	om.delete(od);
	int a= om.selectAll(od).size();
	if(a>0) {
		a=0;
	}else {
		a=1;
	}
	return a;
}

public void insert(OrderModel od) {
	// TODO Auto-generated method stub
	om.insert(od);
}
}
