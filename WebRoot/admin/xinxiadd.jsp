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

<title>资讯信息</title>
 <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
 
<script type="text/javascript"
	src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.9.0.js"></script>
  <script  type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validate.min.js"></script>
  <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.metadata.js" ></script>
  <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/messages_cn.js" ></script>
<link href="<%=SystemParam.getSiteRoot() %>/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
<script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/jquery.artDialog.source.js"
	type="text/javascript"></script>
<script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/iframeTools.source.js"
	type="text/javascript"></script>
<link href="<%=SystemParam.getSiteRoot() %>/webui/treetable/skin/jquery.treetable.css"
	rel="stylesheet" type="text/css" />
<link
	href="<%=SystemParam.getSiteRoot() %>/webui/treetable/skin/jquery.treetable.theme.default.css"
	rel="stylesheet" type="text/css" />
<script src="<%=SystemParam.getSiteRoot() %>/webui/treetable/js/jquery.treetable.js"
	type="text/javascript"></script>
<link href="<%=SystemParam.getSiteRoot() %>/uploadifyv3.1/uploadify.css"
	rel="stylesheet" type="text/css" />
<script src="<%=SystemParam.getSiteRoot() %>/uploadifyv3.1/jquery.uploadify-3.1.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="<%=SystemParam.getSiteRoot() %>/webui/jquery-form/jquery.form.js"></script>
<script type="text/javascript"
	src="<%=SystemParam.getSiteRoot() %>/editor/kindeditor-min.js"></script>
<script type="text/javascript"
	src="<%=SystemParam.getSiteRoot() %>/editor/lang/zh_CN.js"></script>
<link rel="stylesheet"
	href="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/themes/base/jquery.ui.all.css"
	type="text/css"></link>
<script type="text/javascript"
	src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/jquery-ui.js"></script>
<script type="text/javascript"
	src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
	
<script src="<%=SystemParam.getSiteRoot()%>/webui/combo/combo.js"
			type="text/javascript"></script>
	
<script type="text/javascript">

        function initControl(){
	                 $("#txtPubtime").datepicker({
                         dateFormat:'yy-mm-dd'
                      }).datepicker("setDate",new Date());
			            editor = KindEditor.create('textarea[name="dcontent"]', {
			             uploadJson : '../plusin/upload_json.jsp',
				         fileManagerJson : '../plusin/file_manager_json.jsp',
			            resizeType: 1,
				        allowFileManager: true
				       });
			           $('#btnulTupian2').uploadify({  
			                'formData': { 'folder': '<%=SystemParam.getSiteRoot()%>/Upload' },  
			                'buttonText': '选择图片',  
			                'buttonClass': 'browser',  
			                'removeCompleted': true,  
			                'swf': '<%=SystemParam.getSiteRoot()%>/uploadifyv3.1/uploadify.swf', 
			                'fileTypeExts':"*.jpg;*.jpeg;*.gif;*.png;",
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
			                     $("#imgTupian2").attr("src","<%=SystemParam.getSiteRoot()%>/upload/temp/"+file.name);
                                 $("#hidTupian2").val("<%=SystemParam.getSiteRoot()%>/upload/temp/"+file.name);
			                  }
			             }); 
			          var imgtupian2src="${requestScope.xinxi.tupian2}";
				       if(imgtupian2src==""){
				         var url="<%=SystemParam.getSiteRoot() %>/upload/nopic.jpg";
				         $("#imgTupian2").attr("src",url);
				         $("#hidTupian2").val(url);
				       }else
				       {
				          $("#imgTupian2").attr("src",imgtupian2src);
				          $("#hidTupian2").val(imgtupian2src); 
				       }
        }
        $(function ()
        {
            initControl();
            var tuijian='${xinxi.tuijian}';
            var zuixin='${xinxi.zuixin}';
            var hot='${xinxi.hot}';
            if(tuijian=='1'){
              $("#chkTuijian").prop("checked",true);
            }
            if(hot=='1'){
              
               $("#chkHot").prop("checked",true);
            }
            if(zuixin=='1'){
               $("#chkZuixin").prop("checked",true);
            }
            
            $("#xinxiForm").submit(function(){
                 return true;
            })
            $.metadata.setType("attr", "validate");
            $("#xinxiForm").validate();
            
        });  
    </script>
</head>
<body>
	
			<div class="search-title">
				<h2>
					新闻资讯-> 发布新闻资讯
				</h2>
				<div class="description"></div>
			</div>
			<form name="xinxiform" method="post"
				action="<%=SystemParam.getSiteRoot()%>/admin/xinximanager.do"
				id="xinxiForm">
				<table class="grid" cellspacing="1" width="100%">
					<input type="hidden" name="id" value="${id}" />
					<input type="hidden" name="actiontype" value="${actiontype}" />
					<input name="style" value="admin" type="hidden"  />
					<input name="pubren" type="hidden" value="${users.username}"  />
					
					<tr>
						<td width="15%" align="right">标题:</td>
						<td width="35%">
						<input name="title" validate="{required:true,messages:{required:'请输入内容'}}" value="${requestScope.xinxi.title}"
							class="input-txt" type="text" id="txtTitle" />
						    
					    </td>
					    <td width="*" colspan="2" rowspan="4">
					       <img id="imgTupian2" width="200px" height="200px"
							src="<%=SystemParam.getSiteRoot() %>/upload/nopic.jpg" />
							<div>
								<input type="file" name="upload" id="btnulTupian2" />
							</div> 
							<input type="hidden" id="hidTupian2" name="tupian2"
							value="<%=SystemParam.getSiteRoot() %>/upload/nopic.jpg"" />
					    </td>
					</tr>
					
					<tr>
					
					 <td align="right">
                                                                  所属栏目名：
                    </td>
                    <td>
                        <div class="search-form-item-content">
                            <a textfieldid="hidLanmuname" valuefieldid="hidLanmuid" window_width="800" window_height="400"
                                window_title="系统栏目" url="<%=SystemParam.getSiteRoot() %>/admin/lanmuchoose.jsp" class="ui-open-trigger ui-select-middle-trigger"
                                href="#" style="width: 120px;">栏目名称 </a>
                            <input name="lanmuid" validate="{required:true,messages:{required:'请选择栏目'}}" type="hidden" id="hidLanmuid" runat="server" value="${requestScope.xinxi.lanmuid}" />
                            <input name="lanmuming" type="hidden" id="hidLanmuname" runat="server" value="${requestScope.xinxi.lanmuming}" />
                        </div>
                    </td>
					</tr>
					
					<tr>
						<td align="right">来源:</td>
						<td>
						
						<input name="laiyuan"  
							value="${requestScope.xinxi.laiyuan}" checked="checked"
							type="radio" value="站内"/> 站内
						<input name="laiyuan"  
							value="${requestScope.xinxi.laiyuan}" type="radio" value="站外"/> 站外	
							
						
						</td>
					</tr>
					
					
					<tr>
						<td align="right">标签:</td>
						<td>
						 推荐: <input name="tuijian" id="chkTuijian" value="${requestScope.xinxi.tuijian}" 
							type="checkbox"  />
						热点：<input name="hot" id="chkHot" value="${requestScope.xinxi.hot}" 
							type="checkbox"  />
						最新：<input name="zuixin" id="chkZuixin" value="${requestScope.xinxi.zuixin}" 
							type="checkbox"  />
						 </td>
					</tr>
					
					<tr>
						<td align="right">内容:</td>
						<td colspan="3"><textarea name="dcontent" id="txtDcontent"
								style="width:98%;height:400px;">${requestScope.xinxi.dcontent}</textarea>
						</td>
					</tr>
				</table>
				<div style="height:50px;padding-left:130px;">
				<div  class="ui-button">
					<input type="submit" value="提交" id="Button1" class="ui-button-text" />
				</div>
				</div>
				
			</form>
		
</body>
</html>
