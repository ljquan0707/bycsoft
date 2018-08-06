package com.spring.controller;
import java.io.IOException;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.service.UserService;
import com.spring.utill.generateImage;




@Controller
public class FileUploadController {
	private UserService users;

	@Resource(name = "userservice")
	public void setUs(UserService users) {
		this.users = users;
	}

    
	@RequestMapping(value="photo.do",method=RequestMethod.POST)
	public void saveDriver(HttpSession session,HttpServletRequest req,HttpServletResponse res) {
		String data=req.getParameter("image");
		
		String username=req.getParameter("username");
		
		String arr[]= data.split(",");
		
		String result="ok";
		/*String path=req.getSession().getServletContext().getRealPath("/")+"/photo/"+id+".jpg";*/
		String path="D:\\wlxtfile\\"+username+".jpg";
		generateImage.generateImage(arr[1],path);
		
		
		try {
			res.getWriter().print(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
	}
		
		
	
	
	 
		
	}




