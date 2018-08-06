package com.spring.dao;

import java.util.List;

public interface ConsigneeDao {

	//添加收货人
		public void save(String[] arr);
		
		//查找
		public List select(String[] arr);
	
}
