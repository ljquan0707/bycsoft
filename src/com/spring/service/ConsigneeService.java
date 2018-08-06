package com.spring.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.ConsigneeDao;
@Component("consigneeservice")
public class ConsigneeService {
	@Resource(name="consigneedao")
	private ConsigneeDao cd;
	public void setSd(ConsigneeDao cd) {
		this.cd = cd;
	}
	@Transactional
	public void saveconsignee(String[] arr){
		cd.save(arr);
		
	}
	@Transactional
	public List selectconsignee(String[] arr){
		return cd.select(arr);
	}


}
