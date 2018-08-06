package com.spring.pojo;

import javax.persistence.Entity;
import javax.persistence.Id;
@Entity(name="music")
public class Music {
	
	private int id;
	private String name;
	private String state;
	private String img;
	
	@Id
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	

}
