package com.spring.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.MusicDao;
import com.spring.pojo.Music;
@Component("musicservice")
public class MusicService {
	@Resource(name="musicdao")
	private MusicDao md;

	public void setMd(MusicDao md) {
		this.md = md;
	}
	
@Transactional
public void add(Music music) {
	
	md.add(music);
}
@Transactional
public List selectlit() {
	return md.select();
}
}
