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
  <title>公告</title>
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
    <link href="<%=SystemParam.getSiteRoot() %>/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery-form/jquery.form.js"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
   <script type="text/javascript">
        function initControl(){
	$("#txtPubtime").datepicker({
                         dateFormat:'yy-mm-dd'
                      }).datepicker("setDate",new Date());
			            editor = KindEditor.create('textarea[name="dcontent"]', {
			            resizeType: 1,
				        allowFileManager: true
				       });
        }
        $(function ()
        {
            initControl();
            $("#noticeForm").submit(function(){
                 return true;
            })
        });  
    </script>
</head>
<body>
	
             <div class="search-title">
	                <h2>
	                       公告管理->  <a href="<%=SystemParam.getSiteRoot() %>/admin/noticemanager.do?actiontype=load&seedid=102">新建公告</a>
	                </h2>
                <div class="description">
                </div>
              </div>
				    <form name="noticeform" method="post" action="<%=SystemParam.getSiteRoot()%>/admin/noticemanager.do"  id="noticeForm">
				        <table class="grid" cellspacing="1" width="100%">
						        <input type="hidden" name="id" value="${id}" />
						        <input name="pubren" value="${adminuser.username}"  type="hidden" />
						        <input type="hidden" name="actiontype" value="${actiontype}" />
											   <tr>
											   <td align="right" >标题:</td>
											   <td>
												   <input name="title" value="${requestScope.notice.title}" class="input-txt" type="text" id="txtTitle"  />
												</td>
											   </tr>
											 
											 <tr>
											   <td align="right" >公告内容:</td>
											   <td colspan="3">
													<textarea   name="dcontent"   id="txtDcontent" style="width:100%;height:400px;"  >${requestScope.notice.dcontent}</textarea>
											   </td>
											 </tr>
				        </table>
		     <div class="ui-button">
				<input type="submit" value="提交" id="Button1" class="ui-button-text" /> 
		     </div>
		</form>
     
</body>
</html>
