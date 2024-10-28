package com.itbaizhan.daowen.bll;

import java.text.MessageFormat;
import java.util.Iterator;
import java.util.List;

import com.itbaizhan.daowen.dal.DALBase;
import com.itbaizhan.daowen.entity.Comment;

public class CommentBLL {

	public static String getComments(String type,String belongid){

		StringBuffer sb=new StringBuffer();
		sb.append("<ul >");
		List list=DALBase.getEntity("comment", MessageFormat.format(" where xtype=''{0}'' and belongid=''{1}''",type,belongid));

		for(Iterator<Comment> it=list.iterator();it.hasNext();)
		{
			Comment c=it.next();
			sb.append("<li>");
			sb.append("<div class='title'>");
			sb.append(c.getTitle());
			sb.append("</div>");
			sb.append("<div class='comment'>");
			sb.append(c.getCommentcontent());
			sb.append("</div>");
			sb.append("<div class='reply'>");
			sb.append(MessageFormat.format("<span>评论时间{0}</span>", c.getCommenttime().toLocaleString()));
			sb.append(MessageFormat.format("<span>评论人:{0}</span>", c.getCommentren()));
			sb.append("</div>");

			sb.append("</li>");


		}
		sb.append("</ul>");

		return sb.toString();



	}


}
