<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.itbaizhan.daowen.bll.*"%>
<%
   String path = request.getContextPath();
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">

    $(function(){
    
         $(".btn-exit").click(function(){
       
                
                          top.$.dialog({
                             title:'系统提示',
                             lock:true,
                             content: "你确定退出系统？",
                             icon: 'warning',
                             ok:function(){
                              
                              
                               this.close();
                               
                                $.ajax({
                                      url:"<%=SystemParam.getSiteRoot()%>/admin/usersmanager.do?actiontype=logout",
                                      method:'post',
                                                                      
                                      success:function(data){
                                       
                                          window.location.reload();
                                          
                                      },
                                      error:function(XMLHttpRequest, textStatus, errorThrown){
                                         alert(XMLHttpRequest.status+errorThrown);
                                     }
                                  });
                              
                               
                                return false;
                               
                                
                             },//ok end
                             cancel:function(){
                               this.close();
                               return false;
                             }
                          
                          })
   
       
       })
    
    })

</script>
<link rel="shortcut icon" href="<%=basePath %>/admin/images/favicon.ico" type="image/x-icon" />
<div class="sys-head">
    
    <div class="fn-left">
         <div style="font-size: 28px; color: White; font-weight: bold; width:400px; line-height:30px; font-family:tahoma, arial, Microsoft YaHei, Hiragino Sans GB; padding: 15px 10px;" >
                              宠物网站后台
            
        </div>
   
   </div>
    <div class="fn-left">
       <div class="current-user">
                                欢迎你:${adminuser.username} 
          
          <a  href="<%=SystemParam.getSiteRoot() %>/admin/login.jsp">退出</a>
          <a  href="<%=SystemParam.getSiteRoot() %>/e/index.jsp" target="_blank">网站预览</a>
          
       </div>
       
       
    </div>
    <div class="fn-clear"></div>
    
</div>


