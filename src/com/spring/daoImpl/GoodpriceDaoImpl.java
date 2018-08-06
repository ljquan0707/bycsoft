package com.spring.daoImpl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.spring.dao.GoodpriceDao;
import com.spring.pojo.Goodprice;
@Component("goodpricedao")
public class GoodpriceDaoImpl implements GoodpriceDao {
	@Resource(name="sessionFactory")
	private SessionFactory sf;
	public SessionFactory getSf() {
		return sf;
	}
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}
	@Override
	public void addprice(Goodprice gp) {
		Session session=sf.getCurrentSession();
		session.save(gp);
	}
	@Override
	public void delprice(int customerid) {
		Session session=sf.getCurrentSession();
		String sql="delete from goodprice where customerid='"+customerid+"'";
	    session.createSQLQuery(sql).executeUpdate();
	}
	@Override
	public List selectprice() {
		Session session=sf.getCurrentSession();
		String sql="SELECT c.customername,DATE_FORMAT(createtime,'%Y-%m-%d %T' ),g.customerid FROM customer c,goodprice g WHERE g.city = '航线' AND g.customerid = c.customerid ";
	List list=session.createSQLQuery(sql).list();
		return list;
	}
	@Override
	public void updateptice(Goodprice gp) {
		Session session=sf.getCurrentSession();
		
		String sql="update goodprice set mincharge='"+gp.getMincharge()+"'"
		                            +",no1='"+gp.getNo1()+"'"
									+",no2='"+gp.getNo2()+"'"
									+",no3='"+gp.getNo3()+"'"
									+",no4='"+gp.getNo4()+"'"
									+",no5='"+gp.getNo5()+"'"
									+",createtime=now()"
									+"where city='"+gp.getCity()+"'"
									+"and customerid='"+gp.getCustomerid()+"'";
	                                 session.createSQLQuery(sql).executeUpdate();
	}
	@Override
	public List selectprice(String customername) {
		Session session=sf.getCurrentSession();
		String sql="SELECT g.city,g.mincharge,g.no1,g.no2,g.no3,g.no4,g.no5 FROM goodprice g,customer c WHERE g.customerid=c.customerid AND c.customername='"+customername+"'";
	    List list=session.createSQLQuery(sql).list();
		return list;
	}
	@Override
	public List selectprice(int customerid,String city) {
		Session session=sf.getCurrentSession();
		String sql="SELECT mincharge,no1,no2,no3,no4,no5 FROM goodprice  WHERE customerid='"+customerid+"' AND city='"+city+"'";
		List list=session.createSQLQuery(sql).list();
		return list;
	}

}
