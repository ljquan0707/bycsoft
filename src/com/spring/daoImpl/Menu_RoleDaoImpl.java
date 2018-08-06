package com.spring.daoImpl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.spring.dao.Menu_RoleDao;
import com.spring.pojo.Menu_Role;
@Component("menuroledao")
public class Menu_RoleDaoImpl implements Menu_RoleDao {
	@Resource(name="sessionFactory")
	private SessionFactory sf;
	public SessionFactory getSf() {
		return sf;
	}
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}
	
	@Override
	public void addAuthorization(Menu_Role menurole) {
		Session session=sf.getCurrentSession();
		session.save(menurole);
	}

	@Override
	public void delAuthorization(int roleid, int menu_id) {
		Session session=sf.getCurrentSession();
		String sql="delete from Menu_Role where menu_id="+menu_id+"";
		if(roleid==-1) {
		}else {
			sql=sql+" and roleid="+roleid+"";
		}
		session.createSQLQuery(sql).executeUpdate();
	}
	@Override
	public int selectmenu(int roleid, int menu_id) {
		Session session=sf.getCurrentSession();
		String sql="select id from Menu_Role where menu_id="+menu_id+" and roleid="+roleid+"";
		List list=session.createSQLQuery(sql).list();
		int index=0;
		if(list.isEmpty()) {
			index=-1;
		}
		
		return index;
		
	}

}
