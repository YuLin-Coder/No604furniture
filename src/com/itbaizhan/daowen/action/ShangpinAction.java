package com.itbaizhan.daowen.action;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.filefilter.AndFileFilter;
import org.apache.commons.io.filefilter.FalseFileFilter;
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
import com.itbaizhan.daowen.util.ExtHelper;
import com.itbaizhan.daowen.util.HibernateSessionFactory;
import com.itbaizhan.daowen.util.PagerMetal;


public class ShangpinAction extends PageActionBase {
	public void onLoad() {
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		if (actiontype == null)
			return ;
	
		if(actiontype.equals("hasExist")){
			hasExist();
		}
		
	}

	private void hasExist() {
		String spno=request.getParameter("spno");
		String strres="true";
		if(DALBase.isExist("shangpin", "where spno='"+spno.trim()+"'")){
			strres="false";
		}else {
			
            strres="true";
		}
		try {
			System.out.println("商品编号存在性="+strres);
			response.getWriter().write(strres);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String id = request.getParameter("id");
		DALBase.delete("shangpin", " where id=" + id);
		binding();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		String errorurl=request.getParameter("errorurl");
		String name = request.getParameter("name");
		String spno = request.getParameter("spno");
		String jiage = request.getParameter("jiage");
		String dazhe = request.getParameter("dazhe");
		String tuijian = request.getParameter("tuijian");
		String zuixin = request.getParameter("zuixin");
		String hot=request.getParameter("hot");
		String sptype = request.getParameter("sptype");
		String sptypeid = request.getParameter("sptypeid");
		String tupian = request.getParameter("tupian");
		String jieshao = request.getParameter("jieshao");
		String hyjia = request.getParameter("hyjia");
    	String pubren = request.getParameter("pubren");
		SimpleDateFormat sdfshangpin = new SimpleDateFormat("yyyy-MM-dd");
		Shangpin shangpin = new Shangpin();
		shangpin.setName(name == null ? "" : name);
		shangpin.setSpno(spno == null ? "" : spno);
		shangpin.setJiage(jiage == null ? (double) 0 : new Double(jiage));
		shangpin.setDazhe(dazhe == null ? 0 : new Integer(dazhe));
		shangpin.setTuijian(tuijian == null ? 0 : new Integer(tuijian));
		shangpin.setZuixin(zuixin == null ? 0 :new Integer( zuixin));
		shangpin.setHot(hot==null?0:new Integer(hot));
		shangpin.setSptype(sptype == null ? "" : sptype);
		shangpin.setSptypeid(sptypeid == null ? 0 : new Integer(sptypeid));
		shangpin.setTupian(tupian == null ? "" : tupian);
		shangpin.setJieshao(jieshao == null ? "" : jieshao);
		shangpin.setHyjia(hyjia == null ? 0 : new Integer(hyjia));
		
		shangpin.setPubtime(new Date());
		
		shangpin.setPubren(pubren == null ? "" : pubren);
		
		if(DALBase.isExist("shangpin", "where spno='"+spno.trim()+"'")){
			request.setAttribute("shangpin", shangpin);
			request.setAttribute("errormsg", String.format("<label class=\"error\">商品编号%1$s已经存在</label>",spno));
			
			List<Object> sptype_datasource = DALBase.getEntity("Spcategory", "");
			request.setAttribute("sptype_datasource", sptype_datasource);
			dispatchParams(request, response);
			try {
				request.getRequestDispatcher(errorurl).forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}
		
		DALBase.save(shangpin);
		
		try {
			response.sendRedirect(SystemParam.getSiteRoot()+"/admin/shangpinmanager.do?actiontype=get");
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
	}

	

	
	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String forwardurl = request.getParameter("forwardurl");
		String errorurl=request.getParameter("errorurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Shangpin shangpin = (Shangpin) DALBase.load(Shangpin.class,
				new Integer(id));
		if (shangpin == null)
			return;
		String name = request.getParameter("name");
		String spno = request.getParameter("spno");
		String jiage = request.getParameter("jiage");
		String dazhe = request.getParameter("dazhe");
		String tuijian = request.getParameter("tuijian");
		String zuixin = request.getParameter("zuixin");
		String hot=request.getParameter("hot");
		String sptype = request.getParameter("sptype");
		String sptypeid = request.getParameter("sptypeid");
		String tupian = request.getParameter("tupian");
		String jieshao = request.getParameter("jieshao");
		String hyjia = request.getParameter("hyjia");
		
		String pubren = request.getParameter("pubren");
		
		shangpin.setName(name);
		shangpin.setSpno(spno);
		shangpin.setJiage(jiage == null ? (double) 0 : new Double(jiage));
		shangpin.setDazhe(dazhe == null ? 0 : new Integer(dazhe));
		shangpin.setTuijian(tuijian == null ? 0 : new Integer(tuijian));
		shangpin.setZuixin(zuixin==null?0:new Integer( zuixin));
		shangpin.setHot(hot==null?0:new Integer(hot));
		shangpin.setSptype(sptype);
		shangpin.setSptypeid(sptypeid == null ? 0 : new Integer(sptypeid));
		shangpin.setTupian(tupian);
		shangpin.setJieshao(jieshao);
		shangpin.setHyjia(hyjia == null ? 0 : new Integer(hyjia));
		
		shangpin.setPubtime(new Date() );
		
		shangpin.setPubren(pubren);
		
		DALBase.update(shangpin);
		try {
			response.sendRedirect(SystemParam.getSiteRoot()+"/admin/shangpinmanager.do?actiontype=get");
		} catch (IOException e) {
			
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
			Shangpin shangpin = (Shangpin) DALBase.load("shangpin", "where id="
					+ id);
			if (shangpin != null) {
				request.setAttribute("shangpin", shangpin);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		List<Object> sptype_datasource = DALBase.getEntity("Spcategory", "where isleaf=1");
		request.setAttribute("sptype_datasource", sptype_datasource);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/shangpinadd.jsp";
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
		
		List<Object> sptype_datasource = DALBase.getEntity("Spcategory", "where isleaf=1");
		if(sptype_datasource!=null){
			Spcategory spcategory=new  Spcategory();
			spcategory.setId(-1);
			spcategory.setMingcheng("全部");
			spcategory.setIsleaf(1);
			sptype_datasource.add(spcategory);
		}
		request.setAttribute("sptype_datasource", sptype_datasource);
		String filter = "where 1=1 ";
		String spname = request.getParameter("name");
		if (spname != null)
			filter += "  and name like '%" +spname + "%'  ";
		
		String  sptype=request.getParameter("sptype");
		String  sptypeid=request.getParameter("sptypeid");
		System.out.println("sptypeid="+sptypeid);
		if(sptypeid!=null){
			if(!sptypeid.equals("-1"))
			   filter += "  and sptypeid=" +sptypeid ;
		}else
		if(sptypeid==null&&sptype_datasource.size()>0){
			
			filter+="  and sptypeid=" +((Spcategory)sptype_datasource.get(0)).getId() ;
		}
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
		List<Shangpin> listshangpin = DALBase.getPageEnity("shangpin", filter,
				pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("shangpin",
				filter == null ? "" : filter);
		request.setAttribute("listshangpin", listshangpin);
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
			forwardurl = "/admin/shangpinmanager.jsp";
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
