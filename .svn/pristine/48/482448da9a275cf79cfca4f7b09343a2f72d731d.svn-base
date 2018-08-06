package com.spring.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.GoodpriceDao;
import com.spring.pojo.Goodprice;

@Component("goodpriceservice")
public class GoodpriceService {
	
	private GoodpriceDao gpd;
	
	@Resource(name="goodpricedao")
	public void setGpd(GoodpriceDao gpd) {
		this.gpd = gpd;
	}

	@Transactional
	public void add(Goodprice gp){
		gpd.addprice(gp);
	}
	@Transactional
	public List selectprice(){
		return gpd.selectprice();
	}
	@Transactional
	public List selectprice(String customername){
		return gpd.selectprice(customername);
	}
	@Transactional
	public void delprice(int customerid){
		gpd.delprice(customerid);
	}
	@Transactional
	public void update(Goodprice gp){
		gpd.updateptice(gp);
	}
	@Transactional
	public List findprice(int customerid,String city){
		return gpd.selectprice(customerid, city);
	}

}
