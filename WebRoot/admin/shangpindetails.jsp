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
      Shangpin temobjshangpin=(Shangpin)DALBase.load("shangpin"," where id="+ id);
      request.setAttribute("shangpin",temobjshangpin);
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  <title>商品信息查看</title>
    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/menu.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.9.0.js"></script>
</head>
<body >
	<div class="search-title">
		<h2>商品管理-> 查看商品</h2>
		<div class="description"></div>
	</div>
	<table cellpadding="0" cellspacing="1" class="grid" width="100%">
		<tr>
			<td align="right">名称:</td>
			<td>${requestScope.shangpin.name}</td>
		</tr>
		<tr>
			<td align="right">商品编号:</td>
			<td>${requestScope.shangpin.spno}</td>
		</tr>
		<tr>
			<td align="right">价格:</td>
			<td>${requestScope.shangpin.jiage}</td>
		</tr>
		<tr>
			<td align="right">打折:</td>
			<td>${requestScope.shangpin.dazhe}</td>
		</tr>
		<tr>
			<td align="right">推荐:</td>
			<td>${requestScope.shangpin.tuijian}</td>
		</tr>
		<tr>
			<td align="right">最新:</td>
			<td>${requestScope.shangpin.zuixin}</td>
		</tr>
		<tr>
			<td align="right">商品类别:</td>
			<td>${requestScope.shangpin.sptype}</td>
		</tr>
		<tr>
			<td align="right">商品类别编号:</td>
			<td>${requestScope.shangpin.sptypeid}</td>
		</tr>
		<tr>
			<td align="right">图片:</td>
			<td><img id="imgTupian" width="200px" height="200px"
				src="${requestScope.shangpin.tupian}" /></td>
		</tr>
		<tr>
			<td align="right">会员价:</td>
			<td>${requestScope.shangpin.hyjia}</td>
		</tr>
		<tr>
			<td align="right">介绍:</td>
			<td colspan="3">${requestScope.shangpin.jieshao}</td>
		</tr>
	</table>
</body>
</html>
