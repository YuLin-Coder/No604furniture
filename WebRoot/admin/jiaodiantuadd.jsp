<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%@ page import="com.itbaizhan.daowen.bll.*"%>
<%@ page import="com.itbaizhan.daowen.entity.*"%>
<%@page import="com.itbaizhan.daowen.dal.DALBase"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>

<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>焦点图</title>
    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/menu.css" rel="stylesheet" type="text/css" />
    
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
<link href="<%=SystemParam.getSiteRoot()%>/uploadifyv3.1/uploadify.css"
	rel="stylesheet" type="text/css" />
<script
	src="<%=SystemParam.getSiteRoot()%>/uploadifyv3.1/jquery.uploadify-3.1.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="<%=SystemParam.getSiteRoot()%>/webui/jquery-form/jquery.form.js"></script>
<script type="text/javascript"
	src="<%=SystemParam.getSiteRoot()%>/editor/kindeditor-min.js"></script>
<script type="text/javascript"
	src="<%=SystemParam.getSiteRoot()%>/editor/lang/zh_CN.js"></script>
<link rel="stylesheet"
	href="<%=SystemParam.getSiteRoot()%>/webui/jqueryui/themes/base/jquery.ui.all.css"
	type="text/css"></link>
<script type="text/javascript"
	src="<%=SystemParam.getSiteRoot()%>/webui/jqueryui/ui/jquery-ui.js"></script>
<script type="text/javascript"
	src="<%=SystemParam.getSiteRoot()%>/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
<script type="text/javascript">
        function initControl(){
			           $('#btnulTupian').uploadify({  
			                'formData': { 'folder': '<%=SystemParam.getSiteRoot()%>/Upload' },  
			                'buttonText': '选择图片',  
			                'buttonClass': 'browser',  
			                'removeCompleted': true,  
			                'swf': '<%=SystemParam.getSiteRoot()%>/uploadifyv3.1/uploadify.swf', 
			                'fileTypeExts':"*.jpg;*.gif;*.png;",
			                'auto':true, 
			                'removeTimeout':0,
			                'debug': false,  
			                'height': 15,  
			                'width':90,  
			                'uploader': '<%=SystemParam.getSiteRoot()%>/admin/uploadmanager.do',
			                 'fileSizelimit':'2048KB',
			                 'queueSizelimit':'5',
			                 'onUploadSuccess':function(file, data, response){
			                     $("#filelist").show();
			                     $("#imgTupian").attr("src","<%=SystemParam.getSiteRoot()%>/upload/temp/"+file.name);
                                 $("#hidTupian").val("<%=SystemParam.getSiteRoot()%>/upload/temp/"+ file.name);
							}
						});
		var imgtupiansrc = "${requestScope.jiaodiantu.tupian}";
		if (imgtupiansrc == "") {
			var url = "<%=SystemParam.getSiteRoot()%>/upload/nopic.jpg";
			$("#imgTupian").attr("src", url);
			$("#hidTupian").val(url);
		} else {
			$("#imgTupian").attr("src", imgtupiansrc);
			$("#hidTupian").val(imgtupiansrc);
		}
		//开始绑定
		//结束绑定
	}
	$(function() {
		initControl();
		$("#jiaodiantuForm").submit(function() {
			return true;
		})
	});
</script>
</head>
<body>
	
			<div class="search-title">
				<h2>
					焦点图管理-> <a
						href="<%=SystemParam.getSiteRoot()%>/admin/jiaodiantumanager.do?actiontype=load&seedid=102">新建焦点图</a>
				</h2>
				<div class="description"></div>
			</div>
			<form name="jiaodiantuform" method="post"
				action="<%=SystemParam.getSiteRoot()%>/admin/jiaodiantumanager.do"
				id="jiaodiantuForm">
				<table class="grid" cellspacing="1" width="100%">
					<input type="hidden" name="id" value="${id}" />
					<input type="hidden" name="seedid" value="${seedid}" />
					<input type="hidden" name="actiontype" value="${actiontype}" />
					<tr>
						
					    <td colspan="4" >
					    <img id="imgTupian" width="850px" height="200px"
							src="${requestScope.jiaodiantu.tupian}" />
							<div>
								<input type="file" name="upload" id="btnulTupian" />
							</div> <input type="hidden" id="hidTupian" name="tupian"
							value="${requestScope.jiaodiantu.tupian}" /></td>
					</tr>
					<tr>
					
					   <td align="right">标题:</td>
						<td><input name="title"
							value="${requestScope.jiaodiantu.title}" class="input-txt"
							type="text" id="txtTitle" />
					    </td>
					
						<td align="right">链接地址:</td>
						<td><input name="href"
							value="${requestScope.jiaodiantu.href}" class="input-txt"
							type="text" id="txtHref" /></td>
					</tr>
					<tr>
						<td align="right">类型:</td>
						<td><input type="radio" name="xtype" id="radXtype" value="站内"
							checked="checked">站内 <input type="radio" name="xtype"
								id="radXtype" value="站外">站外 
						</td>
					
						<td align="right">显示优先级:</td>
						<td><select name="pindex" id="ddlPindex" ltype="select">
								<option value="0">第一级</option>
								<option value="2">第二季</option>
								<option value="3">第三级</option>
								<option value="4">第四级</option>
								<option value="5">第五级</option>
						</select></td>
					</tr>
				</table>
				<div class="ui-button">
					<input type="submit" value="提交" id="Button1" class="ui-button-text" />
				</div>
			</form>
	
</body>
</html>
