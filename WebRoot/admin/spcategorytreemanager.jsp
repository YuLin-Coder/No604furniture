<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.itbaizhan.daowen.bll.*,com.itbaizhan.daowen.util.PagerMetal"%>
<%@ page import="com.itbaizhan.daowen.entity.*"%>
<%@page import="com.itbaizhan.daowen.dal.DALBase"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>商品类别信息</title>
    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.9.0.js"></script>
<link
	href="<%=SystemParam.getSiteRoot()%>/webui/artDialog/skins/default.css"
	rel="stylesheet" type="text/css" />
<script
	src="<%=SystemParam.getSiteRoot()%>/webui/artDialog/jquery.artDialog.source.js"
	type="text/javascript"></script>
<script
	src="<%=SystemParam.getSiteRoot()%>/webui/artDialog/iframeTools.source.js"
	type="text/javascript"></script>
<link
	href="<%=SystemParam.getSiteRoot()%>/webui/treetable/skin/jquery.treetable.css"
	rel="stylesheet" type="text/css" />
<link
	href="<%=SystemParam.getSiteRoot()%>/webui/treetable/skin/jquery.treetable.theme.default.css"
	rel="stylesheet" type="text/css" />
<script
	src="<%=SystemParam.getSiteRoot()%>/webui/treetable/js/jquery.treetable.js"
	type="text/javascript"></script>
<script type="text/javascript">
		
			$(function() {
			    $("#lanmu tr").each(function(){
			        if($(this).attr("parentid")!=0)
			          $(this).attr("data-tt-parent-id",$(this).attr("parentid"));
			    })
			    $("#lanmu").treetable({ expandable: true }).treetable("expandAll");
			    $(".btn-lanmu-delete").click(function(){
			        var lanmuid=$(this).attr("lanmuid");
		                 $.dialog.confirm("你确定要删除该栏目",function(){
		                    $.ajax({
		                        url:encodeURI('<%=SystemParam.getSiteRoot()%>/admin/spcategorymanager.do?actiontype=delete&id='+lanmuid),
					            method:'get',
					            
					            success:function(){
					                window.location.reload();
					            },
					            error:function(xmhttprequest,status,excetpion){
					                $.dialog.alert("系统错误，错误编码"+status);
					            }
		                    })
		                 });
		                 return false;
			    });
			});
       </script>
</head>
<body >
			<div class="search-title">
				<h2>商品类别管理</h2>
				<div class="description">
					<a
						href="<%=SystemParam.getSiteRoot()%>/admin/spcategorymanager.do?actiontype=load&parentid=0">新建商品类别</a>
				</div>
			</div>
			<div class="clear"></div>
			<table id="lanmu" width="100%" border="0" cellspacing="0"
				cellpadding="0" class="ui-record-table">
				<thead>
					<tr>
						<th style="text-align:left;">商品类别信息</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${listspcategory== null || fn:length(listspcategory) == 0}">
						<tr>
							<td colspan="20">没有商品类别信息</td>
						</tr>
					</c:if>
					      <%	
								    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
									if(request.getAttribute("listspcategory")!=null)
								      {
									  List<Spcategory> listspcategory=( List<Spcategory>)request.getAttribute("listspcategory");
								     for(Spcategory  temspcategory  :   listspcategory)
								      {
							%>
						<tr data-tt-id='<%=temspcategory.getId() %>' parentid="<%=temspcategory.getParentid()%>">
							<td style="text-align:left;">
							    <span
								class='<%=temspcategory.getIsleaf()==1?"file":"folder" %>'> 
								<a
									title="<%=temspcategory.getMingcheng()%>"
									href="spcategorymanager.do?actiontype=load&seedid=203&id=<%=temspcategory.getId() %>&parentid=<%=temspcategory.getParentid() %>">
										<%=temspcategory.getMingcheng()%></a> 
								</span>
										 <a type="button" class="action-button"
						href="spcategorymanager.do?actiontype=load&seedid=203&parentid=<%=temspcategory.getId() %>"><img
									          src="images/add.gif">添加分类
							                  </a> 
							   <a type="button" class="action-button"
								href="spcategorymanager.do?actiontype=load&seedid=203&id=<%=temspcategory.getId() %>&parentid=<%=temspcategory.getParentid() %>"><img
									src="images/add.gif">编辑分类
							</a> 
							
							  <%
							     if(temspcategory.getIsleaf()==1){
							    	 
							     
							  %>
							       <a lanmuid='<%=temspcategory.getId() %>' class="btn-lanmu-delete action-button" type='button' href="javascript:void"><img src="images/del.gif">删除</a>
							  <%} %>
							
							
		                     </td>
						</tr>
					    <%} } %>
				</tbody>
			</table>
</body>
</html>
