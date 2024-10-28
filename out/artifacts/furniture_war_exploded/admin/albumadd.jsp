<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%@ page import="com.itbaizhan.daowen.bll.*"%>
<%@ page import="com.itbaizhan.daowen.entity.*" %>
<%@page import="com.itbaizhan.daowen.dal.DALBase"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>相册</title>
 
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="<%=SystemParam.getSiteRoot() %>/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script  type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/messages_cn.js" ></script>
    <link href="<%=SystemParam.getSiteRoot() %>/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery-form/jquery.form.js"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
    <script src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
      <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript">
        function initControl(){
	  //开始绑定
                    //结束绑定
                      $("#txtPubtime").datepicker({
                         dateFormat:'yy-mm-dd'
                      }).datepicker("setDate",new Date());
        }
        $(function ()
        {
            initControl();
            $.metadata.setType("attr","validate");
            $("#albumForm").validate();
        });  
    </script>
</head>
<body>
<div class="search-title">
		<h2>新建相册</h2>
		<div class="description"></div>
	</div>
				<form name="albumform" method="post"
					action="<%=SystemParam.getSiteRoot()%>/admin/albummanager.do"
					id="albumForm">
					<table class="grid" cellspacing="1" width="100%">
						<input type="hidden" name="id" value="${id}" />
						<input type="hidden" name="actiontype" value="${actiontype}" />
						<input type="hidden" name="seedid" value="${seedid}" />
						<input type="hidden" name="errorurl"
							value="/admin/albumadd.jsp" />
						<input type="hidden" name="pubren" value="${huiyuan.accountname}" />
						<input type="hidden" name="forwardurl"
							value="/admin/albummanager.do?actiontype=get&seedid=m102&forwardurl=/admin/albummanager.jsp" />
						<tr>
							<td colspan="4">${errormsg}</td>
						</tr>
						<tr>
							<td width="150px;" align="right">相册名:</td>
							<td><input name="name" placeholder="相册名"
								validate="{required:true,messages:{required:'请输入相册名'}}"
								value="${requestScope.album.name}" class="input-txt" type="text"
								id="txtName" /></td>
						</tr>
						<tr>
							<td align="right">分类:</td>
							<td><web:dropdownlist name="xtype" id="xtype"
									value="${requestScope.album.xtype}"
									datasource="${xtype_datasource}" textfieldname="name"
									valuefieldname="name">
								</web:dropdownlist></td>
						</tr>
						<tr>
							<td align="right">权限:</td>
							<td>
							
							<select name="privilege" id="ddlPrivilege" ltype="select">
									<option value="1">所有人可以查看</option>
									<option value="2">仅主人可以查看</option>
							</select>
							
							</td>
						</tr>
					
					
						<tr>
							<td align="right">相册描述:</td>
							<td colspan="3"><textarea name="des" rows="4" id="txtDes"
									style="width:98%;height:100px;" validate="{required:true}">${requestScope.album.des}</textarea>
							</td>
						</tr>
						<tr>
							<td colspan="4">
								
									<button class="orange-button">
										<i class="icon-ok icon-white"></i>提交
									</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
	
</body>
</html>
