package com.spring.daoImpl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.spring.dao.CustomerDao;
import com.spring.pojo.Customer;
@Component("customerdao")
public class CustomerDaoImpl implements CustomerDao {
	@Resource(name="sessionFactory")
	private SessionFactory sf;
	public SessionFactory getSf() {
		return sf;
	}
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}
	
	@Override
	public void customeradd(Customer customer) {
		Session session=sf.getCurrentSession();
		session.save(customer);

	}
	@Override
	public List customerselect(String customername) {
		Session session=sf.getCurrentSession();
		String sql="select customerid from customer where customername='"+customername+"'";
		List list= session.createSQLQuery(sql).list();
		return list;
	}
	@Override
	public List customerlist() {
		Session session=sf.getCurrentSession();
		String sql="select customerid,customername,id from customer ";
		List list= session.createSQLQuery(sql).list();
		return list;
	}
	@Override
	public void customerdel(String customername) {
		Session session=sf.getCurrentSession();
		String sql="delete from customer where customername='"+customername+"'";
		session.createSQLQuery(sql).executeUpdate();
		
	}
	@Override
	public List customersel(int customerid) {
		Session session=sf.getCurrentSession();
		String sql="select customername from customer where customerid='"+customerid+"'";
		List list= session.createSQLQuery(sql).list();
		return list;
	}
	@Override
	public void customerupdate(int id, String customername, int customerid) {
		Session session=sf.getCurrentSession();
		String sql="update customer set customername='"+customername+"',customerid='"+customerid+"'where id='"+id+"'";
		session.createSQLQuery(sql).executeUpdate();
		
	}
	@Override
	public List customersel(int id,String column, Object obj) {
		Session session=sf.getCurrentSession();
		String sql="select customername,customerid from customer where "+column+"='"+obj+"' AND id!='"+id+"'";
		List list= session.createSQLQuery(sql).list();
		return list;
	}

}
