package com.spring.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.LoginDao;
import com.spring.pojo.Login;
@Component("loginservice")
public class LoginService {
	private LoginDao logindao;
	@Resource(name="logindao")
	public void setLogindao(LoginDao logindao) {
		this.logindao = logindao;
	}
	@Transactional
	public void addlogin(Login login){
		logindao.addlogin(login);
	}
	@Transactional
	public List selectlogin(String username){
		return logindao.Loginselect(username);
	}
}
