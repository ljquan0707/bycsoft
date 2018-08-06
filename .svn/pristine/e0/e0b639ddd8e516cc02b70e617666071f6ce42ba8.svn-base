package com.spring.daoImpl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.spring.dao.RoleDao;
import com.spring.pojo.Role;
@Component("roledao")
public class RoleDaoImpl implements RoleDao {
	@Resource(name="sessionFactory")
	private SessionFactory sf;
	public SessionFactory getSf() {
		return sf;
	}
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}


	@Override
	public List rolelist() {
		Session session=sf.getCurrentSession();
		String sql="select roleid,rolename from Role";
		List role=session.createQuery(sql).list();
		
		return role;
	}
	@Override
	public void add(Role role) {
		Session session=sf.getCurrentSession();
		session.save(role);
	}
	@Override
	public void update(Role role) {
		Session session=sf.getCurrentSession();
		String sql="update Role set rolename='"+role.getRolename()+"' where roleid="+role.getRoleid()+"";
		session.createQuery(sql).executeUpdate();
		
	}

}
