package com.service;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.mapper.UserMapper;
import com.model.UserModel;

import sun.misc.BASE64Encoder;
@Service

public class UserService {
    @Autowired
    private UserMapper usermapper;
	public int getList(UserModel us) {
		// TODO Auto-generated method stub
		int d = 0 ;
		if(usermapper.selectAll(us).size()>0) {
			d=1;
		}else {
			d=0;
		}
		return d;
	}
	public List<UserModel> selectList(UserModel us) {
		List<UserModel> list = usermapper.selectAll(us);

		return list;
	}
	public Object getCount(UserModel us) {
		// TODO Auto-generated method stub
		int count = 0;
		count = usermapper.selectCount(us);
		return count;
	}
	public int insert(UserModel us) {
		// TODO Auto-generated method stub
		int a = 0;
		usermapper.update(us);
		if(usermapper.selectAll(us).size()>0) {
			a = 1;
		}else {
			a = 2;
		}
		return a;
	}
	public void delete(UserModel us) {
		// TODO Auto-generated method stub
		usermapper.delete(us);
	}
	public void insert2(UserModel us) {
		// TODO Auto-generated method stub
		usermapper.insert(us);
	}
	public String mmd(String str) {
		String password = "";
		try {
		MessageDigest md5 = MessageDigest.getInstance("MD5");
		BASE64Encoder base = new BASE64Encoder();
		password = base.encode(md5.digest(str.getBytes("UTF-8")));
		} catch (NoSuchAlgorithmException e) {
		e.printStackTrace();
		} catch (UnsupportedEncodingException f) {
		f.printStackTrace();
		}
		return password;
		}
}
