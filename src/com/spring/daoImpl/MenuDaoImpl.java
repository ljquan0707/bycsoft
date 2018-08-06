package com.spring.daoImpl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.spring.dao.MenuDao;
import com.spring.pojo.Menu;
@Component("menudao")
public class MenuDaoImpl implements MenuDao {
	
	@Resource(name="sessionFactory")
	private SessionFactory sf;
	public SessionFactory getSf() {
		return sf;
	}
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}
	@Override
	public List Menuall(int id) {
		Session session=sf.getCurrentSession();
		String sql="select menu_id,menu_title from Menu";
		if(id!=-1) {
			sql="SELECT m.menu_id,m.menu_title FROM Menu m,Menu_Role ml WHERE m.menu_id=ml.menu_id AND ml.roleid="+id;
		}
		List menu=session.createQuery(sql).list();
		return menu;
	}

	@Override
	public void AddMenu(Menu menu) {
		Session session=sf.getCurrentSession();
		session.save(menu);
	}

	@Override
	public void DelMenu(int id) {
		Session session=sf.getCurrentSession();
		String sql="delete from Menu where menu_id='"+id+"'";
		session.createSQLQuery(sql).executeUpdate();

	}

	@Override
	public void UpdateMenu(Menu menu) {
		Session session=sf.getCurrentSession();
		String sql="update Menu set menu_title='"+menu.getMenu_title()+"'where menu_id='"+menu.getMenu_id()+"'";
		session.createSQLQuery(sql).executeUpdate();

	}

}
