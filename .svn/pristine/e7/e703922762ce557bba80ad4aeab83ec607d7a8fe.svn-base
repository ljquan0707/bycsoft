package com.spring.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.ShipperDao;
@Component("shipperservice")
public class ShipperService {
	
	@Resource(name="shipperDao")
	private ShipperDao sd;
	public void setSd(ShipperDao sd) {
		this.sd = sd;
	}
	@Transactional
	public void saveshipper(String[] arr){
		sd.save(arr);
		
	}
	@Transactional
	public List selectshipper(String[] arr){
		return sd.select(arr);
	}

}
