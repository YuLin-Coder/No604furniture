<%@page import="com.itbaizhan.daowen.bll.*"%>
<%@page import="com.itbaizhan.daowen.entity.*,com.itbaizhan.daowen.dal.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<%@ include file="law.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员登录</title>
  <link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/index.css" type="text/css"></link>
 <link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/box.all.css" type="text/css"></link>

<script
	src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.8.3.min.js"
	type="text/javascript"></script>





</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>

	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="index.jsp">首页</a> &gt;&gt; <a href="myindex.jsp">会员中心</a>
		</div>
	</div>


	<div class="fn-clear"></div>

		<div class="wrap">
		
		   <div class="main">
		   
		       <jsp:include  page="menu.jsp"></jsp:include>
		       <div class="main-content">
					
					   <table cellpadding="0" cellspacing="1" class="grid" width="100%">
							<tr>
								<td width="15%" align="right" class="title">账号:</td>
								<td width="35%">${huiyuan.accountname}(${huiyuan.nickname})</td>
								<td width="*" colspan="2" rowspan="6">
								  
								    <img  src="${huiyuan.touxiang}"/>
								
								</td>
							</tr>
							<tr>
								<td align="right" class="title">密码:</td>
								<td>*****<a href="<%=SystemParam.getSiteRoot()%>/e/mymodifypw.jsp?seedid=m9">修改</a></td>
							</tr>
							<tr>
								<td align="right" class="title">姓名:</td>
								<td>${huiyuan.name}</td>
							</tr>
							
							<tr>
								<td align="right" class="title">性别:</td>
								<td>${huiyuan.sex}</td>
							</tr>
							<tr>
								<td align="right" class="title">登录次数:</td>
								<td>${huiyuan.logtimes} 次</td>
							</tr>
							<tr>
								<td align="right" class="title">注册时间:</td>
								<td><fmt:formatDate value="${huiyuan.regdate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
							</tr>
							<tr>
								<td align="right" class="title">职业:</td>
								<td>${huiyuan.zhiye}</td>
							
								<td align="right" class="title">账户状态:</td>
								<td>${huiyuan.status==0?"待审批":huiyuan.status==1?"已审批":"无效状态"}</td>
							</tr>
							<tr>
								<td align="right" class="title">手机:</td>
								<td>${huiyuan.mobile}</td>
							
								<td width="15%" align="right" class="title">邮箱:</td>
								<td width="35%">${huiyuan.email}</td>
							</tr>
							
							
						</table>
					
					</div>
		   </div>
			
		</div>
		


	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>