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
import com.itbaizhan.daowen.util.DaowenUIHelper;
import com.itbaizhan.daowen.util.ExtHelper;
import com.itbaizhan.daowen.util.HibernateSessionFactory;
import com.itbaizhan.daowen.util.PagerMetal;


public class CommentAction extends PageActionBase {
	public void OnLoad() {
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		if (actiontype == null)
			return ;
		
	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String id = request.getParameter("id");
		DALBase.delete("comment", " where id=" + id);
		binding();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String title = request.getParameter("title");
		
		String commentren = request.getParameter("currenthy");
		String commentcontent = request.getParameter("dcontent");
		String xtype = request.getParameter("type");
		String belongid = request.getParameter("belongid");
		
		Comment comment = new Comment();
		comment.setTitle(title == null ? "" : title);
		
		comment.setCommenttime(new Date());
		
		comment.setCommentren(commentren == null ? "" : commentren);
		comment.setCommentcontent(commentcontent == null ? "" : commentcontent);
		comment.setXtype(xtype == null ? "" : xtype);
		comment.setBelongid(belongid == null ? "" : belongid);
		DALBase.save(comment);

		 String forwardurl=request.getParameter("forwardurl");
			try {

				if (forwardurl!=null) {
					
					response.sendRedirect(SystemParam.getSiteRoot()+forwardurl);
				}
			
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
				" where belongid=''{0}'' and belongtable=''comment'' ",
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
			a.setBelongtable("comment");
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
		Comment comment = (Comment) DALBase
				.load(Comment.class, new Integer(id));
		if (comment == null)
			return;
		String title = request.getParameter("title");
		String commenttime = request.getParameter("commenttime");
		String commentren = request.getParameter("commentren");
		String commentcontent = request.getParameter("commentcontent");
		String xtype = request.getParameter("xtype");
		String belongid = request.getParameter("belongid");
		SimpleDateFormat sdfcomment = new SimpleDateFormat("yyyy-MM-dd");
		comment.setTitle(title);
		try {
			comment.setCommenttime(sdfcomment.parse(commenttime));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		comment.setCommentren(commentren);
		comment.setCommentcontent(commentcontent);
		comment.setXtype(xtype);
		comment.setBelongid(belongid);
		DALBase.update(comment);
		String forwardurl=request.getParameter("forwardurl");
			try {

				if (forwardurl!=null) {
					
					response.sendRedirect(SystemParam.getSiteRoot()+forwardurl);
				}
			
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
		if (id != null) {
			Comment comment = (Comment) DALBase.load("comment", "where id="
					+ id);
			if (comment != null) {
				request.setAttribute("comment", comment);
			}
			actiontype = "update";
		}
		request.setAttribute("id", id);
		request.setAttribute("actiontype", actiontype);
		try {
			request.getRequestDispatcher("commentadd.jsp").forward(request,
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
		
		
		String commentren=request.getParameter("commentren");
		
		if(commentren!=null)
			filter="  where commentren like '%" + commentren + "%'  ";
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
		List<Comment> listcomment = DALBase.getPageEnity("comment", filter,
				pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("comment",
				filter == null ? "" : filter);
		request.setAttribute("listcomment", listcomment);
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
			request.getRequestDispatcher("/admin/commentmanager.jsp").forward(
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
