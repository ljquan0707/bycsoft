package com.spring.dao;

import java.util.List;

import com.spring.pojo.Goodprice;

public interface GoodpriceDao {
	//添加价格信息
	public void addprice(Goodprice gp);
	//删除价格
	public void delprice(int customerid);
	//查看价格信息
	public List selectprice(int customerid,String city);
	public List selectprice();
	public List selectprice(String customername);
	//更新价格表
	public void updateptice(Goodprice gp);
	
}
