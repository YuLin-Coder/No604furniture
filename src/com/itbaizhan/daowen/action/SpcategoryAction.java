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


public class SpcategoryAction extends PageActionBase {

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String id = request.getParameter("id");
		SpcategoryTree spctree=new SpcategoryTree();
		spctree.deleteLeafNode("spcategory", new Integer(id));
		
		binding();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		String mingcheng = request.getParameter("mingcheng");
		String jieshao = request.getParameter("jieshao");
		String parentid=request.getParameter("parentid");
		System.out.println("获取到parentid="+parentid);
		SimpleDateFormat sdfspcategory = new SimpleDateFormat("yyyy-MM-dd");
		Spcategory spcategory = new Spcategory();
		spcategory.setIsleaf(1);
		if(parentid!=null)
		    spcategory.setParentid(new Integer(parentid));
		spcategory.setMingcheng(mingcheng == null ? "" : mingcheng);
		spcategory.setJieshao(jieshao == null ? "" : jieshao);
		
		SpcategoryTree  spctree=new SpcategoryTree();
		spctree.saveTreeNode(spcategory);
		
		binding();
	}

	
	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Spcategory spcategory = (Spcategory) DALBase.load(Spcategory.class,
				new Integer(id));
		if (spcategory == null)
			return;
		String mingcheng = request.getParameter("mingcheng");
		String jieshao = request.getParameter("jieshao");
		SimpleDateFormat sdfspcategory = new SimpleDateFormat("yyyy-MM-dd");
		spcategory.setMingcheng(mingcheng);
		spcategory.setJieshao(jieshao);
		DALBase.update(spcategory);
		
		binding();
	}

	/******************************************************
	 *********************** 加载内部支持*********************
	 *******************************************************/
	public void load() {
		//
		String id = request.getParameter("id");
		
		String parentid = request.getParameter("parentid");
		if (parentid != null) {

			SpcategoryTree spct = new SpcategoryTree();
			int tempid = new Integer(parentid);
            String showtext=spct.getShowText("spcategory", tempid);
            System.out.print("showtext="+showtext);
			request.setAttribute("parenttext", showtext);
			request.setAttribute("parentid", parentid);

		} else {
			request.setAttribute("parentid", 0);
			request.setAttribute("parenttext", "商品总分类");
		}
		
		
		
		String actiontype = "save";
		dispatchParams(request, response);
		if (id != null) {
			Spcategory spcategory = (Spcategory) DALBase.load("spcategory",
					"where id=" + id);
			if (spcategory != null) {
				request.setAttribute("spcategory", spcategory);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/spcategoryadd.jsp";
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
		String mingcheng = request.getParameter("mingcheng");
		if (mingcheng != null)
			filter += "  and mingcheng like '%" + mingcheng + "%'  ";
		//
		int pageindex = 1;
		int pagesize = 10;
		// 获取当前分页
		String currentpageindex = request.getParameter("currentpageindex");
		// 当前页面尺寸
		String currentpagesize = request.getParameter("pagesize");
		// 设置当前页
//		if (currentpageindex != null)
//			pageindex = new Integer(currentpageindex);
//		// 设置当前页尺寸
//		if (currentpagesize != null)
//			pagesize = new Integer(currentpagesize);
		//List<Spcategory> listspcategory = DALBase.getPageEnity("spcategory",
		//		filter, pageindex, pagesize);
		SpcategoryTree  spctree=new SpcategoryTree();
		List<Spcategory> listspcategory=spctree.getTree("spcategory", 0);
		int recordscount = DALBase.getRecordCount("spcategory",
				filter == null ? "" : filter);
		request.setAttribute("listspcategory", listspcategory);
		//PagerMetal pm = new PagerMetal(recordscount);
		// 设置尺寸
		//pm.setPagesize(pagesize);
		// 设置当前显示页
		//pm.setCurpageindex(pageindex);
		// 设置分页信息
		//request.setAttribute("pagermetal", pm);
		// 分发请求参数
		dispatchParams(request, response);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/spcategorymanager.jsp";
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
