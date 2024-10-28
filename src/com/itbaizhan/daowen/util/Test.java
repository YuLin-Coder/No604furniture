package com.itbaizhan.daowen.util;

import java.sql.Timestamp;
import java.util.Date;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;



public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		Timestamp ts=new Timestamp(System.currentTimeMillis());

		JsonConfig config = new JsonConfig();
		//
		config.registerJsonValueProcessor(Timestamp.class,new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
		Json1 j=new Json1();
		j.setTs(ts);
		j.setTest("测试");

		JSONObject jsonobject =JSONObject.fromObject(j,config);
		System.out.println( jsonobject.toString());




	}

}

