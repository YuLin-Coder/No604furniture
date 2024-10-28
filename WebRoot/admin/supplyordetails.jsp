<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%@ page import="com.itbaizhan.daowen.bll.*"%>
<%@ page import="com.itbaizhan.daowen.entity.*" %>
<%@page import="com.itbaizhan.daowen.dal.DALBase"%>
<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
    if( id!=null)
    {
      Supplyor temobjsupplyor=(Supplyor)DALBase.load("supplyor"," where id="+ id);
      request.setAttribute("supplyor",temobjsupplyor);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>供货商信息查看</title>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
	 	 <div class="search-title">
<h2>
	                      查看供货商
	                </h2>
	                <div class="description">
	                </div>
              </div>
				        <table cellpadding="0" cellspacing="1" class="grid" width="100%" >
											   <tr>
											   <td width="10%" align="right" >供应商名称:</td>
											   <td>
												   ${requestScope.supplyor.sname}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >联系电话:</td>
											   <td>
												   ${requestScope.supplyor.tel}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >联系人:</td>
											   <td>
												   ${requestScope.supplyor.lxren}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >邮箱:</td>
											   <td>
												   ${requestScope.supplyor.email}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >地址:</td>
											   <td>
												   ${requestScope.supplyor.address}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >传真:</td>
											   <td>
												   ${requestScope.supplyor.fax}
												</td>
											   </tr>
          <tr>
					                      <td align="right" >备注:</td>
					                       <td colspan="3">
											 ${requestScope.supplyor.des}
											   </td>
											  </tr>
				        </table>
</body>
</html>
