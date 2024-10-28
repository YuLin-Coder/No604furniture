<%@page import="com.itbaizhan.daowen.bll.*"%>
<%@page import="com.itbaizhan.daowen.entity.*,com.itbaizhan.daowen.dal.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <%
            String id=request.getParameter("id");
            if(id!=null){
                Huiyuan  huiyuan=(Huiyuan)DALBase.load("huiyuan","where id="+id);
                if(huiyuan!=null)
                   request.setAttribute("huiyuan",huiyuan);
            }
   %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信息</title>
<link rel="stylesheet" href="css/index.css" type="text/css"></link>
<link rel="stylesheet" href="css/register.css" type="text/css"></link>
 <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/leaveword.css" type="text/css"></link>
<script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.5.2.min.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap">
	  <div class="cover-title">
                   当前位置：<a href="index.aspx">首页</a> &gt;&gt; <a></a>
      </div>
	</div>
	<input type="hidden" id="reUrl" name="reurl" value="/e/huiyuaninfo.jsp?id=<%=id%>"/>
	<div class="fn-clear"></div>
	<div class="wrap">
		   <div class="info">
                    <h1>
                                                                      对${requestScope.huiyuan.name}评学
                    </h1>
                    <h5>
                    </h5>
                    <div class="news-content">
				<table cellpadding="0" cellspacing="1" class="grid" width="100%">
					<tr>
						<td align="right" class="title">用户名:</td>
						<td>${requestScope.huiyuan.accountname}</td>
						<td  colspan="2" rowspan="6"><img id="imgTouxiang" width="200px" height="200px"
							src="${requestScope.huiyuan.touxiang}" />
				        </td>
					</tr>
					
					
					<tr>
						<td align="right" class="title">昵称:</td>
						<td>${requestScope.huiyuan.nickname}</td>
					</tr>
					<tr>
						<td align="right" class="title">注册时间:</td>
						<td>${requestScope.huiyuan.regdate}</td>
					</tr>
					<tr>
						<td align="right" class="title">登录次数:</td>
						<td>${requestScope.huiyuan.logtimes}</td>
					</tr>
					
					<tr>
						<td align="right" class="title">邮箱:</td>
						<td>${requestScope.huiyuan.email}</td>
					</tr>
					<tr>
						<td align="right" class="title">移动电话:</td>
						<td>${requestScope.huiyuan.mobile}</td>
					</tr>
					
					<tr>
						<td align="right" class="title">地址:</td>
						<td>${requestScope.huiyuan.address}</td>
					
						<td align="right" class="title">级别:</td>
						<td>${requestScope.huiyuan.jibie}</td>
					</tr>
					<tr>
						<td align="right" class="title">姓名:</td>
						<td>${requestScope.huiyuan.name}</td>
					
					
						<td align="right" class="title">爱好:</td>
						<td>${requestScope.huiyuan.aihao}</td>
					</tr>
					
				</table>
				<%=VoteBLL.buildVote(id, "student","/e/studentcepingresult.jsp?id="+id) %>
			</div>
             </div>
		   <jsp:include page="comment.jsp?commenttype=notice"></jsp:include>
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
