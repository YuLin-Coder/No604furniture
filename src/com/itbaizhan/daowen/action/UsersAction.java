package com.itbaizhan.daowen.action;

import java.io.IOException;
import java.text.MessageFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;



import com.itbaizhan.daowen.bll.SystemParam;
import com.itbaizhan.daowen.dal.DALBase;
import com.itbaizhan.daowen.entity.Attachement;
import com.itbaizhan.daowen.entity.Users;
import com.itbaizhan.daowen.util.PagerMetal;

/*******************************************************************************
 * 
 * 
 * 
 */
public class UsersAction extends PageActionBase {
	public void onLoad() {
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		if (actiontype == null)
			return ;
		
		// 登录
		if (actiontype.equals("login")) {
			login();
		}
		
		if (actiontype.equals("exit")) {
			exit();
		}
		
		
	}

	private void exit() {

		Object u = request.getSession().getAttribute("adminuser");

		if (u != null)
			request.getSession().removeAttribute("adminuser");

		try {
			request.getRequestDispatcher("/admin/login.jsp").forward(request,
					response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private void login() {


		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String usertype = request.getParameter("usertype");

		String action = request.getParameter("action");
		
		String validcode=(String)request.getSession().getAttribute("validcode");
		
		String inputvalidcode=request.getParameter("validcode");
		
		
//		if(validcode!=null&&!validcode.equals(inputvalidcode)){
//			
//			System.out.println("系统验证错误");
//			request.setAttribute("errmsg", "<img src=\"images/icon_wrong.png\"/>系统验证码错误");
//			
//			// 分发请求参数
//			dispatchParams(request, response);	
//	        try {
//				request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
//			} catch (ServletException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//					
//			return;
//			
//
//			
//		}
//		
		System.out.println("验证码="+validcode);
        
		if (usertype != null && usertype.equals("0")) {
			Users u = (Users) DALBase.load("users", " where username='"
					+ username + "' and password='" + password + "'");

			if (u != null) {

				HttpSession session = request.getSession();
				session.setAttribute("adminuser", u);

				try {
					response.sendRedirect(SystemParam.getSiteRoot()
							+ "/admin/index.jsp");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			} else {

				// 分发
				dispatchParams(request, response);
				request.setAttribute("errmsg",MessageFormat.format("<img src=\"{0}/admin/images/icon_wrong.png\"/>用户与密码不匹配",SystemParam.getSiteRoot()));
				
				System.out.println("系统用户登录失败");
				try {
					request.getRequestDispatcher( "/admin/login.jsp").forward(request, response);
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
		}
		if (usertype.equals("1")) {

			

		}

	}

	/***************************************************************************
	 * *****************信息注销监听支持*****************************
	 **************************************************************************/
	public void delete() {
		String id = request.getParameter("id");
		DALBase.delete("users", " where id=" + id);
		binding();
	}

	/***************************************************************************
	 * ***************保存动作监听支持******************************
	 **************************************************************************/
	public void save() {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String rolename = request.getParameter("rolename");
		String creator = request.getParameter("creator");
		String createtime = request.getParameter("createtime");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");

		String realname = request.getParameter("realname");
		String nickname = request.getParameter("nickname");
		String sex = request.getParameter("sex");
		String xiangpian = request.getParameter("xiangpian");
		SimpleDateFormat sdfusers = new SimpleDateFormat("yyyy-MM-dd");
		Users users = new Users();
		users.setUsername(username == null ? "" : username);
		users.setPassword(password == null ? "" : password);
		
		users.setCreator(creator == null ? "" : creator);
		
	    users.setCreatetime(new Date());
		
		users.setEmail(email == null ? "" : email);
		users.setTel(tel == null ? "" : tel);
		users.setLogtimes(0);
		users.setRealname(realname == null ? "" : realname);
		users.setNickname(nickname == null ? "" : nickname);
		users.setSex(sex == null ? "" : sex);
		users.setXiangpian(xiangpian == null ? "" : xiangpian);
		DALBase.save(users);
		
		// 绑定数据
		binding();
	}



	/***************************************************************************
	 * **********************更新内部支持*********************
	 **************************************************************************/
	public void update() {
		String id = request.getParameter("id");
		if (id == null)
			return;
		Users users = (Users) DALBase.load(Users.class, new Integer(id));
		if (users == null)
			return;
		String username = request.getParameter("username");
		
		String creator = request.getParameter("creator");
		
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		
		String realname = request.getParameter("realname");
		String nickname = request.getParameter("nickname");
		String sex = request.getParameter("sex");
		String xiangpian = request.getParameter("xiangpian");
		SimpleDateFormat sdfusers = new SimpleDateFormat("yyyy-MM-dd");
		users.setUsername(username);
		
		users.setCreator(creator);
		
		users.setEmail(email);
		users.setTel(tel);
		users.setCreatetime(new Date());
		users.setRealname(realname);
		users.setNickname(nickname);
		users.setSex(sex);
		users.setXiangpian(xiangpian);
		DALBase.update(users);
	
		binding();
	}

	/***************************************************************************
	 * **********************加载内部支持*********************
	 **************************************************************************/
	public void load() {
		//
		String id = request.getParameter("id");
		String actiontype = "save";
		if (id != null) {
			Users users = (Users) DALBase.load("users", "where id=" + id);
			if (users != null) {
				request.setAttribute("users", users);
			}
			actiontype = "update";
		}
		request.setAttribute("id", id);
		request.setAttribute("actiontype", actiontype);
		
		try {
			request.getRequestDispatcher("usersadd.jsp").forward(request,
					response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/***************************************************************************
	 * **********************数据绑定内部支持*********************
	 **************************************************************************/
	public void binding() {
		String filter = "";
		String username = request.getParameter("username");
		if (username != null)
			filter = "  where username like '%" + username + "%'  ";
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
		List<Users> listusers = DALBase.getPageEnity("users", filter,
				pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("users", filter == null ? ""
				: filter);
		request.setAttribute("listusers", listusers);
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
			request.getRequestDispatcher("/admin/usersmanager.jsp").forward(
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
