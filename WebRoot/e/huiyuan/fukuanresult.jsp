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
	String  id=request.getParameter("id");
    
    Dingdan temobjdingdan=null;
    if( id!=null)
    {
      
      temobjdingdan=(Dingdan)DALBase.load("dingdan"," where id="+ id);
      request.setAttribute("dingdan",temobjdingdan);
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>订单信息查看</title>
<link rel="stylesheet"
	href="<%=SystemParam.getSiteRoot()%>/e/css/index.css" type="text/css"></link>
<link rel="stylesheet"
	href="<%=SystemParam.getSiteRoot()%>/e/css/register.css"
	type="text/css"></link>
<link href="<%=SystemParam.getSiteRoot()%>/admin/css/web2table.css"
	rel="stylesheet" type="text/css" />
<link href="<%=SystemParam.getSiteRoot()%>/uploadifyv3.1/uploadify.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.9.0.js"></script>
<script
	src="<%=SystemParam.getSiteRoot()%>/uploadifyv3.1/jquery.uploadify-3.1.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="<%=SystemParam.getSiteRoot()%>/webui/jquery-validation/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="<%=SystemParam.getSiteRoot()%>/webui/jquery-validation/jquery.metadata.js"></script>
<script type="text/javascript"
	src="<%=SystemParam.getSiteRoot()%>/webui/jquery-validation/messages_cn.js"></script>
<script type="text/javascript"
	src="<%=SystemParam.getSiteRoot()%>/editor/kindeditor-min.js"></script>
<script type="text/javascript"
	src="<%=SystemParam.getSiteRoot()%>/editor/lang/zh_CN.js"></script>
<script type="text/javascript">
	$(function() {
	});
</script>
</head>
<body style="padding:10px">
	<jsp:include page="/e/head.jsp"></jsp:include>
	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="index.jsp">首页</a> &gt;&gt; <a href="dingdanadd.jsp">新增订单</a>
		</div>
	</div>
	<div class="fn-clear"></div>
	<div class="wrap">
		<div class="main">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">
				<div class="search-title">
					<h2>付款成功</h2>
					<div class="description"></div>
				</div>
			
				
			</div>
		</div>
</body>
</html>
