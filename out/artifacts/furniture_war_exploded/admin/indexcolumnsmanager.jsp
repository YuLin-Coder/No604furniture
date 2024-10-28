<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.itbaizhan.daowen.bll.*,com.itbaizhan.daowen.util.PagerMetal"%>
<%@ page import="com.itbaizhan.daowen.entity.*" %>
<%@page import="com.itbaizhan.daowen.dal.DALBase"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>首页栏目信息</title>
    <script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <link href="<%=SystemParam.getSiteRoot() %>/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="<%=SystemParam.getSiteRoot()%>/webui/combo/combo.js" type="text/javascript"></script>
    <link href="<%=SystemParam.getSiteRoot() %>/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemParam.getSiteRoot() %>/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
     <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			$(function() {
			    $("#btnDelete").click(function(){
			        if($(".check:checked").length<1)
			        {
			           top.$.dialog.alert("请选择需要删除的记录");
			           return;
			        } 
			        $(".check:checked").each(function(index,domEle){
			             var id=$(domEle).val();
			             top.$.dialog.confirm("你确定要注销首页栏目信息?", function(){
				             window.location.href=encodeURI('<%=SystemParam.getSiteRoot()%>/admin/indexcolumnsmanager.do?forwardurl=/admin/indexcolumnsmanager.jsp&actiontype=delete&id='+id);
				         });
			        });
			    });
			    $("#btnCheckAll").click(function(){
			           var ischeck=false;
			           $(".check").each(function(){
			               if($(this).is(":checked"))
			               {
			                  $(this).prop("checked","");
			                  ischeck=false;
			                }
			               else
			               {
			                  $(this).prop("checked","true");
			                  ischeck=true;
			                }
			           });
			           if($(this).text()=="选择记录")
			              $(this).text("取消选择");
			           else
			              $(this).text("选择记录");
			    })
			});
       </script>
	</head>
<body>
	<div class="search-title">
		<h2>首页栏目管理</h2>
		<div class="description">
			<a
				href="<%=SystemParam.getSiteRoot() %>/admin/spcategorymanager.do?actiontype=get&forwardurl=/admin/columnguide.jsp">新建首页栏目</a>
		</div>
	</div>
	<!-- 搜索控件开始 -->
	<div class="search-options">
		<form id="searchForm"
			action="<%=SystemParam.getSiteRoot() %>/admin/indexcolumnsmanager.do"
			method="post">
			<table cellspacing="0" width="100%">
				<tbody>
					<tr>
						<td>栏目描述 <input name="coldes" value="${coldes}"
							class="input-txt" type="text" id="coldes" /> <input
							type="hidden" name="actiontype" value="search" /> <input
							type="hidden" name="seedid" value="${seedid}" /> <input
							type="hidden" name="forwardurl"
							value="/admin/indexcolumnsmanager.jsp" />
							<div class="ui-button">
								<button class="ui-button-text">搜索</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<!-- 搜索控件结束 -->
	<div class="clear"></div>
	<div class="action-details">
		<a href="#" class="btn btn-success" id="btnCheckAll"
			class="action-button">选择</a> <a id="btnDelete" class="action-btn"
			href="#"> <em class="icon-delete"></em> <b>删除</b>
		</a>
	</div>
	<table id="indexcolumns" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
				<th>选择</th>
				<th><b>栏目描述</b></th>
				
				<th><b>栏目类型</b></th>
				<th><b>显示风格</b></th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if
				test="${listindexcolumns== null || fn:length(listindexcolumns) == 0}">
				<tr>
					<td colspan="20">没有相关首页栏目信息</td>
				</tr>
			</c:if>
			<%	
								        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
									if(request.getAttribute("listindexcolumns")!=null)
								      {
									  List<Indexcolumns> listindexcolumns=( List<Indexcolumns>)request.getAttribute("listindexcolumns");
								     for(Indexcolumns  temindexcolumns  :  listindexcolumns)
								      {
							%>
			<tr>
				<td>&nbsp<input id="chk<%=temindexcolumns.getId()%>"
					class="check" name="chk<%=temindexcolumns.getId()%>"
					type="checkbox" value='<%=temindexcolumns.getId()%>'></td>
				<td><%=temindexcolumns.getColdes()%>(<%=temindexcolumns.getColid()%>)</td>
				<td><%=temindexcolumns.getXtype() %></td>
				
				<td><%=temindexcolumns.getShowstyle()%></td>
				<td><a class="orange-href"
					href="<%=SystemParam.getSiteRoot() %>/admin/indexcolumnsmanager.do?actiontype=load&id=<%=temindexcolumns.getId()%>&forwardurl=/admin/indexcolumnsadd.jsp">修改</a>
					
				</td>
			</tr>
			<%}}%>
		</tbody>
	</table>
	<div class="clear"></div>
	<daowen:pager id="pager1" attcheform="searchForm" />
</body>
</html>
