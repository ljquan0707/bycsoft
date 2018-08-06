package com.spring.daoImpl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.spring.dao.ConsigneeDao;
@Component("consigneedao")
public class ConsigneeDaoImpl implements ConsigneeDao {
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
		String sql="INSERT INTO consignee SET consigneecgp='"+arr[9]+"' ,consigneename='"+arr[11]+"' ,consigneeadress='"+arr[10]+"' ,consigneetel='"+arr[12]+"' ";
		session.createSQLQuery(sql).executeUpdate();
		
	}
	@Override
	public List select(String[] arr) {
		Session session =sf.getCurrentSession();
		String sql="select consigneeid,consigneename,consigneetel,consigneeadress,consigneecgp from consignee where";
		if(arr[12]==""){
			sql=sql+" consigneename='"+arr[11]+"' ";
		}else if(arr[11]==""){
			sql=sql+" consigneetel='"+arr[12]+"' ";
		}else{
			sql=sql+" consigneetel='"+arr[12]+"' and consigneename='"+arr[11]+"'";
		}
		
		List consignee=session.createSQLQuery(sql).list();
		return consignee;
	}

}
