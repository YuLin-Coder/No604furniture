<%@page import="com.itbaizhan.daowen.bll.*,com.itbaizhan.daowen.util.*"%>
<%@page import="com.itbaizhan.daowen.entity.*,com.itbaizhan.daowen.dal.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<%@ include file="law.jsp"%>
<%

       
       String filter = "";
       if(tem_huiyuan!=null)
           filter = " where lwren='"+tem_huiyuan.getAccountname()+"'";
        
       
		System.out.println("filter="+filter);
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
		List<Leaveword> listleaveword = DALBase.getPageEnity("leaveword",
				filter, pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("leaveword",
				filter == null ? "" : filter);
		request.setAttribute("listleaveword", listleaveword);
		PagerMetal pm = new PagerMetal(recordscount);
		// 设置尺寸
		pm.setPagesize(pagesize);
		// 设置当前显示页
		pm.setCurpageindex(pageindex);
		// 设置分页信息
		request.setAttribute("pagermetal", pm);
 %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员登录</title>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/index.css" type="text/css"></link>
<link href="<%=SystemParam.getSiteRoot()%>/admin/css/web2table.css"
	rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/box.all.css" type="text/css"></link>
<script src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<link href="<%=SystemParam.getSiteRoot() %>/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
 <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
<script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
 <link href="<%=SystemParam.getSiteRoot() %>/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
 <link href="<%=SystemParam.getSiteRoot() %>/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
    <link href="<%=SystemParam.getSiteRoot() %>/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery-form/jquery.form.js"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>

    <script type="text/javascript">
     
          $(function(){
          
                 $("#btnDelete").click(function(){
			        if($(".check:checked").length<1)
			        {
			           $.daowenDialog.warn("请选择需要删除的记录");
			           return;
			        } 
			        $(".check:checked").each(function(index,domEle){
			             var id=$(domEle).val();
			             $.dialog.confirm("你确定要注销在线留言信息?", function(){
				             window.location.href=encodeURI('<%=SystemParam.getSiteRoot()%>/admin/leavewordmanager.do?actiontype=delete&id='+ id);
						  });
						});
					});
					
					$("#btnCheckAll").click(function() {
						var ischeck = false;
						$(".check").each(function() {
							if ($(this).is(":checked")) {
								$(this).prop("checked", "");
								ischeck = false;
							} else {
								$(this).prop("checked", "true");
								ischeck = true;
							}
						});
						if ($(this).text() == "选择记录")
							$(this).text("取消选择");
						else
							$(this).text("选择记录");
					})
          })
          
          
    
    </script>



</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
    <div class="fn-clear"></div>
	
	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="index.jsp">首页</a> &gt;&gt; <a href="myindex.jsp">会员中心</a>
		</div>
	</div>


	<div class="fn-clear"></div>

	<div class="wrap">

		<div class="main">

			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">
                <div class="clear"></div>
			<div class="action-details">
				
					<a href="#" id="btnCheckAll" class="action-button"><img
						src="<%=SystemParam.getSiteRoot() %>/admin/images/submit.gif">选择
					</a>
				
			</div>
			<table id="module" width="100%" border="0" cellspacing="0"
				cellpadding="0" class="ui-record-table">
				<thead>
					<tr>
						<th>选择</th>
						<th><b>标题</b>
						</th>
						<th><b>留言人</b>
						</th>
						<th><b>留言时间</b>
						</th>
						<th>
						  <b>状态</b>
						</th>
						<th>
						   <b>内容</b>
						</th>
						
						
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:if
						test="${listleaveword== null || fn:length(listleaveword) == 0}">
						<tr>
							<td colspan="20">没有相关在线留言信息</td>
						</tr>
					</c:if>
					<c:forEach var="temleaveword" items="${listleaveword}">
						<tr>
							<td>&nbsp<input id="chk${temleaveword.id}" class="check"
								name="chk${temleaveword.id}" type="checkbox"
								value='${temleaveword.id}'>
							</td>
							<td>${temleaveword.title}</td>
							<td>${temleaveword.lwren}</td>
							<td>${temleaveword.pubtime}</td>
							
							
							<td>${temleaveword.status==1?"已回复":"待回复"}</td>
							<td>${temleaveword.dcontent}</td>
							<td>
								<a class="chakan" href="mylwinfo.jsp?id=${temleaveword.id}&seedid=m1">查看</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="clear"></div>
			<daowen:pager id="pager1" attcheform="searchForm" />
			</div>
		</div>

	</div>



	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>