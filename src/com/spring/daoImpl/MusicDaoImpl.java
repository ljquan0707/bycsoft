package com.spring.daoImpl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.spring.dao.MusicDao;
import com.spring.pojo.Music;
@Component("musicdao")
public class MusicDaoImpl implements MusicDao {
	@Resource(name="sessionFactory")
	private SessionFactory sf;
	public SessionFactory getSf() {
		return sf;
	}
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}
	

	@Override
	public void add(Music music) {
		Session session=sf.getCurrentSession();
		session.save(music);

	}

	@Override
	public List select() {
		Session session=sf.getCurrentSession();
		String sql="select (@i\\:=@i+1),name from music,(SELECT@i\\:=0)t2 ";
		List musiclist=session.createSQLQuery(sql).list();
		return musiclist;
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub

	}

}
