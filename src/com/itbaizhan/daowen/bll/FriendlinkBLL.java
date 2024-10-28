package com.itbaizhan.daowen.bll;

import java.text.MessageFormat;
import java.util.Iterator;
import java.util.List;

import com.itbaizhan.daowen.dal.DALBase;
import com.itbaizhan.daowen.entity.Friendlink;


public class FriendlinkBLL {

	public static String getFriendLink() {

		StringBuffer sb = new StringBuffer();
		List<Friendlink> list = DALBase.getEntity("friendlink", "");

		int i = 0;
		
		for (Iterator<Friendlink> it = list.iterator(); it.hasNext();) {

			Friendlink fl = it.next();
			sb.append(MessageFormat.format("<a target=\"_blank\" href=\"{1}\">{0}</a>",
					fl.getTitle(), fl.getHref()));
			sb.append("\r\n");

		}
		
		
		return sb.toString();

	}

}
