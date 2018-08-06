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

import com.spring.service.ConsigneeService;

@Controller
public class ConsigneeController {
	@Resource(name = "consigneeservice")
	public ConsigneeService cs;

	public void setCs(ConsigneeService cs) {
		this.cs = cs;
	}

	@RequestMapping(value = "/searchc.do", method = RequestMethod.POST)
	public void searchs(HttpServletRequest req, HttpServletResponse res) {
		String cname = req.getParameter("cname");
		String ctel = req.getParameter("ctel");
		String[] obj = new String[13];
		obj[11] = cname;
		obj[12] = ctel;
		List<Object[]> consignee = cs.selectconsignee(obj);
		JSONObject json = new JSONObject();
		JSONArray array = new JSONArray();
		for (int i = 0; i < consignee.size(); i++) {
			json.put("id", consignee.get(i)[0]);
			json.put("consigneename", consignee.get(i)[1]);
			json.put("consigneetel", consignee.get(i)[2]);
			json.put("consigneeadress", consignee.get(i)[3]);
			json.put("consigneecgp", consignee.get(i)[4]);

			array.add(json);
		}
		try {
			res.getWriter().print(array);
		} catch (IOException e) {

			e.printStackTrace();
		}
	}
}
