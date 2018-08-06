package com.spring.daoImpl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.spring.dao.LoginDao;
import com.spring.pojo.Login;
@Component("logindao")
public class LoginDaoImpl implements LoginDao {
	@Resource(name="sessionFactory")
	private SessionFactory sf;
	public SessionFactory getSf() {
		return sf;
	}
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}

	@Override
	public void addlogin(Login login) {
		Session session=sf.getCurrentSession();
		session.save(login);
	}

	@Override
	public List Loginselect(String username) {
		Session session=sf.getCurrentSession();
		String sql="select DATE_FORMAT(MAX(TIME),'%Y-%m-%d %T' ) from Login where username='"+username+"'";
		Query query=session.createSQLQuery(sql);
		List loginlist=query.list();
		return loginlist;
	}

}
