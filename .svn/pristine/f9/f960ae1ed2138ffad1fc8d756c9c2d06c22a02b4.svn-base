package com.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.WaybillDao;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
@Component("waybillservice")
public class WaybillService {
	@Resource(name="waybilldao")
	private WaybillDao wd;
	@Transactional
	public void waysave(String[] arr,int[] array){
		wd.save(arr,array);
	}
	@Transactional
	public int count() {
		return wd.count();
	}
	@Transactional
	public JSONObject waibill(int limit,int offset) {
		JSONObject pjson=new JSONObject();
			
		 JSONArray parray = new JSONArray();
		 List<Object[]> list=wd.waybill(limit, offset);
		 for (Object[] ob : list) {
			 JSONObject json=new JSONObject();
				json.put("id", ob[0]);
				json.put("waybillno", ob[1]);
				json.put("fromcity", ob[2]);
				json.put("tocity", ob[3]);
				json.put("customername", ob[4]);
				json.put("hwmc", ob[5]);
				json.put("js", ob[6]);
				json.put("bz", ob[7]);
				json.put("mz", ob[8]);
				json.put("sjzl", ob[9]);
				json.put("size", ob[10]);
				json.put("thfs", ob[11]);
				json.put("zdsj", ob[12]);
				json.put("state", ob[13]);
				parray.add(json);
				
		 }
		 pjson.put("total", this.count());
		 pjson.put("rows", parray);
		 return pjson;
	}
	@Transactional
	public JSONObject searchwaibill(Map map) {
		JSONObject pjson=new JSONObject();
			
		 JSONArray parray = new JSONArray();
		 List<Object[]> list=wd.searchwaybill(map);
		 int count=0;
		 for (Object[] ob : list) {
			 JSONObject json=new JSONObject();
				json.put("id", ob[0]);
				json.put("waybillno", ob[1]);
				json.put("fromcity", ob[2]);
				json.put("tocity", ob[3]);
				json.put("customername", ob[4]);
				json.put("hwmc", ob[5]);
				json.put("js", ob[6]);
				json.put("bz", ob[7]);
				json.put("mz", ob[8]);
				json.put("sjzl", ob[9]);
				json.put("size", ob[10]);
				json.put("thfs", ob[11]);
				json.put("zdsj", ob[12]);
				json.put("state", ob[13]);
				parray.add(json);
				count++;
		 }
		 pjson.put("total", count);
		 pjson.put("rows", parray);
		 return pjson;
	}
}
