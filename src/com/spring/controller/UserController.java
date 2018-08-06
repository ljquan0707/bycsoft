package com.spring.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.spring.pojo.User;
import com.spring.pojo.Login;
import com.spring.service.LoginService;
import com.spring.service.UserService;
import com.spring.servlet.Webcomment;
import com.spring.utill.StaticValue;
import com.spring.utill.Utill;

@Controller
public class UserController {
	private UserService users;

	@Resource(name = "userservice")
	public void setUs(UserService users) {
		this.users = users;
	}

	private LoginService ls;

	@Resource(name = "loginservice")
	public void setLs(LoginService ls) {
		this.ls = ls;
	}

	

	@RequestMapping(value = "/login.do")
	public String Login() {
		System.out.println("登录界面");
		
		return "login";
	}
      Map<String,String> map= new HashMap<String, String>();
	@RequestMapping(value = "/sub.do")
	public String Load(HttpSession session,HttpServletRequest request) {
		String sessionid=request.getRequestedSessionId();
		User user = new User();
		Login login = new Login();
		System.out.println("首页"+sessionid);
		String username = map.get(sessionid);
		String password="";
		List<Object[]> list = users.selectuser(username, password);
		if (!list.isEmpty()) {
			for (Object[] ob : list) {
				user.setUsername(ob[0].toString());
				login.setUsername(ob[0].toString());
				user.setPassword(ob[1].toString());
				login.setPassword(ob[1].toString());
				user.setRealname(ob[2].toString());
				user.setId((int)ob[6]);
				user.setRolename(ob[7].toString());
				user.setRoleId((int)ob[8]);
			}}
		List<Object> loginlist = ls.selectlogin(username);
		if (!loginlist.equals("")) {
			if (username == null) {
				return "login";
			} else {
				if(loginlist.get(0)==null){
					user.setLogintime("首次登陆");
				}else{
				String logintime = loginlist.get(0).toString();
				user.setLogintime(logintime);
				
				}
				login.setTime(new Date());
				ls.addlogin(login);
				session.setAttribute("users", user);
			}
		}

		return "jsp/common/index";
	}
	@RequestMapping(value = "/loginout.do", method = RequestMethod.GET)
	public String loginout(HttpServletRequest request,
			HttpServletResponse response) {
		String sessionid=request.getRequestedSessionId();
		System.out.println(map.get(sessionid)+"退出系统");
		map.remove(sessionid);
		
		return "login";
	}
	
	
	
	@RequestMapping(value = "/yanz.do", method = RequestMethod.GET)
	public void username(HttpServletRequest request,
			HttpServletResponse response) {
		String username = request.getParameter("username");
		String password = "";
		System.out.println(username + "0");
		String result = "";
		List<Object[]> list = users.selectuser(username, password);
		for (Object[] ob : list) {
			try {
				if (!list.isEmpty()) {
					String username1 = ob[0].toString();
					if (username.equals(username1)) {
						result = "200";
					}
				}
				response.getWriter().print(result);
			} catch (IOException e) {

				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping(value = "/yz.do", method = RequestMethod.GET)
	public void tel(HttpServletRequest request,
			HttpServletResponse response) {
		String username = request.getParameter("username");
		String tel=request.getParameter("tel");
		System.out.println(username + "0");
		String result = "";
		List<Object[]> list = users.selectu(username, tel);
		for (Object[] ob : list) {
			try {
				if (!list.isEmpty()) {
					String username1 = ob[0].toString();
					if (username.equals(username1)) {
						result = "200";
					}
				}
				response.getWriter().print(result);
			} catch (IOException e) {

				e.printStackTrace();
			}
		}
	}

	@RequestMapping(value = "/submit.do", method = RequestMethod.GET)
	public void auser(HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(username + "0" + password);
		String result = "400";
		String sessionid=request.getRequestedSessionId();
		int port=request.getServerPort();
		String remoteAddress=request.getRemoteAddr();
		List<Object[]> list = users.selectuser(username, password);
		try {
			if (!list.isEmpty()) {
				for (Object[] ob : list) {
					map.put(sessionid, ob[0].toString());
		             String ps = ob[1].toString();
					if (password.equals(ps)) {
						result = "200";
						System.out.println(result);
						response.getWriter().print(result);
					}
				}
			} else {
				System.out.println(result);
				response.getWriter().print(result);
			}
		} catch (IOException e) {

			e.printStackTrace();
		}
	}
	@RequestMapping(value = "/add.do", method = RequestMethod.POST)
	public void adduser(HttpServletRequest request, HttpServletResponse response) {
		
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String realname = request.getParameter("realname");
		String sex = request.getParameter("sex");
		String tel = request.getParameter("tel");
		int roleid = Integer.parseInt(request.getParameter("roleid"));
		System.out.println(username + "-" + password + "-" + realname + "-"
				+ sex + "-" + roleid + "-" + tel);
		Date date = new Date();
		User us = new User();
		us.setCreatetime(date);
		us.setPassword(password);
		us.setRealname(realname);
		us.setRoleId(roleid);
		us.setSex(sex);
		us.setTel(tel);
		us.setUsername(username);
		us.setNickname(username);
		us.setSignature("暂无");
		String result = "ture";
		users.add(us);
		try {
			response.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value = "/loginlist", method = RequestMethod.GET)
	public String loginlist(HttpSession session) {
		List<Object[]> loginlist = users.loginlist();
		/*for (Object[] ob : loginlist) {
			System.out.println(ob[2]);
		}*/
		session.setAttribute("loginlist", loginlist);
		return "jsp/user/userlist";
	}
	@RequestMapping(value = "/looksingle.do", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public void looksingle(HttpServletRequest req, HttpServletResponse res) {
		String username = req.getParameter("username");
		String password = "";
		JSONObject oj = new JSONObject();
		res.setCharacterEncoding("UTF-8");
		List<Object[]> userlist = users.selectuser(username, password);
		for (Object[] ob : userlist) {
			for (int i = 0; i < ob.length; i++) {
				oj.put("u" + i, ob[i]);
			}
		}
		try {
			res.getWriter().print(oj);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value="/lookuser.do",method=RequestMethod.POST)
	public void lookuser(HttpServletRequest req,HttpServletResponse res){
		String colum=req.getParameter("colum");
		String obj=req.getParameter("text");
		JSONObject oj = new JSONObject();
		res.setCharacterEncoding("UTF-8");
		List<Object[]> userlist = users.lookuser(colum, obj);
		if(userlist.isEmpty()){
			String result="400";
			try {
				res.getWriter().print(result);
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}else{
		for (Object[] ob : userlist) {
			for (int i = 0; i < ob.length; i++) {
				oj.put("u" + i, ob[i]);
			}
		}
		System.out.println(oj);
		try {
			res.getWriter().print(oj);
		} catch (IOException e) {
			e.printStackTrace();
		}}
	}
	@RequestMapping(value="/delete.do",method=RequestMethod.POST)
	public void delete(HttpServletRequest req,HttpServletResponse res){
		String username=req.getParameter("username");
		users.deleteuser(username);
		String result="200";
		try {
			res.getWriter().print(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public void updateuser(HttpServletRequest request, HttpServletResponse response) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String realname = request.getParameter("realname");
		String sex = request.getParameter("sex");
		String tel = request.getParameter("tel");
		int roleid = Integer.parseInt(request.getParameter("roleid"));
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println(username + "-" + password + "-" + realname + "-"
				+ sex + "-" + roleid + "-" + tel);
		Date date = new Date();
		User us = new User();
		us.setCreatetime(date);
		us.setPassword(password);
		us.setRealname(realname);
		us.setRoleId(roleid);
		us.setSex(sex);
		us.setTel(tel);
		us.setUsername(username);
		us.setId(id);
		String result = "ture";
		users.updateuser(us);
		try {
			response.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value = "/updatepw.do", method = RequestMethod.GET)
	public void updatpw(HttpServletRequest request, HttpServletResponse response) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		String result = "";
		users.updatepass(username, password);
		result="200";
		try {
			response.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value = "/updatenick.do", method = RequestMethod.GET)
	public void updanick(HttpServletRequest request, HttpServletResponse response) {
		String username = request.getParameter("username");
		String nickname = request.getParameter("nickname");
		String signature=request.getParameter("signature");
		String result =StaticValue.value_init;
		users.updatenick(username, nickname,signature);
		
		result=StaticValue.value_right;
		try {
			response.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value = "/info.do", method = RequestMethod.GET)
	public void info(HttpServletRequest req, HttpServletResponse res) {
		String username = req.getParameter("username");
		String password = "";
		JSONArray array = new JSONArray();
		JSONObject json=new JSONObject();
		res.setCharacterEncoding("UTF-8");
		List<Object[]> userlist = users.selectuser(username, password);
		json.put("username", userlist.get(0)[0]);
		json.put("realname", userlist.get(0)[2]);
		json.put("sex", userlist.get(0)[3]);
		json.put("tel", userlist.get(0)[4]);
		json.put("createtime", userlist.get(0)[5]);
		json.put("rolename", userlist.get(0)[7]);
		json.put("nickname",userlist.get(0)[9]);
		json.put("signature", userlist.get(0)[10]);
		array.add(json);
		System.err.println(array);
		try {
			res.getWriter().print(array);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
}
@RequestMapping(value = "/uppw.do", method = RequestMethod.POST)
public void upd(HttpServletRequest request, HttpServletResponse response) {
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String pw1 = request.getParameter("pw1");
	
	String result = "";
	System.out.println(username+"///"+password);
	List<Object[]> list = users.selectuser(username, password);
	
	try {
		if(list.isEmpty()){
			result="400";
			response.getWriter().print(result);
		}else{
			users.updatepass(username, pw1);
			result="200";
			response.getWriter().print(result);
		}
		
	} catch (IOException e) {
		e.printStackTrace();
	}
}

}
