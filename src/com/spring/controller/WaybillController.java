package com.spring.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.service.ConsigneeService;
import com.spring.service.ShipperService;
import com.spring.service.WaybillService;
import com.spring.utill.Utill;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
@Controller
public class WaybillController {
	@Resource(name="waybillservice")
	private WaybillService ws;
	public void setWs(WaybillService ws) {
		this.ws = ws;
	}
	@Resource(name="shipperservice")
	private ShipperService ss;
	public void setSs(ShipperService ss) {
		this.ss = ss;
	}
	@Resource(name="consigneeservice")
	public ConsigneeService cs;
	public void setCs(ConsigneeService cs) {
		this.cs = cs;
	}



	@RequestMapping(value="/waybillsave.do",method=RequestMethod.POST)
	public void savewaybill(HttpServletRequest req,HttpServletResponse res){
		String[] arr=req.getParameterValues("array");
		int array[] = new int[4];
		String result="false";
		
		List<Object[]> shipper=ss.selectshipper(arr);
		if(shipper.isEmpty()){
			ss.saveshipper(arr);
			List<Object[]> shipper1=ss.selectshipper(arr);
			int a=Integer.parseInt(shipper1.get(0)[0].toString());
			array[0]=a;
		}else{
		 int a=Integer.parseInt(shipper.get(0)[0].toString());
		 array[0]=a;
		}
		List<Object[]> consignee=cs.selectconsignee(arr);
		if(consignee.isEmpty()){
			cs.saveconsignee(arr);
			List<Object[]> consignee1=cs.selectconsignee(arr);
			int b=Integer.parseInt(consignee1.get(0)[0].toString());
			array[1]=b;
		}else{
			int b=Integer.parseInt(consignee.get(0)[0].toString());
			array[1]=b;
		}
		System.out.println(array[0]+"/"+array[1]);
		arr[5]=Utill.Datetime();
		 ws.waysave(arr, array);
		  result="true";
		 try {
			res.getWriter().print(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping(value="/getDate.do",method=RequestMethod.GET)
	public void waybilllist(HttpServletRequest req,HttpServletResponse res) {
		int limit=Integer.parseInt(req.getParameter("limit"));
		int offset=Integer.parseInt(req.getParameter("offset"));
		System.err.println(ws.count());
		 System.out.println("ok");
		try {
			res.getWriter().print(ws.waibill(limit,offset));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping(value="/search.do",method=RequestMethod.GET)
	public void waybillsearch(HttpServletRequest req,HttpServletResponse res) {
		String waybillno=req.getParameter("waybillno");
		String tocity=req.getParameter("tocity");
		String js=req.getParameter("js");
		String customername=req.getParameter("customername");
		String datetimeStart=req.getParameter("datetimeStart");
		String datetimeEnd=req.getParameter("datetimeEnd");
		
		 Map<String, String> map=new HashMap<String, String>();
		 map.put("waybillno", waybillno);
		 map.put("tocity", tocity);
		 map.put("js", js);
		 map.put("datetimeStart", datetimeStart);
		 map.put("datetimeEnd", datetimeEnd);
		 map.put("customername", customername);
		 
		try {
			res.getWriter().print(ws.searchwaibill(map));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
