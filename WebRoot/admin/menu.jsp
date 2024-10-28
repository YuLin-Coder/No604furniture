<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.itbaizhan.daowen.bll.*"%>

<script type="text/javascript">
     
   $(function(){

	   var autoSize = function () {


           $("#side-menu").css("height", $(document).height() - $("#sys-head").height()-100);
           $("#side-menu").css("overflow-y","auto");
         
             

       }
       autoSize();
       //$(window).resize(autoSize);
       $("#side-menu  li dd a").click(function () {
           $("#side-menu  li dd a").removeClass("current");
           $(this).addClass("current");

       })
	})
</script>

<ul class="left-menu" id="side-menu" style="height:382px;overflow:scroll;">
	
	
	
	
	
	<li>
		<dl>
			<dt class="t1">
				<em></em>商品管理
			</dt>
			<dd>
				<a  target="main" href="<%=SystemParam.getSiteRoot() %>/admin/shangpinmanager.do?actiontype=get&seedid=201" target="main">商品管理</a>
			</dd>
			<dd>
				<a    target="main"  href="<%=SystemParam.getSiteRoot() %>/admin/shangpinmanager.do?actiontype=load&seedid=202">发布商品</a>
			</dd>
			
			<dd>
				<a   target="main"  target="main" href="<%=SystemParam.getSiteRoot() %>/admin/spcategorymanager.do?actiontype=get&forwardurl=/admin/spcategorytreemanager.jsp">商品类别管理</a>
			</dd>
			
			<dd>
				<a   target="main" href="<%=SystemParam.getSiteRoot() %>/admin/dingdanmanager.do?actiontype=get&seedid=204">订单管理</a>
			</dd>
			
		</dl>
	  </li>

	<li>
		<dl>
			<dt class="t3">
				<em></em>系统信息
			</dt>

            <dd>
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/xinximanager.do?actiontype=get&seedid=301">新闻资讯管理</a>
			</dd>
			<dd>
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/xinximanager.do?actiontype=load&seedid=302">发布新闻资讯</a>
			</dd>
			<dd >
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/lanmumanager.do?actiontype=get&seedid=303">新闻栏目管理</a>
			</dd>
			
			<dd>
				<a  target="main" href="<%=SystemParam.getSiteRoot() %>/admin/jiaodiantumanager.do?actiontype=get&seedid=305">焦点图管理</a>
			</dd>
			<dd>
				<a  target="main" href="<%=SystemParam.getSiteRoot() %>/admin/friendlinkmanager.do?actiontype=get&seedid=306">友情链接管理</a>
			</dd>
			<dd>
				<a  target="main" href="<%=SystemParam.getSiteRoot() %>/admin/leavewordmanager.do?actiontype=get&seedid=401">在线留言管理</a>
			</dd>
			<dd>
				<a  target="main" href="<%=SystemParam.getSiteRoot() %>/admin/commentmanager.do?actiontype=get&seedid=402">会员评论管理</a>
			</dd>
			
			<dd>
				<a   target="main" href="<%=SystemParam.getSiteRoot() %>/admin/indexcolumnsmanager.do?actiontype=get">首页栏目管理</a>
			</dd>
			<dd>
				<a   target="main" href="<%=SystemParam.getSiteRoot() %>/admin/sitenavmanager.do?actiontype=get">网站导航管理</a>
			</dd>
			<dd>
				<a   target="main" href="<%=SystemParam.getSiteRoot() %>/admin/sysconfigmanager.do?actiontype=get">网站信息设置</a>
			</dd>

		</dl>
	</li>
	
	<li>
		<dl>
			<dt class="t1">
				<em></em>用户管理
			</dt>
			<dd>
				<a  target="main"  href="<%=SystemParam.getSiteRoot() %>/admin/usersmanager.do?actiontype=get&seedid=101">用户管理</a>
		    </dd>
		    <dd>
				<a  target="main"  href="<%=SystemParam.getSiteRoot() %>/admin/huiyuanmanager.do?actiontype=get">会员管理</a>
			</dd>
			 <dd>
				<a  target="main"  href="<%=SystemParam.getSiteRoot() %>/admin/modifypw.jsp">修改密码</a>
			 </dd>
		</dl>
		</li>
	
	
</ul>
