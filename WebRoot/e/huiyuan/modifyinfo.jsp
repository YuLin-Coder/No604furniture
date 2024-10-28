<%@page import="com.itbaizhan.daowen.bll.*"%>
<%@page import="com.itbaizhan.daowen.entity.*,com.itbaizhan.daowen.dal.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<%@ include file="law.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改信息</title>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/box.all.css" type="text/css"></link>

<script src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.5.2.min.js"
	type="text/javascript"></script>
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
     
          $(function(){
          
                 $('#btnulTouxiang').uploadify({  
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
			                     $("#imgTouxiang").attr("src","<%=SystemParam.getSiteRoot()%>/upload/temp/"+file.name);
                                 $("#hidTouxiang").val("<%=SystemParam.getSiteRoot()%>/upload/temp/"+file.name);
			                  }
			             }); 
			          var imgtouxiangsrc="${requestScope.huiyuan.touxiang}";
				       if(imgtouxiangsrc==""){
				         var url="<%=SystemParam.getSiteRoot()%>/e/images/nopic.jpg";
				         $("#imgTouxiang").attr("src",url);
				         $("#hidTouxiang").val(url);
				       }else
				       {
				          $("#imgTouxiang").attr("src",imgtouxiangsrc);
				          $("#hidTouxiang").val(imgtouxiangsrc); 
				       }
          
          })
          
          
    
    </script>



</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>

	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="<%=SystemParam.getSiteRoot() %>/e/index.jsp">首页</a> &gt;&gt;修改账户信息
		</div>
	</div>


	<div class="fn-clear"></div>

	<div class="wrap">

		<div class="main">

			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">
               <div >
				<form name="huiyuanform" method="post"
					action="<%=SystemParam.getSiteRoot()%>/admin/huiyuanmanager.do"
					id="huiyuanForm">
					<table class="grid" cellspacing="1" width="100%">
						<input type="hidden" name="id" value="${requestScope.huiyuan.id}" />
						<input type="hidden" name="actiontype" value="update" />
						<input type="hidden" name="forwardurl" value="/e/huiyuan/modifyinfores.jsp" />
						<tr>
							<td align="right">用户名:</td>
							<td><input name="accountname"
								value="${requestScope.huiyuan.accountname}" class="input-txt"
								type="text" id="txtAccountname" /></td>
						    <td  rowspan="5" colspan="7">
						         <img id="imgTouxiang" width="200px" height="200px"  src="${requestScope.huiyuan.touxiang}"/>
								<div>
									<input type="file" name="upload" id="btnulTouxiang" />
								</div>
								<input type="hidden" id="hidTouxiang" name="touxiang" value="${requestScope.huiyuan.touxiang}" />
							</td>
						</tr>
						
						
						<tr>
							<td align="right">昵称:</td>
							<td><input name="nickname"
								value="${requestScope.huiyuan.nickname}" class="input-txt"
								type="text" id="txtNickname" /></td>
						</tr>
						
								
						<tr>
							<td align="right">邮箱:</td>
							<td><input name="email"
								value="${requestScope.huiyuan.email}" class="input-txt"
								type="text" id="txtEmail" /></td>
						</tr>
						<tr>
							<td align="right">移动电话:</td>
							<td><input name="mobile"
								value="${requestScope.huiyuan.mobile}" class="input-txt"
								type="text" id="txtMobile" /></td>
						</tr>
						<tr>
							<td align="right">性别:</td>
							<td>
							      <input  type="radio"  name="sex" id="radSex"  value="男"  checked="checked" >男
							      <input type="radio"  name="sex" id="radSex"  value="女" >女
							</td>
						</tr>
						<tr>
							<td align="right">地址:</td>
							<td><input name="address"
								value="${requestScope.huiyuan.address}" class="input-txt"
								type="text" id="txtAddress" /></td>
						</tr>
						
						<tr>
							<td align="right">姓名:</td>
							<td><input name="name" value="${requestScope.huiyuan.name}"
								class="input-txt" type="text" id="txtName" /></td>
						</tr>
						<tr>
							<td align="right">职业:</td>
							<td><input name="zhiye"
								value="${requestScope.huiyuan.zhiye}" class="input-txt"
								type="text" id="txtZhiye" /></td>
						
							<td align="right">爱好:</td>
							<td><input name="aihao"
								value="${requestScope.huiyuan.aihao}" class="input-txt"
								type="text" id="txtAihao" /></td>
						</tr>
					
					</table>
					<div style="margin-left: 120px;">
						<input type="submit" value="提交" id="Button1"
							class="red-button" />
					</div>
				</form>
              </div>
			</div>
		</div>

	</div>



	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>