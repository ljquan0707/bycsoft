package com.spring.dao;

import java.util.List;

import com.spring.pojo.Customer;

public interface CustomerDao {
	
	public void customeradd(Customer customer);
	
	public List customerselect(String customername);
	public List customersel(int customerid);
	public List customersel(int id,String column,Object obj);
	
	public List customerlist();
	
	public void customerdel(String customername);
	
	public void customerupdate(int id,String customername,int customerid );
}
