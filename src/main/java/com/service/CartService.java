package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.CartMapper;
import com.model.CartModel;

@Service
public class CartService {
   @Autowired
   private CartMapper cm;

public int insert(CartModel cm2) {
	// TODO Auto-generated method stub
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1");
	cm.insert(cm2);
	int a = cm.selectAll(cm2).size();
	System.out.println("!1111111111111111111111"+cm.selectAll(cm2).toString());
	if(a>0) {
		a=1;
	}else {
		a=2;
	}
	return a;
}

public List<CartModel> selectList(CartModel cm2) {
	// TODO Auto-generated method stub
	List<CartModel> list = cm.selectAll(cm2);
	return list;
}

public int delete(CartModel cm2) {
	// TODO Auto-generated method stub
	cm.delete(cm2);
	int a = cm.selectAll(cm2).size();
	if(a>0) {
		a=1;
	}else {
		a=2;
	}
	return a;
}

public int update(CartModel cm2) {
	// TODO Auto-generated method stub
	cm.update(cm2);
	int a = cm.selectAll(cm2).size();
	if(a>0) {
		a=1;
	}else {
		a=2;
	}
	return a;
}

public int update2(CartModel cm2) {
	// TODO Auto-generated method stub
	cm.update2(cm2);
	int a = cm.selectAll(cm2).size();
	if(a>0) {
		a=1;
	}else {
		a=2;
	}
	return a;
}
   
}
