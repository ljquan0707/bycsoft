package com.spring.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.CustomerDao;
import com.spring.pojo.Customer;
@Component("customerservice")
public class CustomerService {
	private CustomerDao cd;
	@Resource(name="customerdao")
	public void setCd(CustomerDao cd) {
		this.cd = cd;
	}
	@Transactional
	public void customeradd(Customer customer){
		cd.customeradd(customer);
	}
	@Transactional
	public List customersel(String customername){
		return cd.customerselect(customername);
	}
	@Transactional
	public List customersel(int customerid){
		return cd.customersel(customerid);
	}
	@Transactional
	public List customersel(){
		return cd.customerlist();
	}
	@Transactional
	public void customerdel(String customername){
		 cd.customerdel(customername);
	}
	@Transactional
	public void customerupdate(int id, String customername, int customerid){
		cd.customerupdate(id, customername, customerid);
	}
	@Transactional
	public List customersel(int id ,String column,Object obj){
		return cd.customersel(id, column, obj);
	}
}
