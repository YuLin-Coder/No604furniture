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
		<title>系统配置信息</title>
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
		<script type="text/javascript">
			$(function() {
			    $("#btnDelete").click(function(){
			        if($(".check:checked").length<1)
			        {
			           $.dialog.alert("请选择需要删除的记录");
			           return;
			        } 
			        $(".check:checked").each(function(index,domEle){
			             var id=$(domEle).val();
			             $.dialog.confirm("你确定要注销系统配置信息?", function(){
				             window.location.href=encodeURI('<%=SystemParam.getSiteRoot()%>/admin/sysconfigmanager.do?actiontype=delete&id='+id);
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
	 <body >
			   <div class="search-title">
					  <h2>
	                       系统配置管理
	                </h2>
                <div class="description">
                    <a href="<%=SystemParam.getSiteRoot() %>/admin/sysconfigmanager.do?actiontype=load&seedid=102">新建系统配置</a>
                </div>
              </div>
					<!-- 搜索控件开始 -->
					  <div class="search-options">
					  <form id="searchForm"  action="<%=SystemParam.getSiteRoot() %>/admin/sysconfigmanager.do" method="post" >
					   <table  cellspacing="0" width="100%">
					        <tbody>
					          <tr>
					             <td>
					                标题
                                            <input name="title"  value="${title}" class="input-txt" type="text" id="title"  />
					                  <input type="hidden"   name="actiontype" value="search"/>
					                  <input type="hidden"   name="seedid" value="${seedid}"/>
					                 <div class="ui-button">
					                    <input type="submit" value="搜索" id="btnSearch" class="ui-button-text" /> 
					                 </div>
					             </td>
					          </tr>
					        </tbody>
					   </table>
					   </form>
					</div>
					<!-- 搜索控件结束 -->
					<div class="clear">
					</div>
					 <div class="action-details">
							      <a href="#"  id="btnCheckAll" class="action-button">选择</a>
							     <a id="btnDelete" class="action-btn" href="#">
					<em class="icon-delete"></em>
					                  <b>删除</b>
				                 </a>
                    </div>
		             <table id="module" width="100%" border="0" cellspacing="0" cellpadding="0" class="ui-record-table">
		                   <thead>
		                    <tr >
							    <th >
							       选择
							    </th>
													     <th><b>信息标题</b></th>
								<th>
								   操作
								</th>
							 </tr>
							 </thead>
							 <tbody>
							 <c:if test="${listsysconfig== null || fn:length(listsysconfig) == 0}">
						        <tr>
						          <td colspan="20">
						              没有相关系统配置信息
						          </td>
						        </tr>
						    </c:if>
						<c:forEach var="temsysconfig" items="${listsysconfig}">
							<tr>
							    <td>
					&nbsp<input id="chk${temsysconfig.id}"  class="check"   name="chk${temsysconfig.id}" type="checkbox"  value='${temsysconfig.id}' >
							    </td>
					<td >${temsysconfig.title}</td>
								<td >
								     <a class="edit" href="<%=SystemParam.getSiteRoot() %>/admin/sysconfigmanager.do?actiontype=load&id=${temsysconfig.id}">修改</a>
					                
								</td>
							</tr>
							</c:forEach>
						</tbody>
						</table>
						<div class="clear"></div>
						<daowen:pager id="pager1"  attcheform="searchForm" />
	</body>
</html>
