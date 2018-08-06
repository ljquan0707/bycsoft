package com.spring.service;

import java.sql.Blob;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


import com.spring.dao.UserDao;
import com.spring.pojo.User;
@Component("userservice")
public class UserService {
	
    private UserDao userdao;
    @Resource(name="userdao")
	public void setUserdao(UserDao userdao) {
		this.userdao = userdao;
	}
    @Transactional
	public void add(User user){
		userdao.add(user);
		
	}
    @Transactional
    public List selectuser(String username,String password){
    	return userdao.selectuser(username,password);
    }
    @Transactional
    public List selectu(String username,String tel){
    	return userdao.suser(username, tel);
    }
    @Transactional
    public List loginlist(){
    	return userdao.Userlist();
    }
    @Transactional
    public List lookuser(String colum,String obj){
    	return userdao.userlist(colum, obj);
    }
    /*@Transactional
    public List selectimg(int roleid){
    	return userdao.selectimg(roleid);
    }*/
    @Transactional
    public void deleteuser(String username){
    	userdao.delete(username);
    }
    @Transactional
    public void updateuser(int id,String photo){
    	userdao.updateimg(id, photo);
    }
    @Transactional
    public void updateuser(User user){
    	userdao.update(user);
    }
    @Transactional
    public void updatepass(String username,String password){
    	userdao.updatep(username, password);
    }
    @Transactional
    public List selectuserid(String username) {
    	return userdao.selectid(username);
    }
    @Transactional
    public void updatenick(String username,String nickname,String signature) {
    	userdao.uodatenickname(username, nickname,signature);
    }
    
}
