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
  <title>商品</title>
    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    
    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/menu.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.9.0.js"></script>
     <link href="<%=SystemParam.getSiteRoot() %>/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="<%=SystemParam.getSiteRoot() %>/webui/easydropdown/themes/easydropdown.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/easydropdown/jquery.easydropdown.js" type="text/javascript"></script>  
    <script  type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validate.min.js"></script>
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
   <script type="text/javascript">
        function initControl(){
	  //开始绑定
                    //结束绑定
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
                                 $("#hidTupian").val("<%=SystemParam.getSiteRoot()%>/upload/temp/"+file.name);
			                  }
			             }); 
			          var imgtupiansrc="${requestScope.shangpin.tupian}";
				       if(imgtupiansrc==""){
				         var url="<%=SystemParam.getSiteRoot()%>/upload/nopic.jpg";
				         $("#imgTupian").attr("src",url);
				         $("#hidTupian").val(url);
				       }else
				       {
				          $("#imgTupian").attr("src",imgtupiansrc);
				          $("#hidTupian").val(imgtupiansrc); 
				       }
			            editor = KindEditor.create('textarea[name="jieshao"]', {
			            uploadJson : '../plusin/upload_json.jsp',
				        fileManagerJson : '../plusin/file_manager_json.jsp',
			            resizeType: 1,
				        allowFileManager: true
				       });
        }
        $(function ()
        {
            initControl();
            $.metadata.setType("attr","validate");
            var actiontype="${actiontype}";
            if(actiontype=="save"){
	            $("#shangpinForm").validate({
	            	rules:{
	            	  spno:{
	                  required:true,
	                   remote:{
	                      url:"<%=SystemParam.getSiteRoot()%>/admin/shangpinmanager.do",
	                      type:"POST",
	                      data:{
	                            spno: function(){
	                              return $("#spno").val();
	                            },
	                            actiontype:'hasExist'
	                      }//end data
	                  }//end remote
	               }//end spno
	            },messages:{
	            	spno:'商品编号系统已经存在'
	            }});
            }else
            	{
            	   $("#shangpinForm").validate();
            	}
            var zuixin='${requestScope.shangpin.zuixin}';
            
            if(zuixin=='1'){
            	$("#txtZuixin").prop("checked",true);
            }
            var tuijian='${requestScope.shangpin.tuijian}';
            if(tuijian=='1'){
            	$("#txtTuijian").prop("checked",true);
            }
            
            var dazhe='${requestScope.shangpin.dazhe}';
            if(dazhe=='1'){
            	$("#txtDazhe").prop("checked",true);
            }
            var hot='${requestScope.shangpin.hot}';
            if(hot=='1'){
            	$("#txtHot").prop("checked",true);
            }
            
            
            $("[name='sptypeid']").val($("#sptype").children('option:selected').val());
        	$("[name='sptype']").val($("#sptype").children('option:selected').text());
            $("#sptype").change(function(){
            	
            	$("[name='sptypeid']").val($(this).children('option:selected').val());
            	$("[name='sptype']").val($(this).children('option:selected').text());
            })
        });  
    </script>
</head>
<body>
	<div class="search-title">
		<h2>商品管理->新建商品</h2>
		<div class="description"></div>
	</div>
	<form name="shangpinform" method="post"
		action="<%=SystemParam.getSiteRoot()%>/admin/shangpinmanager.do"
		id="shangpinForm">
		<table class="grid" cellspacing="1" width="100%">
			<input type="hidden" name="id" value="${id}" />
			<input type="hidden" name="actiontype" value="${actiontype}" />
			<input type="hidden" name="seedid" value="${seedid}" />
			<input type="hidden" name="errorurl" value="/admin/shangpinadd.jsp" />
			<tr>
			     <td colspan="4">${errormsg}</td>
			</tr>
			<tr>
				<td align="right">名称:</td>
				<td><input name="name"
					validate="{required:true,messages:{required:'请输入名称'}}"
					value="${requestScope.shangpin.name}" class="input-txt" type="text"
					id="txtName" /></td>
				<td colspan="2" rowspan="6"><img id="imgTupian" width="200px"
					height="200px" src="${requestScope.shangpin.tupian}" />
					<div>
						<input type="file" name="upload" id="btnulTupian" />
					</div> <input type="hidden" id="hidTupian" name="tupian"
					value="${requestScope.shangpin.tupian}" /></td>
			</tr>
			<tr>
				<td align="right">商品编号:</td>
				<td><input name="spno"
					validate="{required:true,messages:{required:'请输入商品编号'}}"
					value="${requestScope.shangpin.spno}" class="input-txt" type="text"
					id="spno" />
				</td>
			</tr>
			<tr>
				<td align="right">商品类别:</td>
				<td><input type="hidden" name="sptype" /> <input type="hidden"
					name="sptypeid" /> <web:dropdownlist id="sptype"  cssclass="dropdown" 
						value="${requestScope.shangpin.sptypeid}"
						datasource="${sptype_datasource}" textfieldname="mingcheng"
						valuefieldname="id">
					</web:dropdownlist></td>
			</tr>

			<tr>
				<td align="right">价格:</td>
				<td><input name="jiage"
					validate="{required:true,number:true,messages:{required:'请输入价格',number:'请输入正确价格'}}"
					value="${requestScope.shangpin.jiage}" class="input-txt"
					type="text" id="txtJiage" /></td>
			</tr>
			<tr>
				<td align="right">会员价:</td>
				<td><input name="hyjia"
					validate="{required:true,digits:true,messages:{required:'请输入会员价',digits:'请输入正确价格'}}"
					value="${requestScope.shangpin.hyjia}" class="input-txt"
					type="text" id="txtHyjia" /></td>
			</tr>
			<tr>
				<td align="right">标签:</td>
				<td><input name="dazhe" value="1" type="checkbox"
					id="txtDazhe" /> 打折 <input name="tuijian" value="1"
					type="checkbox" id="txtTuijian" /> 推荐 
					<input name="zuixin" value="1" type="checkbox" id="txtZuixin" />最新
					<input name="hot" value="1" type="checkbox" id="txtHot" />热销商品
				</td>
			</tr>


			<tr>
				<td align="right">介绍:</td>
				<td colspan="3"><textarea name="jieshao" id="txtJieshao"
						style="width:98%;height:400px;">${requestScope.shangpin.jieshao}</textarea>
				</td>
			</tr>
		</table>
		<div class="ui-button">
			<input type="submit" value="提交" id="Button1" class="ui-button-text" />
		</div>
	</form>
</body>
</html>
