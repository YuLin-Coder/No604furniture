package com.itbaizhan.daowen.webcontrol;

import javax.servlet.jsp.tagext.TagSupport;

public class Control extends TagSupport{
	
   private String id;
	
	
	public void setValue(){
		
		
		
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}
	
	public  String scriptBegin(){
		StringBuffer sb=new StringBuffer();
		sb.append("<script type=\"text/javascript\">");
		return sb.toString();
	}
	
	public  String scriptEnd(){
		StringBuffer sb=new StringBuffer();
		sb.append("</script>");
		return sb.toString();
	}
	
	
	

}
