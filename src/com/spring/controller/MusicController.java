package com.spring.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.spring.pojo.Music;
import com.spring.service.MusicService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class MusicController {
	@Resource(name="musicservice")
	private MusicService ms;
	public void setMs(MusicService ms) {
		this.ms = ms;
	}


	@RequestMapping("/uploadmusic.do")  
    @ResponseBody
    public String method2(@RequestParam MultipartFile[] file,
            @RequestParam String messageContent  ) { 
            //多个参数的话只要多个@RequestParam即可，注意参数名要和表单里面的属性名一致
     JSONObject json =new JSONObject();
     System.out.println(messageContent);
        String orgiginalFileName = ""; 
        int bytesum = 0; 
        int byteread = 0;
        
        
        try {  
            
        	
        	for(int i=0;i<file.length;i++) {
        		Music music=new Music();
            String fileName = file[i].getName();  
            InputStream inputStream = file[i].getInputStream();  
            String content = file[i].getContentType();  
            orgiginalFileName = file[i].getOriginalFilename();
            File f2 = new File("D://wlxtfile//sound//"+orgiginalFileName);
            if(!f2.exists()) {
            	f2.createNewFile();
            }
            FileOutputStream fs = new FileOutputStream(f2);
            
            byte[] buffer = new byte[1444]; 
            int length; 
            while ( (byteread = inputStream.read(buffer)) != -1) { 
            bytesum += byteread; //字节数 文件大小 
            
            fs.write(buffer, 0, byteread); 
            } 
            inputStream.close(); 
            music.setName(orgiginalFileName);
            ms.add(music);
           /*System.out.println("fileName: "+fileName+", inputStream: "+ inputStream  
                        +"\r\n content: "+content+", orgiginalFileName: ="+ orgiginalFileName  
                        +"\r\n projectName: "); */ 
        	}
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
        json.put("flag", true);
        json.put("message", "success");
        System.out.println(json.toString());
        return json.toString();  
    }       
        @RequestMapping(value="/musiclist.do",method=RequestMethod.GET)
	public void musiclist(HttpServletRequest req,HttpServletResponse res) {
        	List<Object[]> musiclist=ms.selectlit();
        	JSONArray array = new JSONArray();
    		res.setCharacterEncoding("UTF-8");
    		for (int j=0;j<musiclist.size();j++) {
    			JSONObject json = new JSONObject();
    			json.put("key", musiclist.get(j)[0]);
    			json.put("value", musiclist.get(j)[1]);
    			
    			array.add(json);
    				
    		}
    		System.out.println(array);
    		try {
    			res.getWriter().print(array);
    		} catch (IOException e) {
    			e.printStackTrace();
    		}
        }
		
       
	}
