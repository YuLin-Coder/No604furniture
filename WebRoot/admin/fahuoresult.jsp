<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%@ page import="com.itbaizhan.daowen.bll.*"%>
<%@ page import="com.itbaizhan.daowen.entity.*"%>
<%@page import="com.itbaizhan.daowen.dal.DALBase"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
	String id = request.getParameter("id");

	Dingdan temobjdingdan=null;
	if (id != null) {
		
	    temobjdingdan = (Dingdan) DALBase.load("dingdan",
				" where id=" + id);
		request.setAttribute("dingdan", temobjdingdan);
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>订单信息查看</title>
<link href="<%=SystemParam.getSiteRoot()%>/admin/css/web2table.css"
	rel="stylesheet" type="text/css" />
<link href="<%=SystemParam.getSiteRoot()%>/admin/css/layout.css"
	rel="stylesheet" type="text/css" />
<link href="<%=SystemParam.getSiteRoot()%>/admin/css/menu.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.9.0.js"></script>
</head>
<body>
	<div class="search-title">
		<h2>订单管理发货完成</h2>
		
	</div>
	
</body>
</html>
