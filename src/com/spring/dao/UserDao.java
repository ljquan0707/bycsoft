package com.spring.dao;

import java.sql.Blob;
import java.util.List;


import com.spring.pojo.User;

public interface UserDao {
	
	//添加用户
	public void add(User user);
	//删除用户
	public void delete(String username);
	//更新用户
	public void update(User user);
	//修改密码
	public void updatep(String username,String password);
	public void updateimg(int id ,String photo);
	public void uodatenickname(String username,String nickname,String signature);
	//查看列表
	public List Userlist();
	public List userlist(String colum,String obj);
	//验证用户
	public List selectuser(String username,String password);
	public List suser(String username,String tel);
	
	public List selectid(String username);
	

	
}
