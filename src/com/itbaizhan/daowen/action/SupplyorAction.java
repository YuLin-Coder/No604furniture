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
 * 供货商控制
 *
 */
public class SupplyorAction extends  PageActionBase{
       @Override
	public void  onLoad() {
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		if (actiontype == null)
			return ;
	}
    /********************************************************
    ******************信息注销监听支持*****************************
    *********************************************************/
	public void delete() {
		String id=request.getParameter("id");
		DALBase.delete("supplyor", " where id="+id);
		binding();
	}
    /*************************************************************
     ****************保存动作监听支持******************************
    **************************************************************/
	public void save() {
			String forwardurl=request.getParameter("forwardurl");
			//验证错误url
			String errorurl=request.getParameter("errorurl");
				        String sname=request.getParameter("sname");
				        String tel=request.getParameter("tel");
				        String lxren=request.getParameter("lxren");
				        String email=request.getParameter("email");
				        String address=request.getParameter("address");
				        String fax=request.getParameter("fax");
				        String des=request.getParameter("des");
		     SimpleDateFormat  sdfsupplyor=new SimpleDateFormat("yyyy-MM-dd");
             Supplyor supplyor=new Supplyor();
				        supplyor.setSname(sname==null?"":sname);
				        supplyor.setTel(tel==null?"":tel);
				        supplyor.setLxren(lxren==null?"":lxren);
				        supplyor.setEmail(email==null?"":email);
				        supplyor.setAddress(address==null?"":address);
				        supplyor.setFax(fax==null?"":fax);
				        supplyor.setDes(des==null?"":des);
		    //产生验证
		     Boolean validateresult=saveValidate( "where sname='"+sname+"'");
		     if(validateresult){
			 try {
					request.setAttribute("errormsg","<label class='error'>已存在的供应商</label>");
					request.setAttribute("supplyor", supplyor);
					request.setAttribute("actiontype", "save");
					request.getRequestDispatcher(errorurl).forward(request, response);
				} catch (Exception e) {
						e.printStackTrace();
				}
				return;
			}
		  DALBase.save(supplyor);
		    //保存附件
		 //   attachments(request,response,new Integer(supplyor.getId()).toString());
		 if(forwardurl==null){
			forwardurl="/admin/supplyormanager.do?actiontype=get";
		}
		try {
			response.sendRedirect(SystemParam.getSiteRoot()+forwardurl);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	   //新增验证
	   private  boolean  saveValidate(String filter){
		   return	DALBase.isExist("supplyor", filter);
	   }
	/******************************************************
	***********************内部附件支持*********************
	*******************************************************/
	public void attachments(String belongid) {
		DALBase.delete("attachement", MessageFormat.format(
				" where belongid=''{0}'' and belongtable=''supplyor'' ", belongid));
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
			a.setBelongtable("supplyor");
			a.setUrl(SystemParam.getSiteRoot()+"/upload/temp/" + a.getFilename());
			a.setTitle(a.getFilename());
			DALBase.save(a);
		}
	}
   	/******************************************************
	***********************更新内部支持*********************
	*******************************************************/
	public void update() {
           String forwardurl=request.getParameter("forwardurl");
		   String id=request.getParameter("id");
		   if(id==null)
			   return;
		   Supplyor  supplyor=(Supplyor)DALBase.load(Supplyor.class,new Integer(id));
		    if(supplyor==null)
			   return;
				       String sname=request.getParameter("sname");
				       String tel=request.getParameter("tel");
				       String lxren=request.getParameter("lxren");
				       String email=request.getParameter("email");
				       String address=request.getParameter("address");
				       String fax=request.getParameter("fax");
				       String des=request.getParameter("des");
			  SimpleDateFormat  sdfsupplyor=new SimpleDateFormat("yyyy-MM-dd");
					        supplyor.setSname(sname);
					        supplyor.setTel(tel);
					        supplyor.setLxren(lxren);
					        supplyor.setEmail(email);
					        supplyor.setAddress(address);
					        supplyor.setFax(fax);
					        supplyor.setDes(des);
		    DALBase.update(supplyor);
		   // attachments(new Integer(supplyor.getId()).toString());
			 if(forwardurl==null){
				forwardurl="/admin/supplyormanager.do?actiontype=get";
			}
			try {
				response.sendRedirect(SystemParam.getSiteRoot()+forwardurl);
			} catch (Exception e) {
				e.printStackTrace();
			} 
	}
   	/******************************************************
	***********************加载内部支持*********************
	*******************************************************/
	public void load() {
	        //
		    String id=request.getParameter("id");
		    String actiontype="save";
		    dispatchParams(request, response);
			if(id!=null) 
			{
			   Supplyor  supplyor=(Supplyor)DALBase.load("supplyor","where id="+id);
				if(supplyor!=null) 
				{
				    request.setAttribute("supplyor", supplyor);
				}
				actiontype="update";
				request.setAttribute("id", id);
			}
		    request.setAttribute("actiontype", actiontype);
		    String forwardurl=request.getParameter("forwardurl");
		    System.out.println("forwardurl="+forwardurl);
		    if(forwardurl==null){
		     	forwardurl="/admin/supplyoradd.jsp";
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
	***********************数据绑定内部支持*********************
	*******************************************************/
	public void   binding(){
		 String filter="where 1=1 ";
String sname=request.getParameter("sname");
	              if(sname!=null)
	                     filter+="  and sname like '%"+sname+"%'  ";
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
		List<Supplyor> listsupplyor = DALBase.getPageEnity("supplyor", filter,
				pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("supplyor",
				filter == null ? "" : filter);
		request.setAttribute("listsupplyor", listsupplyor);
		PagerMetal pm = new PagerMetal(recordscount);
		//设置尺寸
		pm.setPagesize(pagesize);
		//设置当前显示页
		pm.setCurpageindex(pageindex);
		// 设置分页信息
		request.setAttribute("pagermetal", pm);
		//分发请求参数
		dispatchParams(request, response);
		String forwardurl=request.getParameter("forwardurl");
		System.out.println("forwardurl="+forwardurl);
		if(forwardurl==null){
			forwardurl="/admin/supplyormanager.jsp";
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
