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
 * @author daowen
 * 
 *         首页栏目控制
 * 
 */
public class IndexcolumnsAction extends PageActionBase {
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
		DALBase.delete("indexcolumns", " where id=" + id);
		binding();
	}

	
	
	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String spcid=request.getParameter("spcid");
		String errorurl = request.getParameter("errorurl");
		if(spcid!=null)
		{
			Spcategory temspc=(Spcategory)DALBase.load("spcategory", "where id="+spcid);
			if(temspc!=null)
			{
				Indexcolumns indexcolumns = new Indexcolumns();
				indexcolumns.setColdes(temspc.getMingcheng());
				indexcolumns.setColid(temspc.getId());
				indexcolumns.setXtype("商品");
				indexcolumns.setShowstyle("图片");
				
				DALBase.save(indexcolumns);
			}
		}
		if (forwardurl == null) {
			forwardurl = "/admin/indexcolumnsmanager.do?actiontype=get";
		}
		try {
			response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
		} catch (Exception e) {
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
		Indexcolumns indexcolumns = (Indexcolumns) DALBase.load(
				Indexcolumns.class, new Integer(id));
		if (indexcolumns == null)
			return;
		String coldes = request.getParameter("coldes");
		String colid = request.getParameter("colid");
		String xtype = request.getParameter("xtype");
		String showstyle = request.getParameter("showstyle");
		SimpleDateFormat sdfindexcolumns = new SimpleDateFormat("yyyy-MM-dd");
		indexcolumns.setColdes(coldes);
		indexcolumns.setColid(colid == null ? 0 : new Integer(colid));
		indexcolumns.setXtype(xtype);
		indexcolumns.setShowstyle(showstyle);
		DALBase.update(indexcolumns);
		
		if (forwardurl == null) {
			forwardurl = "/admin/indexcolumnsmanager.do?actiontype=get";
		}
		try {
			response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
		} catch (Exception e) {
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
			Indexcolumns indexcolumns = (Indexcolumns) DALBase.load(
					"indexcolumns", "where id=" + id);
			if (indexcolumns != null) {
				request.setAttribute("indexcolumns", indexcolumns);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/indexcolumnsadd.jsp";
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
		String coldes = request.getParameter("coldes");
		if (coldes != null)
			filter += "  and coldes like '%" + coldes + "%'  ";
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
		List<Indexcolumns> listindexcolumns = DALBase.getPageEnity(
				"indexcolumns", filter, pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("indexcolumns",
				filter == null ? "" : filter);
		request.setAttribute("listindexcolumns", listindexcolumns);
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
			forwardurl = "/admin/indexcolumnsmanager.jsp";
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
