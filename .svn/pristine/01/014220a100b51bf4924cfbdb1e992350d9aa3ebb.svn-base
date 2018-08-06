package com.spring.daoImpl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.spring.dao.UserDao;
import com.spring.pojo.User;

@Component("userdao")
public class UserDaoImpl implements UserDao {
	
	@Resource(name="sessionFactory")
	private SessionFactory sf;
	public SessionFactory getSf() {
		return sf;
	}
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}

	@Override
	public void add(User user) {
		Session session=sf.getCurrentSession();
		 session.save(user);

	}

	@Override
	public void delete(String username) {
		Session session=sf.getCurrentSession();
		String sql="delete from users where username='"+username+"'";
		session.createSQLQuery(sql).executeUpdate();
		

	}

	@Override
	public void update(User user) {
		Session session=sf.getCurrentSession();
		String sql="update users set username='"+user.getUsername()+"',password='"+user.getPassword()+"',realname='"+user.getRealname()+
				"',sex='"+user.getSex()+"',tel='"+user.getTel()+"',roleid='"+user.getRoleId()+"'"+
				" where id='"+user.getId()+"'";
		session.createSQLQuery(sql).executeUpdate();
		

	}

	@Override
	public List Userlist() {
		Session session=sf.getCurrentSession();
		String sql="select username,realname,sex,tel,role.rolename ,DATE_FORMAT(createtime,'%Y-%m-%d %T' ) FROM users,role where users.roleid=role.roleid";
		List loginlist=session.createSQLQuery(sql).list();
		return loginlist;
	}
	@Override
	public List selectuser(String username,String password) {
		Session session=sf.getCurrentSession();
		String sql="select username,password,realname,sex,tel,DATE_FORMAT(createtime,'%Y-%m-%d %T' ),id,role.rolename,role.roleid,nickname,signature from users,role";
		if(!(username=="")){
			sql=sql+" where username='"+username+"'";
		}
		if(!(password=="")){
			sql=sql+" and password='"+password+"'";
		}
		sql=sql+" and users.roleid=role.roleid";
		List list= session.createSQLQuery(sql).list();
		return list;
	}
	@Override
	public List userlist(String colum, String obj) {
		Session session=sf.getCurrentSession();
		String sql="select username,password,realname,sex,tel,role.rolename ,DATE_FORMAT(createtime,'%Y-%m-%d %T' ),id FROM users,role where users.roleid=role.roleid and "+
		""+colum+"='"+obj+"'";
		List loginlist=session.createSQLQuery(sql).list();
		return loginlist;
	}
	@Override
	public List suser(String username, String tel) {
		Session session=sf.getCurrentSession();
		String sql="select username,password,realname,sex from users where username='"+username+"' and tel='"+tel+"'";
		
		List list= session.createSQLQuery(sql).list();
		return list;
	}
	@Override
	public void updatep(String username, String password) {
		Session session=sf.getCurrentSession();
		String sql="update users set password='"+password+"' where username='"+username+"'";
		session.createSQLQuery(sql).executeUpdate();
		
	}
	@Override
	public void updateimg(int id, String photo) {
		Session session=sf.getCurrentSession();
		String sql="update users set photo='"+photo+"' where id='"+id+"'";
		session.createSQLQuery(sql).executeUpdate();
		
	}
	
	@Override
	public List selectid(String username) {
		Session session=sf.getCurrentSession();
		if(!username.equals("")) {
		String user[]=username.split("/");
		String sql="select id,username,nickname,signature from users where username in (";
		for(int i=0;i<user.length;i++) {
			if(i==user.length-1) {
				sql += "'"+user[i]+"'";
			}else {
				sql += "'"+user[i]+"',";
		}}
		sql=sql+")";
		
		List listid= session.createSQLQuery(sql).list();
		
		return listid;}else {
			return null;
		}
	}
	@Override
	public void uodatenickname(String username, String nickname,String signature) {
		Session session=sf.getCurrentSession();
		String sql="update users set";
		System.out.println(nickname);
		if(nickname==null) {
		sql=sql+" signature='"+signature+"'where username='"+username+"'";
		}else {
		 sql= sql+" nickname='"+nickname+"' where username='"+username+"'";
		}
		session.createSQLQuery(sql).executeUpdate();
		
	}

}
