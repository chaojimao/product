package com.service;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.AdminMapper;
import com.model.AdminModel;

import sun.misc.BASE64Encoder;

@Service
public class AdminService {
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

    @Autowired
    private AdminMapper as;
    public int getList(AdminModel us) {
		// TODO Auto-generated method stub
		int d = 0 ;
		if(as.selectAll(us).size()>0) {
			d=1;
		}else {
			d=0;
		}
		return d;
	}
	public List<AdminModel> selectList(AdminModel am) {
		// TODO Auto-generated method stub
		List<AdminModel>list = as.selectAll(am);
		return list;
	}
}
