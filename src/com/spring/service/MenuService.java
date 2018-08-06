package com.spring.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.MenuDao;
import com.spring.pojo.Menu;
@Component(value="menuservice")
public class MenuService {
	@Resource(name="menudao")
	private MenuDao menudao;

	public void setMenudao(MenuDao menudao) {
		this.menudao = menudao;
	}
	@Transactional
	public List menulist(int id) {
		return menudao.Menuall(id);
	}
	@Transactional
	public void delmenu(int id) {
		menudao.DelMenu(id);
	}
	@Transactional
	public void savemenu(Menu menu) {
		menudao.AddMenu(menu);
	}
	@Transactional
	public void updatemenu(Menu menu) {
		menudao.UpdateMenu(menu);
	}
}
