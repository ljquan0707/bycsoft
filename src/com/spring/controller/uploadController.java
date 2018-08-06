package com.spring.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.spring.utill.FileUploadUtil;
@Controller
public class uploadController {
	@RequestMapping("/progress") 
	public void uploadFile(HttpServletRequest request,HttpServletResponse response, 
	            @RequestParam("file") CommonsMultipartFile file) throws IOException { 
	   response.setContentType("text/html"); 
	   response.setCharacterEncoding("GBK"); 
	   PrintWriter out; 
	   boolean flag = false; 
	   System.out.println("00000");
	   if (file.getSize() > 0) { 
	     //文件上传的位置可以自定义 
	     flag = FileUploadUtil.uploadFile(request, file); 
	   } 
	   out = response.getWriter(); 
	   if (flag == true) { 
	    out.print("1"); 
	   } else { 
	    out.print("2"); 
	   } 
	} 
}
