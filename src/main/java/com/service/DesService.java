package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.DesMapper;
import com.model.DesModel;
@Service
public class DesService {
	@Autowired
	private DesMapper des;
	public List<DesModel> selectList(DesModel dd) {
		// TODO Auto-generated method stub
		List<DesModel> list = des.selectAll(dd);
		return list;
	}
	public int getCount(DesModel dd) {
		// TODO Auto-generated method stub
		int a = 0;
		a = des.selectCount(dd);
		return a;
	}
	public int insert(DesModel dd) {
		// TODO Auto-generated method stub
		des.insert(dd);
		int a = 0;
		a = des.selectAll(dd).size();
		return a;
	}
	public int update(DesModel dd) {
		// TODO Auto-generated method stub
		des.update(dd);
		int a = 0;
		a = des.selectAll(dd).size();
		return a;
	}
	public void delete(DesModel dd) {
		// TODO Auto-generated method stub
		des.delete(dd);
	}

}
