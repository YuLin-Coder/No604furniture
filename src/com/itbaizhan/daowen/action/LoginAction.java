/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.itbaizhan.daowen.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.itbaizhan.daowen.util.HibernateSessionFactory;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SQLQuery;


public class LoginAction extends Action {
	/*
	 * Generated Methods
	 */

	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		    try {
		    	response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
		    	List userlist=null;
		    	Session  s=HibernateSessionFactory.getSession();
		    	Transaction t=s.beginTransaction();
		    	String username=request.getParameter("username");
		    	String password=request.getParameter("password");
		    	String action=request.getParameter("action");
		    	System.out.println("action="+action+"username="+username+"password="+password);
		    	SQLQuery query=s.createSQLQuery("select * from [users] where username='"+username+"'");
			    userlist=query.list();
			    String s1="";
			    if(!userlist.isEmpty())
			    	s1="res=true";
		    	 
			    else
			    	s1="res=false";
			      System.out.println("json="+s1);
			      response.getWriter().write(s1);
								
			} catch (IOException e) {
				
				e.printStackTrace();
			} 
		  
		return null;
	}
}