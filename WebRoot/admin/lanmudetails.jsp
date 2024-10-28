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
    String command="add";
    if( id!=null)
    {
      command="update";
      Lanmu temobjlanmu=(Lanmu)DALBase.load("lanmu"," where id="+ id);
      request.setAttribute("lanmu",temobjlanmu);
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  <title>栏目信息查看</title>
   	 <link href="<%=SystemParam.getSiteRoot() %>/admin/css/common.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.9.0.js"></script>
</head>
<body style="padding:10px">
		 <%@ include file="head.jsp"%>
        <%@ include file="menu.jsp"%>
          <div id="main-content" class="main-content">
            <div class="body">
             <div class="search-title">
	                <h2>
	                       栏目管理-> <a href="<%=SystemParam.getSiteRoot() %>/admin/lanmumanager.do?actiontype=load&seedid=102">查看栏目</a>
	                </h2>
                <div class="description">
                </div>
              </div>
				        <table cellpadding="0" cellspacing="1" class="grid" width="100%" >
											   <tr>
											   <td align="right" class="title">栏目名:</td>
											   <td>
												   ${requestScope.lanmu.title}
												</td>
											   </tr>
											   <tr>
											   <td align="right" class="title">创建人:</td>
											   <td>
												   ${requestScope.lanmu.creator}
												</td>
											   </tr>
											   <tr>
											   <td align="right" class="title">创建时间:</td>
											   <td>
												   ${requestScope.lanmu.createtime}
												</td>
											   </tr>
											   <tr>
											   <td align="right" class="title">父栏目:</td>
											   <td>
												   ${requestScope.lanmu.parentid}
												</td>
											   </tr>
											   <tr>
											   <td align="right" class="title">叶子节点:</td>
											   <td>
												   ${requestScope.lanmu.isleaf}
												</td>
											   </tr>
											 <tr>
											   <td align="right" class="title">栏目介绍:</td>
											   <td colspan="3">
												${requestScope.lanmu.des}
											   </td>
											 </tr>
				        </table>
      </div>
    </div>
</body>
</html>
