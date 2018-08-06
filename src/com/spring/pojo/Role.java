package com.spring.pojo;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Role {
	private int roleid;
	private String rolename;
	
	@Id
	public int getRoleid() {
		return roleid;
	}
	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	
	
}
