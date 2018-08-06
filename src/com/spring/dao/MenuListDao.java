package com.spring.dao;

import java.util.List;

import com.spring.pojo.Menu;
import com.spring.pojo.MenuList;

public interface MenuListDao {

public List Menuall(int id);
	
	public void AddMenulist(MenuList menulist);
	
	
	public void DelMenulist(int id);
	public void DelMenup(int pid);
	
	public void UpdateMenulist(MenuList menulist);

}
