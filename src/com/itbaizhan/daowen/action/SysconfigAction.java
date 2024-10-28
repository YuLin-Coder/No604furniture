package com.itbaizhan.daowen.action;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.itbaizhan.daowen.util.PagerMetal;

/**************************
 * 
 * @author daowen date:2013-12-05 控制
 * 
 */
public class SysconfigAction extends PageActionBase {
	@Override
	public void onLoad() {
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		if (actiontype == null)
			return;
		
	}


	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String id = request.getParameter("id");
		DALBase.delete("sysconfig", " where id=" + id);
		binding();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		String title = request.getParameter("title");
		String dcontent = request.getParameter("dcontent");
		SimpleDateFormat sdfsysconfig = new SimpleDateFormat("yyyy-MM-dd");
		Sysconfig sysconfig = new Sysconfig();
		sysconfig.setTitle(title == null ? "" : title);
		sysconfig.setDcontent(dcontent == null ? "" : dcontent);
		DALBase.save(sysconfig);
		// 保存附件

		try {
			response.sendRedirect(SystemParam.getSiteRoot()
					+ "/admin/sysconfigmanager.do?actiontype=get&seedid=307");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	
	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Sysconfig sysconfig = (Sysconfig) DALBase.load(Sysconfig.class,
				new Integer(id));
		if (sysconfig == null)
			return;
		String title = request.getParameter("title");
		String dcontent = request.getParameter("dcontent");
		SimpleDateFormat sdfsysconfig = new SimpleDateFormat("yyyy-MM-dd");
		sysconfig.setTitle(title);
		sysconfig.setDcontent(dcontent);
		DALBase.update(sysconfig);
		
		try {
			response.sendRedirect(SystemParam.getSiteRoot()
					+ "/admin/sysconfigmanager.do?actiontype=get&seedid=307");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
			Sysconfig sysconfig = (Sysconfig) DALBase.load("sysconfig",
					"where id=" + id);
			if (sysconfig != null) {
				request.setAttribute("sysconfig", sysconfig);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/sysconfigadd.jsp";
		}
		try {
			request.getRequestDispatcher(forwardurl).forward(request, response);
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
		String filter = "where 1=1 ";
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
		List<Sysconfig> listsysconfig = DALBase.getPageEnity("sysconfig",
				filter, pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("sysconfig",
				filter == null ? "" : filter);
		request.setAttribute("listsysconfig", listsysconfig);
		PagerMetal pm = new PagerMetal(recordscount);
		// 设置尺寸
		pm.setPagesize(pagesize);
		// 设置当前显示页
		pm.setCurpageindex(pageindex);
		// 设置分页信息
		request.setAttribute("pagermetal", pm);
		// 分发请求参数
		dispatchParams(request, response);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/sysconfigmanager.jsp";
		}
		try {
			request.getRequestDispatcher(forwardurl).forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
