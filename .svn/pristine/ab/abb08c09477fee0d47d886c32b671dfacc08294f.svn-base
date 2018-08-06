package com.spring.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.RoleDao;
import com.spring.pojo.Role;
@Component("roleservice")
public class RoleService {
	@Resource(name="roledao")
	private RoleDao roledao;
	
	public void setRoledao(RoleDao roledao) {
		this.roledao = roledao;
	}
	@Transactional
	public List rolelist() {
		return roledao.rolelist();
	}
	@Transactional
	public void addrole(Role role) {
		roledao.add(role);
	}
	@Transactional
	public void update(Role role) {
		roledao.update(role);
	}
}
