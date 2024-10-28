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


public class HuiyuanAction extends PageActionBase {
	public void onLoad() {
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		if (actiontype == null)
			return ;
	
		if (actiontype.equals("login")) {
			login();
		}
		if (actiontype.equals("exit")) 
			exit();
		if (actiontype.equals("modifyPw")) {
			modifyPw();
		}
		if (actiontype.equals("chongzhi")){
			chongzhi();
		 
		}
		
	}

	private void chongzhi() {
		String jine = request.getParameter("jine");
		String forwardurl = request.getParameter("forwardurl");

		String id = request.getParameter("id");
		if (id == null || id == "")
			return;
		Huiyuan huiyuan = (Huiyuan) DALBase
				.load(Huiyuan.class, new Integer(id));
		if (huiyuan != null) {
			huiyuan.setYue(huiyuan.getYue() + Float.parseFloat(jine));
			DALBase.update(huiyuan);
			request.getSession().setAttribute("huiyuan", huiyuan);
			try {
				if (forwardurl != null)
					response.sendRedirect(SystemParam.getSiteRoot()
							+ forwardurl);
			} catch (IOException e) {

				e.printStackTrace();
			}
		}

	}

	private void modifyPw() {

		String password1=request.getParameter("password1");
		String  forwardurl=request.getParameter("forwardurl");
		String repassword1=request.getParameter("repassword1");
		String repassword2=request.getParameter("repassword2");
		String id = request.getParameter("id");
		if (id == null||id=="")
			return;
		Huiyuan huiyuan = (Huiyuan) DALBase.load(Huiyuan.class, new Integer(id));
		if(huiyuan!=null)
		{
			huiyuan.setPassword(repassword1);
			DALBase.update(huiyuan);
			request.getSession().setAttribute("huiyuan", huiyuan);
			try {
				response.sendRedirect(SystemParam.getSiteRoot()+forwardurl);
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}
		

	}

	private void exit() {

		if (request.getSession().getAttribute("huiyuan") != null) {

			System.out.println("系统退出");
			request.getSession().removeAttribute("huiyuan");

		}

	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String id = request.getParameter("id");
		DALBase.delete("huiyuan", " where id=" + id);
		binding();
	}

	private void login() {

		String usertype = request.getParameter("usertype");

		if (usertype != null && usertype.equals("0")) {
			huiyuanLogin(request, response);
		}

	}

	/***
     * **/
	private void huiyuanLogin(HttpServletRequest request,
			HttpServletResponse response) {

		String accountname = request.getParameter("accountname");
		String password = request.getParameter("password");

		String filter = MessageFormat.format(
				"where accountname=''{0}'' and password=''{1}''", accountname,
				password);

		Huiyuan huiyuan = (Huiyuan) DALBase.load("huiyuan", filter);
		String errorurl=request.getParameter("errorurl");
		String forwardurl=request.getParameter("forwardurl");

		if (huiyuan != null && huiyuan.getPassword().equals(password)) {

			try {

				huiyuan.setLogtimes(huiyuan.getLogtimes() + 1);
				DALBase.update(huiyuan);
				request.getSession().setAttribute("huiyuan", huiyuan);
				if (forwardurl != "")
					response.sendRedirect(SystemParam.getSiteRoot()
							+ forwardurl);

				else {

					response.sendRedirect(SystemParam.getSiteRoot() + "/e/huiyuan/accounintfo.jsp");
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {

			dispatchParams(request, response);
			request.setAttribute("errormsg", "<label class='error'>系统账户和密码不匹配<label>");
			try {

				request.getRequestDispatcher(errorurl).forward(request, response);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String accountname = request.getParameter("accountname");
		String password = request.getParameter("password");
		String xtype = request.getParameter("xtype");

		String email = request.getParameter("email");

		if (DALBase.isExist("huiyuan", "where accountname='" + accountname
				+ "'")) {
			try {
				request.setAttribute("errormsg",
						"<label class='error'>用户名已经存在</label>");
				dispatchParams(request, response);
				request.getRequestDispatcher("/e/register.jsp").forward(
						request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}

		Huiyuan huiyuan = new Huiyuan();
		huiyuan.setAccountname(accountname == null ? "" : accountname);
		huiyuan.setPassword(password == null ? "" : password);
		huiyuan.setXtype("");
		huiyuan.setNickname(accountname);

		huiyuan.setRegdate(new Date());

		huiyuan.setLogtimes(0);
		huiyuan.setTouxiang(SystemParam.getSiteRoot()
				+ "/upload/default_tou.gif");
		huiyuan.setEmail(email == null ? "" : email);
		huiyuan.setMobile("");
		huiyuan.setSex("男");
		huiyuan.setAddress("");
		huiyuan.setJibie("初级");
		huiyuan.setName("");
		huiyuan.setZhiye("");
		huiyuan.setAihao("");
		huiyuan.setJifen(10);
		huiyuan.setStatus(1);
		huiyuan.setYue(0);
		huiyuan.setXtype("普通会员");
		DALBase.save(huiyuan);
		try {
			response.sendRedirect("../e/regresult.jsp");
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
				" where belongid=''{0}'' and belongtable=''huiyuan'' ",
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
			a.setBelongtable("huiyuan");
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
		Huiyuan huiyuan = (Huiyuan) DALBase
				.load(Huiyuan.class, new Integer(id));
		if (huiyuan == null)
			return;
		String accountname = request.getParameter("accountname");
		
		String nickname = request.getParameter("nickname");
		String forwardurl = request.getParameter("forwardurl");
	
		String touxiang = request.getParameter("touxiang");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String sex = request.getParameter("sex");
		String address = request.getParameter("address");
		String jibie = request.getParameter("jibie");
		String name = request.getParameter("name");
		String zhiye = request.getParameter("zhiye");
		String aihao = request.getParameter("aihao");
		String status = request.getParameter("status");
		SimpleDateFormat sdfhuiyuan = new SimpleDateFormat("yyyy-MM-dd");
		huiyuan.setAccountname(accountname);

		huiyuan.setNickname(nickname);

		huiyuan.setTouxiang(touxiang);
		huiyuan.setEmail(email);
		huiyuan.setMobile(mobile);
		huiyuan.setSex(sex);
		huiyuan.setAddress(address);
		huiyuan.setJibie(jibie);
		huiyuan.setName(name);
		huiyuan.setZhiye(zhiye);
		huiyuan.setAihao(aihao);

		DALBase.update(huiyuan);
		request.getSession().setAttribute("huiyuan", huiyuan);
		try {
		   if(forwardurl!=null)
			  response.sendRedirect(SystemParam.getSiteRoot()+forwardurl);
		   else
			  response.sendRedirect(SystemParam.getSiteRoot()+"/e/huiyuan/modifyinfores.jsp");
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
			Huiyuan huiyuan = (Huiyuan) DALBase.load("huiyuan", "where id="
					+ id);
			if (huiyuan != null) {
				request.setAttribute("huiyuan", huiyuan);
			}
			actiontype = "update";
		}
		request.setAttribute("id", id);
		request.setAttribute("actiontype", actiontype);
		try {
			request.getRequestDispatcher("huiyuanadd.jsp").forward(request,
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
		int pageindex = 1;
		int pagesize = 10;
		// 获取当前分页

		String accountname = request.getParameter("accountname");

		if (accountname != null)
			filter = "  where accountname like '%" + accountname + "%'  ";

		String currentpageindex = request.getParameter("currentpageindex");
		// 当前页面尺寸
		String currentpagesize = request.getParameter("pagesize");
		// 设置当前页
		if (currentpageindex != null)
			pageindex = new Integer(currentpageindex);
		// 设置当前页尺寸
		if (currentpagesize != null)
			pagesize = new Integer(currentpagesize);
		List<Huiyuan> listhuiyuan = DALBase.getPageEnity("huiyuan", filter,
				pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("huiyuan",
				filter == null ? "" : filter);
		request.setAttribute("listhuiyuan", listhuiyuan);
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
			request.getRequestDispatcher("/admin/huiyuanmanager.jsp").forward(
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
