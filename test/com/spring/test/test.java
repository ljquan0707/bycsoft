package com.spring.test;



import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.spring.service.MenuService;
import com.spring.service.RoleService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;



public class test {
	@Test
	public void test() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		RoleService rs = (RoleService)ctx.getBean("roleservice");
		MenuService ms=(MenuService)ctx.getBean("menuservice");
		JSONObject rjson = new JSONObject();
		JSONArray rarray = new JSONArray();
			List<Object[]> role=rs.rolelist();
				for(int i=0;i<role.size();i++) {
					rjson.put("rileid", role.get(i)[0]);
					rjson.put("rolename", role.get(i)[1]);
					List<Object[]> menu=ms.menulist((int) role.get(i)[0]);
					JSONArray marray = new JSONArray();	
					for(int j=0;j<menu.size();j++) {
						JSONObject mjson = new JSONObject();
						rjson.put("count", mjson.size());
						mjson.put("menuid", menu.get(j)[0]);
						mjson.put("menutitle", menu.get(j)[1]);
						marray.add(mjson);
						}
					
					rjson.put("child", marray);
					rarray.add(rjson);
				}
				
				System.out.println(rarray);
			
	}
	@Test
public void test2() {
		
		try {
			InetAddress address = InetAddress.getLocalHost();
				 System.out.println(address.getHostAddress());
				
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
}	
}

