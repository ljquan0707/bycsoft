package com.spring.controller;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.spring.pojo.Goodprice;
import com.spring.service.CustomerService;
import com.spring.service.GoodpriceService;
import com.spring.utill.ExcelUtilForPOI;

@Controller
public class GoodpriceController {
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

	@RequestMapping(value = "loadprice.do", method = RequestMethod.POST)
	public String saveDriver(MultipartFile UploadFile, HttpSession session,HttpServletRequest req)
			throws Exception {

		String filename = UploadFile.getOriginalFilename();
		String username=req.getParameter("username");		
		String leftPath = session.getServletContext().getRealPath("/excel");
		System.out.println("================"+username);
		File file = new File(leftPath, filename);

		if (file.exists()) {
			System.out.println(file+"1");
			UploadFile.transferTo(file);
		} else {
			System.out.println(file+"2");
			file.getParentFile().mkdirs();
			UploadFile.transferTo(file);
		}
		
		ExcelUtilForPOI poiTest = new ExcelUtilForPOI();
		String fileURL = leftPath + "/" + filename;
		List<String[]> list = poiTest.getData(fileURL);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date d = new Date();
		String dd = format.format(d);
		Date date = format.parse(dd);

		Goodprice gp = new Goodprice();
		if (list != null && list.size() != 0) {
			System.out.println(list.get(0)[0]);
			List<Integer> listid = cs.customersel(list.get(0)[0]);
			if (listid.isEmpty()) {
				return "/info/priceerror";
			} else {
				int customerid = listid.get(0).intValue();
				gp.setCustomerid(customerid);
				gp.setCity(list.get(1)[0]);
				gp.setMincharge(list.get(1)[1]);
				gp.setNo1(list.get(1)[2]);
				gp.setNo2(list.get(1)[3]);
				gp.setNo3(list.get(1)[4]);
				gp.setNo4(list.get(1)[5]);
				gp.setNo5(list.get(1)[6]);
				gp.setCreatetime(date);
				gp.setUsername(username);
				List pricelist = gps.selectprice(list.get(0)[0]);
				if (pricelist.isEmpty()) {
					gps.add(gp);
				} else {
					gps.update(gp);
				}

				for (int i = 2; i < list.size(); i++) {
					String[] strObject = list.get(i);
					if (list.get(i)[0].equals("*")) {
						break;
					}
					gp.setCustomerid(customerid);
					gp.setCity(list.get(i)[0]);
					gp.setMincharge(list.get(i)[1]);
					gp.setNo1(list.get(i)[2]);
					gp.setNo2(list.get(i)[3]);
					gp.setNo3(list.get(i)[4]);
					gp.setNo4(list.get(i)[5]);
					gp.setNo5(list.get(i)[6]);
					gp.setCreatetime(date);
					if (pricelist.isEmpty()) {
						gps.add(gp);
					} else {
						gps.update(gp);
					}
					if (list.get(i)[0].equals("*")) {
						break;
					}
				}

			}
		}
		List<String[]> pricelist = gps.selectprice();
		session.setAttribute("pricelist", pricelist);
		return "jsp/upload/priceupload";
	}

	@RequestMapping(value = "pricelist.do", method = RequestMethod.GET)
	public String selectprice(HttpSession session) {
		List<String[]> pricelist = gps.selectprice();
		session.setAttribute("pricelist", pricelist);
		return "jsp/upload/priceupload";
	}

	@RequestMapping(value = "delprice.do", method = RequestMethod.POST)
	public void delprice(HttpServletResponse res, HttpServletRequest req) {
		int customerid = Integer.parseInt(req.getParameter("customerid"));
		String result = "";
		gps.delprice(customerid);
		result = "200";
		try {
			res.getWriter().print(result);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "pricesingle.do", method = RequestMethod.POST)
	public void selectlist(HttpSession session, HttpServletRequest req,
			HttpServletResponse res) {
		String customername = req.getParameter("customername");
		List<Object[]> pricelist = gps.selectprice(customername);
		System.out.println(pricelist.get(0)[2]+"/////");
		
		JSONObject json = new JSONObject();
		JSONArray array = new JSONArray();
		for (int i = 0; i < pricelist.size(); i++) {
			JSONObject json1 = new JSONObject();
			json1.put("city", pricelist.get(i)[0]);
			json1.put("mincharge", pricelist.get(i)[1]);
			json1.put("no1", pricelist.get(i)[2]);
			json1.put("no2", pricelist.get(i)[3]);
			json1.put("no3", pricelist.get(i)[4]);
			json1.put("no4", pricelist.get(i)[5]);
			json1.put("no5", pricelist.get(i)[6]);
			array.add(json1);
			
		}
		json.put("data", array);
		try {
			res.getWriter().print(json);
		} catch (IOException e) {

			e.printStackTrace();
		}
	}

	@RequestMapping(value = "findprice.do", method = RequestMethod.POST)
	public void findprice(HttpSession session, HttpServletRequest req,
			HttpServletResponse res) {
		int customerid = Integer.parseInt(req.getParameter("khdm"));
		String city = req.getParameter("city");
		int jfzl = Integer.parseInt(req.getParameter("sjzl"));

		int[] a = new int[6];
		String[] b = new String[6];
		double count = 0; // 计算出的运费
		double mincount = 0.00; // 最低收费
		JSONObject json = new JSONObject();
		JSONArray array = new JSONArray();
		List<Object[]> price = gps.findprice(customerid, "航线");
		List<Object[]> prices = gps.findprice(customerid, city);
		if (price.isEmpty() || prices.isEmpty()) {
			json.put("msg", "无数据");
			array.add(json);
		} else {
			b[0] = prices.get(0)[0].toString();
			for (int i = 1; i < price.get(0).length; i++) {
				a[i] = Integer.parseInt(price.get(0)[i].toString().replaceAll(
						"[^(0-9)]", ""));
				b[i] = prices.get(0)[i].toString();
				System.out.print(b[i] + "/");
			}
			mincount = Double.valueOf(b[0]);

			if (jfzl < a[2]) {
				json.put("fl", Double.valueOf(b[1]));
				count = Double.valueOf(b[1]) * jfzl;
			} else if (jfzl < a[3]) {
				if (b[2].equals("——")) {
					json.put("fl", Double.valueOf(b[1]));
					count = Double.valueOf(b[1]) * jfzl;
				} else {
					json.put("fl", Double.valueOf(b[2]));
					count = Double.valueOf(b[2]) * jfzl;
				}
			} else if (jfzl < a[4]) {
				if (b[3].equals("——")) {
					if (b[2].equals("——")) {
						json.put("fl", Double.valueOf(b[1]));
						count = Double.valueOf(b[1]) * jfzl;
					} else {
						json.put("fl", Double.valueOf(b[2]));
						count = Double.valueOf(b[2]) * jfzl;
					}
				} else {
					json.put("fl", Double.valueOf(b[3]));
					count = Double.valueOf(b[3]) * jfzl;
				}
			} else if (jfzl < a[5]) {
				if (b[4].equals("——")) {
					if (b[3].equals("——")) {
						if (b[2].equals("——")) {
							json.put("fl", Double.valueOf(b[1]));
							count = Double.valueOf(b[1]) * jfzl;
						} else {
							json.put("fl", Double.valueOf(b[2]));
							count = Double.valueOf(b[2]) * jfzl;
						}
					} else {
						json.put("fl", Double.valueOf(b[3]));
						count = Double.valueOf(b[3]) * jfzl;
					}
				} else {
					json.put("fl", Double.valueOf(b[4]));
					count = Double.valueOf(b[4]) * jfzl;
				}
			} else if (jfzl >= a[5]) {
				if (b[5].equals("——")) {
					if (b[4].equals("——")) {
						if (b[3].equals("——")) {
							if (b[2].equals("——")) {
								json.put("fl", Double.valueOf(b[1]));
								count = Double.valueOf(b[1]) * jfzl;
							} else {
								json.put("fl", Double.valueOf(b[2]));
								count = Double.valueOf(b[2]) * jfzl;
							}
						} else {
							json.put("fl", Double.valueOf(b[3]));
							count = Double.valueOf(b[3]) * jfzl;
						}
					} else {
						json.put("fl", Double.valueOf(b[4]));
						count = Double.valueOf(b[4]) * jfzl;
					}
				} else {
					json.put("fl", Double.valueOf(b[5]));
					count = Double.valueOf(b[5]) * jfzl;
				}
			}
			DecimalFormat df = new DecimalFormat("######0.00");
			if (count > mincount) {
				json.put("yf", df.format(count));
			} else {
				json.put("yf", df.format(mincount));
			}
			array.add(json);
		}
		try {
			res.getWriter().print(array);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
