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
 *         站点导航控制
 * 
 */
public class SitenavAction extends PageActionBase {
	@Override
	public void onLoad() {
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		if (actiontype == null)
			return;
		if(actiontype.equals("saveByLanmuguide")){
			saveByLanmuguide();
		}
		if(actiontype.equals("saveBySpc")){
			saveBySpc();
		}
		
	}

	private void saveByLanmuguide() {
		
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String lanmuid = request.getParameter("lanmuid");
	  
		Lanmu  lanmu=(Lanmu)DALBase.load("lanmu", "where id="+lanmuid);
		if(lanmu==null){
			
			return;
		}
		
		Sitenav sitenav = new Sitenav();
		sitenav.setTitle(lanmu.getTitle());
		sitenav.setHref(MessageFormat.format("/e/lanmuinfo.jsp?lanmuid={0}",lanmu.getId()));
		
		sitenav.setSindex(1);
		
		DALBase.save(sitenav);
		
		if (forwardurl == null) {
			forwardurl = "/admin/sitenavmanager.do?actiontype=get";
		}
		try {
			response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
    private void saveBySpc() {
		
    	String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String spcid=request.getParameter("spcid");
		
		if(spcid!=null)
		{
			Spcategory temspc=(Spcategory)DALBase.load("spcategory", "where id="+spcid);
			if(temspc!=null)
			{
				Sitenav sitenav = new Sitenav();
				sitenav.setHref(MessageFormat.format("/e/shangpinlist.jsp?spcid={0}",temspc.getId()));
				sitenav.setSindex(1);
				sitenav.setTitle(temspc.getMingcheng());
				// 产生验证
				Boolean validateresult = saveValidate("where title='" + temspc.getMingcheng() + "'");
				if (validateresult) {
					try {
						request.setAttribute("errormsg",
								"<label class='error'>已存在的导航</label>");
						request.setAttribute("sitenav", sitenav);
						request.setAttribute("actiontype", "save");
						request.getRequestDispatcher(errorurl).forward(request,
								response);
					} catch (Exception e) {
						e.printStackTrace();
					}
					return;
				}
				
				
				DALBase.save(sitenav);
			}
		}
		
		if (forwardurl == null) {
			forwardurl = "/admin/sitenavmanager.do?actiontype=get";
		}
		try {
			response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String id = request.getParameter("id");
		DALBase.delete("sitenav", " where id=" + id);
		binding();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String title = request.getParameter("title");
		String href = request.getParameter("href");
		String sindex = request.getParameter("sindex");
		SimpleDateFormat sdfsitenav = new SimpleDateFormat("yyyy-MM-dd");
		Sitenav sitenav = new Sitenav();
		sitenav.setTitle(title == null ? "" : title);
		sitenav.setHref(href == null ? "" : href);
		sitenav.setSindex(sindex == null ? 0 : new Integer(sindex));
		// 产生验证
		Boolean validateresult = saveValidate("where title='" + title + "'");
		if (validateresult) {
			try {
				request.setAttribute("errormsg",
						"<label class='error'>已存在的导航</label>");
				request.setAttribute("sitenav", sitenav);
				request.setAttribute("actiontype", "save");
				request.getRequestDispatcher(errorurl).forward(request,
						response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return;
		}
		DALBase.save(sitenav);
		// 保存附件
		
		if (forwardurl == null) {
			forwardurl = "/admin/sitenavmanager.do?actiontype=get";
		}
		try {
			response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 新增验证
	private boolean saveValidate(String filter) {
		return DALBase.isExist("sitenav", filter);
	}

	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Sitenav sitenav = (Sitenav) DALBase.load(Sitenav.class, new Integer(id));
		if (sitenav == null)
			return;
		String title = request.getParameter("title");
		String href = request.getParameter("href");
		String sindex = request.getParameter("sindex");
		SimpleDateFormat sdfsitenav = new SimpleDateFormat("yyyy-MM-dd");
		sitenav.setTitle(title);
		sitenav.setHref(href);
		sitenav.setSindex(sindex == null ? 0 : new Integer(sindex));
		DALBase.update(sitenav);
	
		if (forwardurl == null) {
			forwardurl = "/admin/sitenavmanager.do?actiontype=get";
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
			Sitenav sitenav = (Sitenav) DALBase.load("sitenav", "where id="
					+ id);
			if (sitenav != null) {
				request.setAttribute("sitenav", sitenav);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/sitenavadd.jsp";
			System.out.println("forwardurl=" + forwardurl);
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
		String title = request.getParameter("title");
		if (title != null)
			filter += "  and title like '%" + title + "%'  ";
		
		filter+=" order by sindex asc";
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
		List<Sitenav> listsitenav = DALBase.getPageEnity("sitenav", filter,
				pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("sitenav",
				filter == null ? "" : filter);
		request.setAttribute("listsitenav", listsitenav);
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
			forwardurl = "/admin/sitenavmanager.jsp";
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
