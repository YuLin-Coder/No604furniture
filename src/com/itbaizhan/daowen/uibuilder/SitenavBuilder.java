package com.itbaizhan.daowen.uibuilder;

import java.text.MessageFormat;
import java.util.List;

import com.itbaizhan.daowen.bll.SystemParam;
import com.itbaizhan.daowen.dal.DALBase;
import com.itbaizhan.daowen.entity.Sitenav;

public class SitenavBuilder {

	public String build(){
		
		StringBuilder sb=new StringBuilder();
		sb.append("<div class=\"main-nav\">");
		sb.append("   <div class=\"wrap\">");
		sb.append("       <ul class=\"menus clearfix\">");
		
		List<Sitenav> list=DALBase.getEntity("sitenav", " order by sindex asc");
		int i=0;
		for(Sitenav sn : list){
			String current="";
			if(i==0){
				current="current";
				
			}
			sb.append("<li>");
			if(sn.getHref().split("\\?").length>1)
				sb.append(MessageFormat.format(" <a   id=\"{0}\" class=\"{3}\" href=\"{1}{2}&headid={0}\">{4}</a>",sn.getId(),SystemParam.getSiteRoot(),sn.getHref(),current,sn.getTitle()));
			else {
				System.out.println("current="+current);
				sb.append(MessageFormat.format(" <a  id=\"{0}\" class=\"{3}\"  href=\"{1}{2}?headid={0}\">{4}</a>",sn.getId(),SystemParam.getSiteRoot(),sn.getHref(),current,sn.getTitle()));
			}
			
			sb.append("</li>");
			i++;
		}
		
		sb.append("       </ul>");
		//end wrap
		sb.append("    </div>");
		//end main-nav
		sb.append("</div>");
		
		return sb.toString();
		
	}
	
	
}
