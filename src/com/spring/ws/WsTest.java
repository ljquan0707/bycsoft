package com.spring.ws;

import net.sf.json.JSONObject;

import org.hibernate.SessionFactory;

public class WsTest {
private SessionFactory sessionFactory;


	public SessionFactory getSessionFactory() {
	return this.sessionFactory;
}


public void setSessionFactory(SessionFactory sessionFactory) {
	this.sessionFactory = sessionFactory;
}


	public String login(){
		JSONObject json = new JSONObject();
		for(int i=0;i<90;i++){
			json.put("qw"+i, i+"");	
		}
		
		System.out.println(json);
		return json.toString();
	}

}
