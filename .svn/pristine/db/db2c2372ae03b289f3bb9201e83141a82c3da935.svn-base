package com.spring.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.pojo.Menu;
import com.spring.pojo.MenuList;
import com.spring.service.MenuListService;
import com.spring.service.MenuService;
import com.spring.service.Menu_RoleService;
import com.spring.utill.StaticValue;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class MenuController {
	@Resource(name = "menuservice")
	private MenuService ms;

	public void setMs(MenuService ms) {
		this.ms = ms;
	}

	@Resource(name = "menulistservice")
	private MenuListService mls;

	public void setMls(MenuListService mls) {
		this.mls = mls;
	}

	@Resource(name = "menuroleservice")
	private Menu_RoleService mrs;

	public void setMrs(Menu_RoleService mrs) {
		this.mrs = mrs;
	}

	@RequestMapping(value = "/init.do", method = RequestMethod.POST)
	public void menu_init(HttpServletRequest res, HttpServletResponse rep) {
		int id = Integer.parseInt(res.getParameter("roleid"));
		String result = StaticValue.value_init;
		List menu = ms.menulist(id);
		JSONObject pjson = new JSONObject();

		JSONArray parray = new JSONArray();
		

		List<Object[]> me = ms.menulist(id);
		for (int j = 0; j < me.size(); j++) {
			pjson.put("id", me.get(j)[0]);
			pjson.put("title", me.get(j)[1]);

			List<Object[]> ml = mls.menulist((int) me.get(j)[0]);
			if (ml.isEmpty()) {
				pjson.put("child", "no");
				pjson.put("count", 0);
			} else {
				JSONArray carray = new JSONArray();
				for (int i = 0; i < ml.size(); i++) {

					JSONObject cjson = new JSONObject();
					cjson.put("id", ml.get(i)[0]);
					cjson.put("pid", ml.get(i)[1]);
					cjson.put("title", ml.get(i)[2]);
					cjson.put("action", ml.get(i)[3]);
					pjson.put("count", ml.size());
					carray.add(cjson);

				}
				pjson.put("child", carray);
			}
			parray.add(pjson);
		}
		result = StaticValue.value_right;
		System.out.println(parray);
		try {
			rep.getWriter().print(parray);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/rootinit.do", method = RequestMethod.POST)
	public void menu_allinit(HttpServletRequest res, HttpServletResponse rep) {
		int id = -1;
		List menu = ms.menulist(id);
		JSONObject pjson;

		JSONArray array = new JSONArray();

		List<Object[]> me = ms.menulist(id);
		for (int j = 0; j < me.size(); j++) {
			pjson = new JSONObject();
			pjson.put("id", me.get(j)[0]);
			pjson.put("title", me.get(j)[1]);
			pjson.put("pid", 0);
			array.add(pjson);
		}

		List<Object[]> ml = mls.menulist(id);

		for (int i = 0; i < ml.size(); i++) {
			pjson = new JSONObject();

			pjson.put("id", ml.get(i)[0]);
			pjson.put("pid", ml.get(i)[1]);
			pjson.put("title", ml.get(i)[2]);
			pjson.put("action", ml.get(i)[3]);
			array.add(pjson);

		}
		pjson = new JSONObject();
		pjson.put("id", 0);
		pjson.put("title", "根目录");
		pjson.put("pid", -1);
		array.add(pjson);

		System.out.println(array);
		try {
			rep.getWriter().print(array);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/menuadd.do", method = RequestMethod.POST)
	public void menuadd(HttpServletRequest res, HttpServletResponse rep) {
		int pid = Integer.parseInt(res.getParameter("pid"));
		String pname = res.getParameter("pname");
		int cid = Integer.parseInt(res.getParameter("cid"));
		String cname = res.getParameter("cname");
		String action = res.getParameter("action");
		String result = StaticValue.value_init;

		if (pname.equals("根目录")) {
			Menu menu = new Menu();
			menu.setMenu_title(cname);
			menu.setMenu_level(0);
			ms.savemenu(menu);
		} else {
			MenuList ml = new MenuList();
			ml.setMenu_id(pid);
			ml.setMenu_li(cname);
			ml.setMenu_value(action);
			mls.addmenulist(ml);
		}
		result = StaticValue.value_right;
		try {
			rep.getWriter().println(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/menuedit.do", method = RequestMethod.POST)
	public void menuedit(HttpServletRequest res, HttpServletResponse rep) {
		int pid = Integer.parseInt(res.getParameter("pid"));
		String pname = res.getParameter("pname");
		int cid = Integer.parseInt(res.getParameter("cid"));
		String cname = res.getParameter("cname");
		String action = res.getParameter("action");
		String result = StaticValue.value_init;

		if (action.equals(".do")) {
			Menu menu = new Menu();
			menu.setMenu_id(cid);
			menu.setMenu_title(cname);
			ms.updatemenu(menu);

		} else {
			MenuList ml = new MenuList();
			ml.setId(cid);
			ml.setMenu_li(cname);
			ml.setMenu_value(action);
			mls.updatemenulist(ml);
		}

		result = StaticValue.value_right;
		try {
			rep.getWriter().println(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/menudelete.do", method = RequestMethod.POST)
	public void menuedel(HttpServletRequest res, HttpServletResponse rep) {
		int id = Integer.parseInt(res.getParameter("id"));
		String flag = res.getParameter("flag");
		String result = StaticValue.value_init;

		if (flag.indexOf(".") != -1) {
			mls.delmenu(id);

		}
		mrs.deletemenurole(-1, id);
		mls.delpmenu(id);
		ms.delmenu(id);

		result = StaticValue.value_right;
		try {
			rep.getWriter().println(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
