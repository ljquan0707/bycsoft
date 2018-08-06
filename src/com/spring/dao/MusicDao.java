package com.spring.dao;

import java.util.List;

import com.spring.pojo.Music;

public interface MusicDao {

	
	public void add(Music music);
	
	public List select();
	
	public void delete(int id);
}
