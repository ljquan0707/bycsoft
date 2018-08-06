package com.spring.servlet;

import java.io.ByteArrayOutputStream; 
import java.io.File; 
import java.io.FileInputStream; 
import java.io.IOException; 
import java.io.InputStream; 
import java.io.OutputStream; 
import javax.servlet.ServletException; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 
 
/** 
 * @说明 该Servlet将本地硬盘的图片输入管道中 
 * @author cuisuqiang 
 * @version 1.0 
 * @since 
 */ 

public class ImageShowServlet extends HttpServlet { 
 
  @Override 
  protected void service(HttpServletRequest request, HttpServletResponse response) 
      throws ServletException, IOException {
	  int id=Integer.parseInt(request.getParameter("id"));
	  System.out.println("通过");
    OutputStream os = response.getOutputStream();
    String path=request.getSession().
    	getServletContext().getRealPath("/");
   
    
    
  } 
   
  /** 
   * 读取管道中的流数据 
   */ 
  public byte[] readStream(InputStream inStream) { 
    ByteArrayOutputStream bops = new ByteArrayOutputStream(); 
    int data = -1; 
    try { 
      while((data = inStream.read()) != -1){ 
        bops.write(data); 
      } 
      return bops.toByteArray(); 
    }catch(Exception e){ 
      return null; 
    } 
  } 
} 
 
