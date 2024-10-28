package com.itbaizhan.daowen.action;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SQLQuery;
import org.hibernate.Query;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.text.MessageFormat;

import com.itbaizhan.daowen.bll.*;
import com.itbaizhan.daowen.dal.*;
import com.itbaizhan.daowen.entity.*;
import com.itbaizhan.daowen.util.DaowenUIHelper;
import com.itbaizhan.daowen.util.ExtHelper;
import com.itbaizhan.daowen.util.HibernateSessionFactory;
import com.itbaizhan.daowen.util.PagerMetal;

public class FriendlinkAction extends PageActionBase {
	public void onLoad() {

	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String id = request.getParameter("id");
		DALBase.delete("friendlink", " where id=" + id);
		binding();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String title = request.getParameter("title");
		String href = request.getParameter("href");
		SimpleDateFormat sdffriendlink = new SimpleDateFormat("yyyy-MM-dd");
		Friendlink friendlink = new Friendlink();
		friendlink.setTitle(title == null ? "" : title);
		friendlink.setHref(href == null ? "" : href);
		DALBase.save(friendlink);
		// 保存附件
		attachements(request, response,
				new Integer(friendlink.getId()).toString());
		// 绑定数据
		binding();
	}

	/******************************************************
	 *********************** 内部附件支持*********************
	 *******************************************************/
	public void attachements(HttpServletRequest request,
			HttpServletResponse response, String belongid) {
		DALBase.delete("attachement", MessageFormat.format(
				" where belongid=''{0}'' and belongtable=''friendlink'' ",
				belongid));
		String[] photos = request.getParameterValues("fileuploaded");
		if (photos == null)
			return;
		for (int i = 0; i < photos.length; i++) {
			Attachement a = new Attachement();
			a.setType("images");
			a.setPubtime(new Date());
			a.setBelongfileldname("id");
			a.setFilename(photos[i]);
			a.setBelongid(belongid);
			a.setBelongtable("friendlink");
			a.setUrl(SystemParam.getSiteRoot() + "/upload/temp/"
					+ a.getFilename());
			a.setTitle(a.getFilename());
			DALBase.save(a);
		}
	}

	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String id = request.getParameter("id");
		if (id == null)
			return;
		Friendlink friendlink = (Friendlink) DALBase.load(Friendlink.class,
				new Integer(id));
		if (friendlink == null)
			return;
		String title = request.getParameter("title");
		String href = request.getParameter("href");
		SimpleDateFormat sdffriendlink = new SimpleDateFormat("yyyy-MM-dd");
		friendlink.setTitle(title);
		friendlink.setHref(href);
		DALBase.update(friendlink);
		attachements(request, response,
				new Integer(friendlink.getId()).toString());
		binding();
	}

	/******************************************************
	 *********************** 加载内部支持*********************
	 *******************************************************/
	public void load() {
		//
		String id = request.getParameter("id");
		String actiontype = "save";
		dispatchParams(request, response);
		if (id != null) {
			Friendlink friendlink = (Friendlink) DALBase.load("friendlink",
					"where id=" + id);
			if (friendlink != null) {
				request.setAttribute("friendlink", friendlink);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		try {
			request.getRequestDispatcher("friendlinkadd.jsp").forward(request,
					response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void binding() {
		String filter = "";
		//

		String title = request.getParameter("title");
		if (title != null)
			filter = "  where title like '%" + title + "%'  ";
		//

		int pageindex = 1;
		int pagesize = 10;
		// 获取当前分页
		String currentpageindex = request.getParameter("currentpageindex");
		// 当前页面尺寸
		String currentpagesize = request.getParameter("pagesize");
		// 设置当前页
		if (currentpageindex != null)
			pageindex = new Integer(currentpageindex);
		// 设置当前页尺寸
		if (currentpagesize != null)
			pagesize = new Integer(currentpagesize);
		List<Friendlink> listfriendlink = DALBase.getPageEnity("friendlink",
				filter, pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("friendlink",
				filter == null ? "" : filter);
		request.setAttribute("listfriendlink", listfriendlink);
		PagerMetal pm = new PagerMetal(recordscount);
		// 设置尺寸
		pm.setPagesize(pagesize);
		// 设置当前显示页
		pm.setCurpageindex(pageindex);
		// 设置分页信息
		request.setAttribute("pagermetal", pm);
		// 分发请求参数
		dispatchParams(request, response);
		try {
			request.getRequestDispatcher("/admin/friendlinkmanager.jsp")
					.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
