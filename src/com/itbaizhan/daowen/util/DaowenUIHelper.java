package com.itbaizhan.daowen.util;

import java.util.List;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;




public class DaowenUIHelper {
	
	public static String getJsonFromList(List beanList){
		return getJsonFromList(beanList.size(),beanList);
	}

	private static String getJsonFromList(int recordTotal, List rows) {

		JSONObject jsonobject = new JSONObject();
		jsonobject.put("Rows", rows);
		jsonobject.put("Total",new Integer(recordTotal));
		
		return jsonobject.toString();
		
	}

}
