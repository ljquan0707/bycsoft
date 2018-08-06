package com.spring.daoImpl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.spring.dao.MenuListDao;
import com.spring.pojo.MenuList;
@Component("menulistdao")
public class MenuListDaoImpl implements MenuListDao {
	@Resource(name="sessionFactory")
	private SessionFactory sf;
	public SessionFactory getSf() {
		return sf;
	}
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}
	@Override
	public void AddMenulist(MenuList menulist) {
		Session session=sf.getCurrentSession();
		session.save(menulist);

	}

	@Override
	public void DelMenulist(int id) {
		Session session=sf.getCurrentSession();
		String sql="delete from Menu_List where id='"+id+"'";
		session.createSQLQuery(sql).executeUpdate();
	}

	@Override
	public void UpdateMenulist(MenuList menulist) {
		Session session=sf.getCurrentSession();
		String sql="update Menu_List set menu_li='"+menulist.getMenu_li()+"',menu_value='"+menulist.getMenu_value()+"' where id='"+menulist.getId()+"'";
		session.createSQLQuery(sql).executeUpdate();


	}
	@Override
	public List Menuall(int id) {
		Session session=sf.getCurrentSession();
		String sql="select id,menu_id,menu_li,menu_value from MenuList";
		if(id!=-1) {
			sql=sql+" where menu_id="+id;
		}
		List menu=session.createQuery(sql).list();
		return menu;
	}
	@Override
	public void DelMenup(int pid) {
		Session session=sf.getCurrentSession();
		String sql="delete from Menu_List where menu_id='"+pid+"'";
		session.createSQLQuery(sql).executeUpdate();
		
	}

}
