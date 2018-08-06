package com.spring.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.Menu_RoleDao;
import com.spring.pojo.Menu_Role;
@Component("menuroleservice")
public class Menu_RoleService {
	@Resource(name="menuroledao")
	private Menu_RoleDao mrd;

	public void setMrd(Menu_RoleDao mrd) {
		this.mrd = mrd;
	}
	@Transactional
public void deletemenurole(int roleid,int menu_id) {
	mrd.delAuthorization(roleid, menu_id);
}
	@Transactional
	public void savemenurole(Menu_Role menurole) {
		mrd.addAuthorization(menurole);
	}
	@Transactional
	public int select(int roleid,int menu_id) {
		return mrd.selectmenu(roleid, menu_id);
	}
}
