package com.spring.daoImpl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.spring.dao.ShipperDao;
@Component("shipperDao")
public class ShipperDaoImpl implements ShipperDao {
	@Resource(name="sessionFactory")
	private SessionFactory sf;
	public SessionFactory getSf() {
		return sf;
	}
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}
	@Override
	public void save(String[] arr) {
		
		Session session=sf.getCurrentSession();
		String sql="INSERT INTO shipper SET shippercgp='"+arr[5]+"' ,shippername='"+arr[7]+"',shipperadress='"+arr[6]+"',shippertel='"+arr[8]+"'";
		session.createSQLQuery(sql).executeUpdate();
		
	}
	@Override
	public List select(String[] arr) {
		Session session =sf.getCurrentSession();
		String sql="select shipperid,shippername,shippertel,shipperadress,shippercgp from shipper where";
		if(arr[8]==""){
			sql=sql+" shippername='"+arr[7]+"'";
		}else if(arr[7]==""){
			sql=sql+" shippertel='"+arr[8]+"'";
		}else{
			sql=sql+" shippertel='"+arr[8]+"' and shippername='"+arr[7]+"'";
		}
		
		List shipper=session.createSQLQuery(sql).list();
		return shipper;
	}

}
