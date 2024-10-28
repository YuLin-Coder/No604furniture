package com.itbaizhan.daowen.bll;
import java.text.MessageFormat;
import java.util.*;

import com.itbaizhan.daowen.dal.DALBase;
import com.itbaizhan.daowen.entity.*;
public class NoticeService {
	
	
	public static String getNotice() {
		StringBuffer sb = new StringBuffer();

		List<Notice> list = DALBase.getTopList("notice", "", 10);
		sb.append("<ul>");
		sb.append("\r\n");
		for (Iterator<Notice> it = list.iterator(); it.hasNext();) {
			Notice n = it.next();
			sb.append(MessageFormat.format(
					"<li ><a href=''noticeinfo.jsp?id={0}''>{1}</a></li>",
					n.getId(), n.getTitle()));
			sb.append("\r\n");
		}
		sb.append("\r\n");
		sb.append("</ul>");
		return sb.toString();

	}
	
	

}
