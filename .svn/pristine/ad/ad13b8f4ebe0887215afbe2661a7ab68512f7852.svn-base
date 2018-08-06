package com.spring.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.pojo.Customer;
import com.spring.service.CustomerService;
import com.spring.service.GoodpriceService;

@Controller
public class CustomerController {
	private CustomerService cs;

	@Resource(name = "customerservice")
	public void setCs(CustomerService cs) {
		this.cs = cs;
	}
	private GoodpriceService gps;

	@Resource(name = "goodpriceservice")
	public void setGps(GoodpriceService gps) {
		this.gps = gps;
	}

	@RequestMapping(value = "customeradd.do", method = RequestMethod.POST)
	public void customeradd(HttpServletRequest re, HttpServletResponse rs) {
		String result = "400";
		rs.setCharacterEncoding("UTF-8");
		String customername = re.getParameter("customername");
		int customerid = Integer.parseInt(re.getParameter("customerid"));
		Customer customer = new Customer();
		customer.setCustomername(customername);
		customer.setCustomerid(customerid);
		System.out.println(customername + "+++++++++" + customerid);
		List<Integer> clist = cs.customersel(customername);
		List<String> list = cs.customersel(customerid);
		if (list.isEmpty()) {
			if (clist.isEmpty()) {
				cs.customeradd(customer);
				result = "200";
			} else {
				result = "300";
			}
		} else {
			result = "400";
		}
		try {
			rs.getWriter().print(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "customerlist.do", method = RequestMethod.GET)
	public String customerlist(HttpServletRequest re, HttpServletResponse rs,
			Model model) {
		List<Object[]> clist = cs.customersel();
		model.addAttribute("clist", clist);
		return "jsp/customer/customerupdate";
	}
	
	@RequestMapping(value = "waybilllist.do", method = RequestMethod.GET)
	public String clist(HttpServletRequest re, HttpServletResponse rs,
			Model model) {
		List<Object[]> clist = cs.customersel();
		model.addAttribute("clist", clist);
		return "jsp/waybill/waybill";
	}

	@RequestMapping(value = "/deletecustomer.do", method = RequestMethod.POST)
	public void delete(HttpServletRequest req, HttpServletResponse res) {
		String customername = req.getParameter("customername");
		System.out.println(customername);
		List list=gps.selectprice(customername);
		String result="";
		if(list.isEmpty()){
		cs.customerdel(customername);
		 result = "200";
		}else{
			result="400";
		}
		try {
			res.getWriter().print(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping(value = "/customerupdate.do", method = RequestMethod.POST)
	public void upda(HttpServletRequest req, HttpServletResponse res) {
		String customername = req.getParameter("customername");
		int customerid=Integer.parseInt(req.getParameter("customerid"));
		int id=Integer.parseInt(req.getParameter("id"));
		String result = "";
		List list=cs.customersel(id,"customername", customername);
		List list1=cs.customersel(id,"customerid", customerid);
		
		
		if(list.isEmpty()){
			if(list1.isEmpty()){
				cs.customerupdate(id, customername, customerid);
				result="200";
			}else{
				result="300";
			}
		}else{
			result="400";
		}
		
		try {
			res.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
