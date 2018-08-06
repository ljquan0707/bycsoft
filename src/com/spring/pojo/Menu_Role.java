package com.spring.pojo;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="menu_role")
public class Menu_Role {

	private int id;
	private int Menu_id;
	private int Roleid;
	@Id
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMenu_id() {
		return Menu_id;
	}
	public void setMenu_id(int menu_id) {
		Menu_id = menu_id;
	}
	public int getRoleid() {
		return Roleid;
	}
	public void setRoleid(int roleid) {
		Roleid = roleid;
	}
	
	
	
}
