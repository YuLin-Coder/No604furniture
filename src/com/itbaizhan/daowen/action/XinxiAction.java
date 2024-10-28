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

/**************************
 * 
 * @author daowen date:2013-12-05 控制
 * 
 */
public class XinxiAction extends PageActionBase {
	public void onLoad() {
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		if (actiontype == null)
			return ;
		
		// 获取combox
		if (actiontype.equals("agree")) {
			agree();
		}
		if (actiontype.equals("against")) {
			against();
		}
		
	}

	private void agree() {
		  String id=request.getParameter("id");
		  if (id == null)
				return;
			Xinxi xinxi = (Xinxi) DALBase.load(Xinxi.class, new Integer(id));
			if (xinxi == null)
				return;
		   xinxi.setAgreecount(xinxi.getAgreecount()+1);
		   DALBase.update(xinxi);
		   try {
			response.getWriter().write(new Integer(xinxi.getAgreecount()).toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
		
	}
	

	private void against() {
		  String id=request.getParameter("id");
		  if (id == null)
				return;
			Xinxi xinxi = (Xinxi) DALBase.load(Xinxi.class, new Integer(id));
			if (xinxi == null)
				return;
		   xinxi.setAgainstcount(xinxi.getAgainstcount()+1);
		   DALBase.update(xinxi);
		   try {
			response.getWriter().write(new Integer(xinxi.getAgainstcount()).toString());
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
		DALBase.delete("xinxi", " where id=" + id);
		binding();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String title = request.getParameter("title");
		String pubren = request.getParameter("pubren");
		String pubtime = request.getParameter("pubtime");
		String laiyuan=request.getParameter("laiyuan");
		String dcontent = request.getParameter("dcontent");
		String tupian2 = request.getParameter("tupian2");
		String lanmuid = request.getParameter("lanmuid");
		String lanmuming = request.getParameter("lanmuming");
		String  tuijian=request.getParameter("tuijian");
		String  hot=request.getParameter("hot");
		String zuixin=request.getParameter("zuixin");
		String  zhaiyao=request.getParameter("zhaiyao");
		String style=request.getParameter("style");
		SimpleDateFormat sdfxinxi = new SimpleDateFormat("yyyy-MM-dd");
		
		Xinxi xinxi = new Xinxi();
		xinxi.setTitle(title == null ? "" : title);
		xinxi.setPubren(pubren == null ? "" : pubren);
		
		xinxi.setPubtime(new Date());
		xinxi.setHot(hot!=null?1:0);
		xinxi.setTuijian(tuijian!=null?1:0);
		xinxi.setZuixin(zuixin!=null?1:0);
		xinxi.setClickcount(0);
		xinxi.setZhaiyao(zhaiyao==null?"":zhaiyao);
		xinxi.setDcontent(dcontent == null ? "" : dcontent);
		xinxi.setTupian2(tupian2 == null ? "" : tupian2);
		xinxi.setAgainstcount(0);
		xinxi.setAgreecount(0);
		xinxi.setLanmuid(new Integer(lanmuid));
		xinxi.setLanmuming(lanmuming == null ? "" : lanmuming);
		DALBase.save(xinxi);
		try {
			if(style!=null&&style.equals("admin"))
			    response.sendRedirect("xinximanager.do?actiontype=get&seedid=201&lanmuid="+xinxi.getLanmuid());
			if(style!=null&&style.equals("huiyuan"))
			    response.sendRedirect("../e/myxinximanager.jsp?seedid=m2");
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
	}

	/******************************************************
	 *********************** 内部附件支持*********************
	 *******************************************************/
	public void attachements(HttpServletRequest request,
			HttpServletResponse response, String belongid) {
		DALBase.delete("attachement", MessageFormat.format(
				" where belongid=''{0}'' and belongtable=''xinxi'' ", belongid));
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
			a.setBelongtable("xinxi");
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
		Xinxi xinxi = (Xinxi) DALBase.load(Xinxi.class, new Integer(id));
		if (xinxi == null)
			return;
		String title = request.getParameter("title");
		String pubren = request.getParameter("pubren");
		String laiyuan=request.getParameter("laiyuan");
		String clickcount = request.getParameter("clickcount");
		String dcontent = request.getParameter("dcontent");
		String tupian2 = request.getParameter("tupian2");
		String lanmuid = request.getParameter("lanmuid");
		String lanmuming = request.getParameter("lanmuming");
		String  tuijian=request.getParameter("tuijian");
		String  hot=request.getParameter("hot");
		String zuixin=request.getParameter("zuixin");
		String zhaiyao=request.getParameter("zhaiyao");
		String style=request.getParameter("style");
		SimpleDateFormat sdfxinxi = new SimpleDateFormat("yyyy-MM-dd");
		xinxi.setZhaiyao(zhaiyao);
		xinxi.setTitle(title);
		xinxi.setPubren(pubren);
	    xinxi.setLaiyuan(laiyuan);
		xinxi.setDcontent(dcontent);
		xinxi.setHot(hot!=null?1:0);
		xinxi.setTuijian(tuijian!=null?1:0);
		xinxi.setZuixin(zuixin!=null?1:0);
		xinxi.setTupian2(tupian2);
		xinxi.setLanmuid(new Integer(lanmuid));
		xinxi.setLanmuming(lanmuming);
		DALBase.update(xinxi);
		//attachements(request, response, new Integer(xinxi.getId()).toString());
		//binding(request, response);
		try {
			if(style!=null&&style.equals("admin"))
			    response.sendRedirect("xinximanager.do?actiontype=get&seedid=201&lanmuid="+xinxi.getLanmuid());
			if(style!=null&&style.equals("huiyuan"))
			    response.sendRedirect("../e/myxinximanager.jsp?seedid=m2");
			
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
		String style=request.getParameter("style");
		if (id != null) {
			Xinxi xinxi = (Xinxi) DALBase.load("xinxi", "where id=" + id);
			if (xinxi != null) {
				request.setAttribute("xinxi", xinxi);
			}
			actiontype = "update";
		}
		request.setAttribute("id", id);
		request.setAttribute("actiontype", actiontype);
		try {
			
			request.getRequestDispatcher("xinxiadd.jsp").forward(request,response);
			
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
		int pageindex = 1;
		int pagesize = 10;
		String title=request.getParameter("title");
		
		String lanmuid=request.getParameter("lanmuid");
		
		// 获取当前分页
		if(title!=null)
		   filter="where title like '%"+title+"%'";
		else {
			
			filter=" where 1=1 ";
		}
		if(lanmuid!=null&&lanmuid!="")
			filter+=" and lanmuid="+lanmuid;
		System.out.println("filter="+filter);
		
		String currentpageindex = request.getParameter("currentpageindex");
		// 当前页面尺寸
		String currentpagesize = request.getParameter("pagesize");
		// 设置当前页
		if (currentpageindex != null)
			pageindex = new Integer(currentpageindex);
		// 设置当前页尺寸
		if (currentpagesize != null)
			pagesize = new Integer(currentpagesize);
		List<Xinxi> listxinxi = DALBase.getPageEnity("xinxi", filter,
				pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("xinxi", filter == null ? ""
				: filter);
		request.setAttribute("listxinxi", listxinxi);
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
			request.getRequestDispatcher("/admin/xinximanager.jsp").forward(
					request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
