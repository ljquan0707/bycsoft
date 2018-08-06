package com.spring.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.service.ShipperService;

@Controller
public class ShipperController {
	@Resource(name="shipperservice")
	private ShipperService ss;
	public void setSs(ShipperService ss) {
		this.ss = ss;
	}
	@RequestMapping(value="/searchs.do",method=RequestMethod.POST)
public void searchs(HttpServletRequest req,HttpServletResponse res){
		String sname=req.getParameter("sname");
		String stel=req.getParameter("stel");
		String[] obj =new String[9];
		obj[7]=sname;obj[8]=stel;
		List<Object[]> shipper=ss.selectshipper(obj);
		JSONObject json=new JSONObject();
		JSONArray array = new JSONArray();
		for(int i=0;i<shipper.size();i++){
				json.put("id",shipper.get(i)[0]);
				json.put("shippername",shipper.get(i)[1]);
				json.put("shippertel",shipper.get(i)[2]);
				json.put("shipperadress",shipper.get(i)[3]);
				json.put("shippercgp",shipper.get(i)[4]);
				
				array.add(json);
		}
		try {
			res.getWriter().print(array);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
}
