package com.spring.utill;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Utill {
	public static String Datetime(){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date d = new Date();
		String dd = format.format(d);
		return dd;
	}
	public static String Date(){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date d = new Date();
		String dd = format.format(d);
		return dd;
	}
	// 返回服务器的IP地址
	public static String returnIp() throws UnknownHostException {
		String Ip=null;
		InetAddress address = InetAddress.getLocalHost();
		Ip=address.getHostAddress();
		return Ip;
	}
	

}
