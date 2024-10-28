package com.itbaizhan.daowen.bll;

import java.text.MessageFormat;
import java.util.Iterator;
import java.util.List;

import com.itbaizhan.daowen.dal.DALBase;
import com.itbaizhan.daowen.entity.Leaveword;

public class LeavewordBLL {

	public static String getLeaveword(){

		StringBuffer sb=new StringBuffer();
		sb.append("<ul >");
		List list=DALBase.getEntity("leaveword", "");

		for(Iterator<Leaveword> it=list.iterator();it.hasNext();)
		{
			Leaveword c=it.next();
			sb.append("<li>");
			sb.append("<div class='title'>");
			sb.append(c.getTitle());
			sb.append("</div>");
			sb.append("<div class='content'>");
			sb.append(c.getDcontent());
			sb.append("留言时间:"+c.getPubtime().toLocaleString());
			sb.append("留言人:"+c.getReplyren());

			sb.append("</div>");
			if(c.getStatus()==1)
			{
				sb.append("<div class='reply'>");
				sb.append(MessageFormat.format("<div>回复内容{0}</div>", c.getReplycontent()));
				sb.append(MessageFormat.format("<span>回复时间{0}</span>", c.getReplytime().toLocaleString()));
				sb.append(MessageFormat.format("<span>回复人：{0}</span>", c.getReplyren()));
				sb.append("</div>");
			}

			sb.append("</li>");


		}
		sb.append("</ul>");

		return sb.toString();



	}


}
