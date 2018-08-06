package com.spring.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.MenuListDao;
import com.spring.pojo.Menu;
import com.spring.pojo.MenuList;
@Component("menulistservice")
public class MenuListService {
	@Resource(name="menulistdao")
	private MenuListDao mld;

	public MenuListDao getMld() {
		return mld;
	}

	public void setMld(MenuListDao mld) {
		this.mld = mld;
	}
	
	@Transactional
	public List menulist(int id) {
		return mld.Menuall(id);
	}
	@Transactional
	public void delmenu(int id) {
		mld.DelMenulist(id);
	}
	@Transactional
	public void delpmenu(int pid) {
		mld.DelMenup(pid);
	}
	@Transactional
	public void addmenulist(MenuList menulist) {
		mld.AddMenulist(menulist);
	}
	@Transactional
	public void updatemenulist(MenuList menulist) {
		mld.UpdateMenulist(menulist);
	}
}
