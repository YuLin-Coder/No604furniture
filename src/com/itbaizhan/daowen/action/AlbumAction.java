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
 *         相册控制
 * 
 */
public class AlbumAction extends PageActionBase {
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
		DALBase.delete("album", " where id=" + id);
		DALBase.delete("albumitem","where albumid='"+id+"'");
		binding();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String name = request.getParameter("name");
		String des = request.getParameter("des");
		String xtype = request.getParameter("xtype");
		String privilege = request.getParameter("privilege");
		String pubren = request.getParameter("pubren");
		SimpleDateFormat sdfalbum = new SimpleDateFormat("yyyy-MM-dd");
		Album album = new Album();
		album.setName(name == null ? "" : name);
		album.setDes(des == null ? "" : des);
		album.setXtype(xtype == null ? "" : xtype);
		album.setPrivilege(privilege == null ? "" : privilege);
		album.setPubren(pubren == null ? "" : pubren);
		album.setPubtime(new Date());
		
		album.setTupian(SystemParam.getSiteRoot()+"/upload/pic-none.png");
		DALBase.save(album);
		
		if (forwardurl == null) {
			forwardurl = "/admin/albummanager.do?actiontype=get";
		}
		try {
			response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/******************************************************
	 *********************** 内部附件支持*********************
	 *******************************************************/
	public void attachments(String belongid) {
		DALBase.delete("attachement", MessageFormat.format(
				" where belongid=''{0}'' and belongtable=''album'' ", belongid));
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
			a.setBelongtable("album");
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
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Album album = (Album) DALBase.load(Album.class, new Integer(id));
		if (album == null)
			return;
		String name = request.getParameter("name");
		String des = request.getParameter("des");
		String xtype = request.getParameter("xtype");
		String privilege = request.getParameter("privilege");
		String pubren = request.getParameter("pubren");
		String pubtime = request.getParameter("pubtime");
		String tupian = request.getParameter("tupian");
		SimpleDateFormat sdfalbum = new SimpleDateFormat("yyyy-MM-dd");
		album.setName(name);
		album.setDes(des);
		album.setXtype(xtype);
		album.setPrivilege(privilege);
		album.setPubren(pubren);
		if (pubtime != null) {
			try {
				album.setPubtime(sdfalbum.parse(pubtime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		album.setTupian(tupian);
		DALBase.update(album);
		// attachments(new Integer(album.getId()).toString());
		if (forwardurl == null) {
			forwardurl = "/admin/albummanager.do?actiontype=get";
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
		String  filter=" where pubren='ALL' ";
		if (id != null) {
			Album album = (Album) DALBase.load("album", "where id=" + id);
			if (album != null) {
				request.setAttribute("album", album);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		String pubren=request.getParameter("pubren");
		if(pubren!=null)
			filter+=" and pubren='"+pubren+"'";
		request.setAttribute("actiontype", actiontype);
		List<Object> xtype_datasource = DALBase.getEntity("albumtype", "");
		request.setAttribute("xtype_datasource", xtype_datasource);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/albumadd.jsp";
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
		String name = request.getParameter("name");
		if (name != null)
			filter += "  and name like '%" + name + "%'  ";
		
		String pubren =request.getParameter("pubren");
		
		if(pubren!=null)
			filter+=" and pubren='"+pubren+"'";
		
		
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
		List<Album> listalbum = DALBase.getPageEnity("album", filter,
				pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("album", filter == null ? ""
				: filter);
		request.setAttribute("listalbum", listalbum);
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
			forwardurl = "/admin/albummanager.jsp";
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
