package com.itbaizhan.daowen.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Hashtable;

import org.apache.commons.validator.Constant;

public class SequenceUtil {


	private static Hashtable<String ,Integer> ht=null;

	static {
		ht=new Hashtable<String, Integer>();
	}

	private  static final int  MAXSIZE=10000;
	public static  String buildSequence(String prefix){


		SimpleDateFormat sdf = new SimpleDateFormat("yyyymmddHHMMss");
		String timestamp = sdf.format(new Date());
		if(ht.get(timestamp)!=null){
			int sequcence = (int)ht.get(timestamp);
			if (sequcence >MAXSIZE || sequcence < 1)
				ht.put(timestamp,1);
			ht.put(timestamp, (int)ht.get(timestamp)+1);
		}else {
			ht.clear();
			ht.put(timestamp, 1);
		}
		String index=ht.get(timestamp).toString();
		index=padLeft(index, 5, "0");
		return  prefix+timestamp+index;

	}



	/**
	 * 右补位，左对齐
	 *
	 * @param oriStr
	 *            原字符串
	 * @param len
	 *            目标字符串长度
	 * @param alexin
	 *            补位字符
	 * @return 目标字符串
	 */
	public static String padRight(String oriStr, int len, String alexin) {
		String str = "";
		int strlen = oriStr.length();
		if (strlen < len) {
			for (int i = 0; i < len - strlen; i++) {
				str = str + alexin;
			}
		}
		str = str + oriStr;
		return str;
	}

	/**
	 * 左补位，右对齐
	 *
	 * @param oriStr
	 *            原字符串
	 * @param len
	 *            目标字符串长度
	 * @param alexin
	 *            补位字符
	 * @return 目标字符串
	 */
	public static String padLeft(String oriStr, int len, String alexin) {
		String str = "";
		int strlen = oriStr.length();
		if (strlen < len) {
			for (int i = 0; i < len - strlen; i++) {
				str = str + alexin;
			}
		}
		str = str+oriStr ;
		return str;
	}



}
	
	
	

