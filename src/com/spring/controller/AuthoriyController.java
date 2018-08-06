package com.spring.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.pojo.Menu_Role;
import com.spring.pojo.Role;
import com.spring.service.MenuService;
import com.spring.service.Menu_RoleService;
import com.spring.service.RoleService;
import com.spring.utill.StaticValue;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
@Controller
public class AuthoriyController {
	@Resource(name="roleservice")
	private RoleService rs;
	public void setRs(RoleService rs) {
		this.rs = rs;
	}
	@Resource(name="menuservice")
	private MenuService ms;
	public void setMs(MenuService ms) {
		this.ms = ms;
	}
	@Resource(name="menuroleservice")
	public Menu_RoleService mrs;
	public void setMrs(Menu_RoleService mrs) {
		this.mrs = mrs;
	}
	@RequestMapping(value="/roleauthor.do" ,method=RequestMethod.GET)
public void RoleAuthor(HttpServletRequest req,HttpServletResponse res) {
		String result=StaticValue.value_init;
		JSONObject rjson = new JSONObject();
		JSONArray rarray = new JSONArray();
			List<Object[]> role=rs.rolelist();
				for(int i=0;i<role.size();i++) {
					rjson.put("roleid", role.get(i)[0]);
					rjson.put("rolename", role.get(i)[1]);
					List<Object[]> menu=ms.menulist((int) role.get(i)[0]);
					JSONArray marray = new JSONArray();	
					for(int j=0;j<menu.size();j++) {
						JSONObject mjson = new JSONObject();
						rjson.put("count", menu.size());
						mjson.put("menuid", menu.get(j)[0]);
						mjson.put("menutitle", menu.get(j)[1]);
						marray.add(mjson);
						}
					
					rjson.put("child", marray);
					rarray.add(rjson);
				}
				
				System.out.println(rarray);
			
	try {
		res.getWriter().println(rarray);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
	@RequestMapping(value="/menulist.do" ,method=RequestMethod.GET)
	public void menulist(HttpServletRequest req,HttpServletResponse res) {
			JSONObject json = new JSONObject();
			JSONArray array = new JSONArray();
						List<Object[]> menu=ms.menulist(-1);
						for(int j=0;j<menu.size();j++) {
							json.put("menuid", menu.get(j)[0]);
							json.put("menutitle", menu.get(j)[1]);
							array.add(json);
							}
						System.out.println(array);
		try {
			res.getWriter().println(array);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping(value="/rolename.do" ,method=RequestMethod.GET)
	public void rolelist(HttpServletRequest req,HttpServletResponse res) {
		System.out.println("角色列表");
			JSONObject json = new JSONObject();
			JSONArray array = new JSONArray();
						List<Object[]> menu=rs.rolelist();
						for(int j=0;j<menu.size();j++) {
							json.put("roleid", menu.get(j)[0]);
							json.put("roletitle", menu.get(j)[1]);
							array.add(json);
							}
						System.out.println(array);
		try {
			res.getWriter().println(array);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping(value="/addrolemenu.do" ,method=RequestMethod.GET)
	public void rolemenu(HttpServletRequest req,HttpServletResponse res) {
		int roleid=Integer.parseInt(req.getParameter("roleid"));
		int menuid=Integer.parseInt(req.getParameter("menuid"));
		System.err.println(roleid+"-"+menuid);
		String result=StaticValue.value_init;
		Menu_Role mr=new Menu_Role();
		mr.setRoleid(roleid);
		mr.setMenu_id(menuid);
		int index=mrs.select(roleid, menuid);
		if(index==-1) {
			result=StaticValue.value_right;
			mrs.savemenurole(mr);
		}else {
			
			result=StaticValue.value_error;
		}
		
		try {
			res.getWriter().println(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping(value="/deleterolemenu.do" ,method=RequestMethod.GET)
	public void delrolemenu(HttpServletRequest req,HttpServletResponse res) {
		int roleid=Integer.parseInt(req.getParameter("roleid"));
		int menuid=Integer.parseInt(req.getParameter("menuid"));
		System.err.println(roleid+"-"+menuid);
		String result=StaticValue.value_init;
		mrs.deletemenurole(roleid, menuid);
		
			result=StaticValue.value_right;
			
		
		try {
			res.getWriter().println(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping(value="/rolesave.do" ,method=RequestMethod.GET)
	public void rolesave(HttpServletRequest req,HttpServletResponse res) {
		int roleid=Integer.parseInt(req.getParameter("roleid"));
		String rolename=req.getParameter("rolename");
		System.err.println(roleid+"-"+rolename);
		String result=StaticValue.value_init;
		Role role=new Role();
		role.setRolename(rolename);
			rs.addrole(role);
			result=StaticValue.value_right;
		try {
			res.getWriter().println(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping(value="/roleupdate.do" ,method=RequestMethod.GET)
	public void roleupdate(HttpServletRequest req,HttpServletResponse res) {
		int roleid=Integer.parseInt(req.getParameter("roleid"));
		String rolename=req.getParameter("rolename");
		System.err.println(roleid+"-"+rolename);
		String result=StaticValue.value_init;
		Role role=new Role();
		role.setRolename(rolename);
		role.setRoleid(roleid);
			rs.update(role);
			result=StaticValue.value_right;
		try {
			res.getWriter().println(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
