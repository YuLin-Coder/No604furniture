<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.itbaizhan.daowen.bll.*,com.itbaizhan.daowen.util.PagerMetal"%>
<%@ page import="com.itbaizhan.daowen.entity.*" %>
<%@page import="com.itbaizhan.daowen.dal.DALBase"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>商品信息</title>
    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/menu.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.9.0.js"></script>
     <link href="<%=SystemParam.getSiteRoot() %>/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="<%=SystemParam.getSiteRoot() %>/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemParam.getSiteRoot() %>/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
       <script src="<%=SystemParam.getSiteRoot() %>/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>

        <script src="<%=SystemParam.getSiteRoot() %>/webui/combo/combo.js" type="text/javascript"></script> 
		<script type="text/javascript">
			$(function() {
			    
				$(".ui-record-table").recordTable();
				$("#btnDelete").click(function(){
			        if($(".check:checked").length<1)
			        {
			           $.dialog.alert("请选择需要删除的记录");
			           return;
			        } 
			        $(".check:checked").each(function(index,domEle){
			             var id=$(domEle).val();
			             $.dialog.confirm("你确定要注销商品信息?", function(){
				             window.location.href=encodeURI('<%=SystemParam.getSiteRoot()%>/admin/shangpinmanager.do?actiontype=delete&id='+id);
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
			    });
               var temsptypeid='${sptypeid}';
	           if(temsptypeid!=''){
	     			$("#sptype").val(temsptypeid);
				}
				$("[name='sptypeid']").val($("#sptype").children('option:selected').val());
	        	$("[name='sptype']").val($("#sptype").children('option:selected').text());
	            $("#sptype").change(function(){
	            	
	            	$("[name='sptypeid']").val($(this).children('option:selected').val());
	            	$("[name='sptype']").val($(this).children('option:selected').text());
	            });
	           
			    
			});
       </script>
       <style type="text/css">
       
           .dropdown{width:120px;height:40px;font-size:16px;}
       </style>
      
	</head>
	 <body >
	<div class="search-title">
		<h2>商品管理</h2>
		<div class="description">
			<a
				href="<%=SystemParam.getSiteRoot() %>/admin/shangpinmanager.do?actiontype=load&seedid=202">发布商品</a>
		</div>
	</div>
	<!-- 搜索控件开始 -->
	<div class="search-options">
		<form id="searchForm"
			action="<%=SystemParam.getSiteRoot() %>/admin/shangpinmanager.do"
			method="post">
			 <input type="hidden" name="actiontype"
							value="search" /> 
							<input type="hidden" name="seedid"
							value="${seedid}" />
			<table cellspacing="0" width="100%">
				<tbody>
					<tr>
						<td>商品名称 <input name="name" value="${name}" class="input-txt"
							type="text"  /> 
						 
							商品分类:<input type="hidden" name="sptype" /> 
							<input type="hidden" name="sptypeid" />
							<web:dropdownlist id="sptype"  cssclass="dropdown"
							
							    datasource="${sptype_datasource}" textfieldname="mingcheng"
							    valuefieldname="id">
						      </web:dropdownlist>
					    
							<div class="ui-button">
								<input type="submit" value="搜索" id="btnSearch"
									class="ui-button-text" />
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
		<a href="#" id="btnCheckAll" class="action-button">选择</a> <a
			id="btnDelete" class="action-btn" href="#"> <em
			class="icon-delete"></em> <b>删除</b>
		</a>
	</div>
	<table id="module" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
				<th>选择</th>
				<th><b>名称</b></th>
				
				<th><b>价格</b></th>

				<th><b>会员价</b></th>
				<th><b>打折</b></th>
				<th><b>推荐</b></th>
				<th><b>最新</b></th>
				<th><b>商品类别</b></th>

				</th>

				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${listshangpin== null || fn:length(listshangpin) == 0}">
				<tr>
					<td colspan="20">没有相关商品信息</td>
				</tr>
			</c:if>
			<c:forEach var="temshangpin" items="${listshangpin}">
				<tr>
					<td>&nbsp<input id="chk${temshangpin.id}" class="check"
						name="chk${temshangpin.id}" type="checkbox"
						value='${temshangpin.id}'></td>
					<td>${temshangpin.name}(${temshangpin.spno})</td>
					
					<td>${temshangpin.jiage}</td>
					<td>${temshangpin.hyjia}</td>
					<td>${temshangpin.dazhe==1?"打折":"不打折"}</td>
					<td>${temshangpin.tuijian==1?"是":"否"}</td>
					<td>${temshangpin.zuixin==1?"是":"否"}</td>
					<td>${temshangpin.sptype}</td>


					<td><a class="orange-href"
						href="<%=SystemParam.getSiteRoot() %>/admin/shangpinmanager.do?actiontype=load&id=${temshangpin.id}">修改</a>
						<a target="_blank" class="chakan" href="../e/shangpininfo.jsp?id=${temshangpin.id}">查看</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="clear"></div>
	<daowen:pager id="pager1" attcheform="searchForm" />
</body>
</html>
