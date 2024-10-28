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
  <title>站点导航</title>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="<%=SystemParam.getSiteRoot() %>/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script  type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/messages_cn.js" ></script>
	    <link href="<%=SystemParam.getSiteRoot() %>/webui/easydropdown/themes/easydropdown.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/easydropdown/jquery.easydropdown.js" type="text/javascript"></script>    
    <link href="<%=SystemParam.getSiteRoot() %>/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
    <script src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
     <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript">
        function initControl(){
        }
        $(function ()
        {
            initControl();
            $.metadata.setType("attr","validate");
            $("#sitenavForm").validate();
        });  
    </script>
</head>
<body>
		 <div class="search-title">
<h2>
	                      新建站点导航
	                </h2>
	                <div class="description">
	                </div>
              </div>
				    <form name="sitenavform"  method="post" action="<%=SystemParam.getSiteRoot()%>/admin/sitenavmanager.do"  id="sitenavForm">
				        <table class="grid" cellspacing="1" width="100%">
						        <input type="hidden" name="id" value="${id}" />
						        <input type="hidden" name="actiontype" value="${actiontype}" />
						         <input type="hidden" name="seedid" value="${seedid}" />
						         <input type="hidden" name="errorurl" value="/admin/sitenavadd.jsp" />
						        <input type="hidden" name="forwardurl" value="/admin/sitenavmanager.do?actiontype=get&forwardurl=/admin/sitenavmanager.jsp" />
						        <tr>
								  <td colspan="4">
								      ${errormsg}
								  </td>
								</tr>
											   <tr>
											   <td align="right" >标题:</td>
											   <td>
												   <input name="title" placeholder="标题" validate="{required:true,messages:{required:'请输入标题'}}" value="${requestScope.sitenav.title}" class="input-txt" type="text" id="txtTitle"  />
												</td>
											   </tr>
											   <tr>
											   <td align="right" >连接:</td>
											   <td>
												   <input name="href" placeholder="连接" validate="{required:true,messages:{required:'请输入连接'}}" value="${requestScope.sitenav.href}" class="input-txt" type="text" id="txtHref"  />
												</td>
											   </tr>
											   <tr>
											   <td align="right" >序列号:</td>
											   <td>
												   <input name="sindex" placeholder="序列号" validate="{required:true,messages:{required:'请输入序列号'}}" value="${requestScope.sitenav.sindex}" class="input-txt" type="text" id="txtSindex"  />
												</td>
											   </tr>
						   <tr>
						       <td colspan="4">
						                <div class="ui-button">
											<button class="ui-button-text"><i class="icon-ok icon-white"></i>提交</button>
									     </div>
						       </td>
						   </tr>
				        </table>
		</form>
</body>
</html>
