package com.spring.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.service.LoginService;
import com.spring.service.UserService;
import com.spring.servlet.Webcomment;
import com.spring.utill.StaticValue;
import com.spring.utill.Utill;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class ChatController {
	
	private UserService users;

	@Resource(name = "userservice")
	public void setUs(UserService users) {
		this.users = users;
	}

	private LoginService ls;

	@RequestMapping(value="useronline.do",method=RequestMethod.GET)
	public void online(HttpServletResponse res) {
		
		String username="";
		
		JSONArray rarray = new JSONArray();
		Webcomment we=new Webcomment();
		 int online=we.getOnlineCount();
		int i=0;
		for(String user:StaticValue.webSocketMap.keySet()){
	        username=username+user+"/";
	       System.out.println(username);
	        i++;
	       }
			List<Object[]> userlist =users.selectuserid(username);
			for(int j=0;j<userlist.size();j++) {
				JSONObject json =new JSONObject();
				 json.put("user", userlist.get(j)[1]);
				 json.put("id", userlist.get(j)[0]);
				 json.put("nickname", userlist.get(j)[2]);
				 json.put("signature",userlist.get(j)[3]);
				 rarray.add(json);
			}
		
		System.out.println(rarray);
		
		try {
			res.getWriter().println(rarray);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	// 获取服务器Ip 地址
	@RequestMapping(value="/getIp.do",method=RequestMethod.GET)
	public String getIP(HttpSession session ,HttpServletResponse res) throws IOException {
		String Ip=Utill.returnIp();
		session.setAttribute("localIp", Ip);
		System.out.println(Ip);
		return "jsp/chat/chat";
	}
}
