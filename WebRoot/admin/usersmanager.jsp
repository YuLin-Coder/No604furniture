<%@page import="com.itbaizhan.daowen.bll.SystemParam"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<% int pageId=2; %>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
   
    
    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/layout.css" rel="stylesheet" type="text/css" />
    
    <script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.9.0.js" type="text/javascript"></script>

    <link href="<%=SystemParam.getSiteRoot() %>/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />

    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    
    
    <script src="<%=SystemParam.getSiteRoot()%>/webui/combo/combo.js"
			type="text/javascript"></script>
	<script type="text/javascript">
			$(function() {
			    $("#btnDelete").click(function(){
			        if($(".check:checked").length<1)
			        {
			           $.dialog.alert("请选择需要注销的用户");
			           return;
			        } 
			        $(".check:checked").each(function(index,domEle){
			             var id=$(domEle).val();
			             $.dialog.confirm("你确定要注销改用户信息?", function(){
				             window.location.href=encodeURI('<%=SystemParam.getSiteRoot()%>/admin/usersmanager.do?actiontype=delete&id='+ id);
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
	});
</script>
</head>
<body>


           <div class="search-title">
                <h2>
                                                后台用户管理
                </h2>
                <div class="description">
                    <a href="<%=SystemParam.getSiteRoot() %>/admin/usersmanager.do?actiontype=load&seedid=101">新建后台用户</a>
                </div>
            </div>
            
               <div class="search-options">
               <form id="searchForm" action="<%=SystemParam.getSiteRoot()%>/admin/usersmanager.do" method="post">
               <input type="hidden"  name="actiontype" value="get"/>
               
               
                <div class="pt-15 fn-clear">
                    <div class="search-form-item fn-left">
                        <label class="search-form-label">
                                                                用户名:</label>
                        <div class="search-form-item-content">
                            <input id="txtUsername" type="text" name="username" value="${username}" runat="server" class="input-txt" />
                        </div>
                    </div>
                    
                    <div class="search-form-item fn-left">
                       <div class="ui-button">
                        <input  class="ui-button-text" value="搜索"  type="submit" />
                        </div>
                    </div>
               </div>
                  
               
              </form>
            </div>
            <div class="action-details">
               
                  <a id="btnDelete" class="action-btn" href="#">
	                  <em class="icon-delete"></em>
	                  <b>删除</b>
                  </a>
                
            </div>
            <table id="module" width="100%" border="0" cellspacing="0"
						cellpadding="0" class="ui-record-table">
						<thead >
							<tr>
								<th>
									选择
								</th>
								<th>
									<b>用户名</b>
								</th>
								
								
								<th>
									<b>创建人</b>
								</th>
								<th>
									<b>创建时间</b>
								</th>
								<th>
									<b>绑定邮箱</b>
								</th>
								<th>
									<b>电话</b>
								</th>
								<th>
									<b>登录次数</b>
								</th>
								<th>
									<b>真名</b>
								</th>
								<th>
									<b>昵称</b>
								</th>
								<th>
									<b>性别</b>
								</th>
								
								<th>
									操作
								</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${listusers== null || fn:length(listusers) == 0}">
								<tr>
									<td colspan="20">
										没有相关系统用户信息
									</td>
								</tr>
							</c:if>
							<c:forEach var="temusers" items="${listusers}">
								<tr>
									<td>
										&nbsp
										<input id="chk${temusers.id}" class="check"
											name="chk${temusers.id}" type="checkbox"
											value='${temusers.id}'>
									</td>
									<td>
										${temusers.username}
									</td>
									
									
									<td>
										${temusers.creator}
									</td>
									<td>
										${temusers.createtime}
									</td>
									<td>
										${temusers.email}
									</td>
									<td>
										${temusers.tel}
									</td>
									<td>
										${temusers.logtimes}
									</td>
									<td>
										${temusers.realname}
									</td>
									<td>
										${temusers.nickname}
									</td>
									<td>
										${temusers.sex}
									</td>
									
									<td>
										<a class="edit"
											href="<%=SystemParam.getSiteRoot()%>/admin/usersmanager.do?actiontype=load&id=${temusers.id}">修改</a>
										<a class="chakan" href="usersdetails.jsp?id=${temusers.id}">查看</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="clear"></div>
					<daowen:pager id="pager1" attcheform="searchForm" />
     
    

</body>
</html>