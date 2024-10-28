<%@page import="com.itbaizhan.daowen.bll.*,java.util.*"%>
<%@page import="com.itbaizhan.daowen.entity.*,com.itbaizhan.daowen.dal.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <%
            List<Huiyuan> huiyuanlist=DALBase.getEntity("Huiyuan","");
   %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员信息</title>
<link rel="stylesheet" href="css/index.css" type="text/css"></link>
<link rel="stylesheet" href="css/register.css" type="text/css"></link>
<link rel="stylesheet" href="css/leaveword.css" type="text/css"></link>
<script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.5.2.min.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap">
	  <div class="cover-title">
                   当前位置：<a href="index.aspx">首页</a> &gt;&gt; <a>会员</a>
      </div>
	</div>
	<div class="fn-clear"></div>
	<div class="wrap">
		
     	     <div  class="newsimagelist">
     	         <div class="content">
     	         <ul>
     	            <% 
     	              for(Iterator it=huiyuanlist.iterator();it.hasNext();){ 
     	                  Huiyuan temhuiyuan=(Huiyuan)it.next();
     	            %>
     	            <li>
     	                <div class="pic">
     	                   <a><img src="<%=temhuiyuan.getTouxiang() %>"/></a>
     	                </div>
     	                <div class="text">
     	                    <div class="text-title"><a href="<%=SystemParam.getSiteRoot()%>/e/huiyuaninfo.jsp?id=<%=temhuiyuan.getId()%>"><%=temhuiyuan.getName() %></a></div>
     	                    <div class="subtitle">
     	                                                           发布时间:<span></span>
     	                    </div>
     	                    <div class="text-content">
                             </div>
     	                </div>
     	            </li>
     	            <%} %>
     	         </ul>
     	        </div>
     	     </div>
		
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
