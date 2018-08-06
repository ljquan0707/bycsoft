package com.spring.pojo;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="menu_list")
public class MenuList {

	private int id;
	private int menu_id;
	private String menu_li;
	private String menu_value;
	@Id
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}
	public String getMenu_li() {
		return menu_li;
	}
	public void setMenu_li(String menu_li) {
		this.menu_li = menu_li;
	}
	public String getMenu_value() {
		return menu_value;
	}
	public void setMenu_value(String menu_value) {
		this.menu_value = menu_value;
	}
	
	
}
