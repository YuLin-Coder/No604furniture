package com.itbaizhan.daowen.util;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.Enumeration;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

/*******************************************************************************
 *
 * @author daowen
 *
 * 分页控件实现页面分页功能
 *
 * 分页控件由页面描述信息进行描述分页元数据包括 分页尺寸、总记录数、当前页
 *
 */
public class DaowenPagerTag extends TagSupport {

	/**
	 * 当前分页数据源描述名称
	 */
	private String metalname = "pagermetal";// 存放数据实体的名字

	/***************************************************************************
	 * 当前页选中页样式
	 */
	private String currentpageclass = "current";

	/***
	 * 控件样式
	 *
	 */
	private  String  cssclass="page";


	/**
	 * 分页控件ID
	 */
	private  String id="pager1";



	private  String attcheform;


	/***
	 * 事件自动处理
	 * **/
	private  String autoeventhandler="true";


	@Override
	public int doStartTag() {

		JspWriter out = this.pageContext.getOut();



		String tags = getRender();

		try {
			out.write(tags);
		} catch (IOException e) {

			e.printStackTrace();
		}

		return this.SKIP_BODY;
	}

	private String getRender() {
		// 获取分页描述
		Object pm = pageContext.getRequest().getAttribute(getMetalname());

		if (pm == null)
			return "没有绑定分页数据源";


		PagerMetal pager = (PagerMetal) pm;

		StringBuffer sb = new StringBuffer();
		// 分页开始
		sb.append(MessageFormat.format("<div class=\"{0}\">\r\n",this.getCssclass()));



		// 分页总页数开始
		sb.append("<div class=\"page_num\">\r\n");

		// 获取总页数总记录数
		sb.append(MessageFormat.format("共{0}条-{1}页-每页{2}条\r\n", pager.getTotalcount(),
				pager.getTotalPages(),pager.getPagesize()));
		// 分页总页数结束
		sb.append("</div>");

		// 分页索引开始
		sb.append("<div class=\"manu\">\r\n");

		for (int i = 0; i < pager.getTotalPages(); i++) {
			if ((i + 1) == pager.getCurpageindex())
				sb.append(MessageFormat.format("<a class=\"{1} daowenpager-pagebutton\" pageindex=\"{0}\" >{0}</a>\r\n", i+1,
						getCurrentpageclass()));
			else
				sb.append(MessageFormat.format("<a pageindex=\"{0}\" class=\"daowenpager-pagebutton\">{0}</a>\r\n", i + 1));
		}
		//sb.append("<input type=\"hidden\" id=\"currentpageindex\" name=\"currentpageindex\"/>\r\n");

		sb.append("<input id=\"daowenpager_txtgopage\" type=\"text\" style=\"width: 30px\" value=\"1\">\r\n");

		sb.append("<a  class=\"next daowenpager-btngopage\" href=\"#\" >跳转到</a>\r\n");

		// 分页索引结束
		sb.append("</div>\r\n");

		//获取请求参数
		sb.append(this.getRequestParams());



		// 分页结束
		sb.append("</div>\r\n");

		String auto=getAutoeventhandler();

		if(auto.equals("true")){
			//事件处理
			sb.append(eventHandler());
		}


		return sb.toString();
	}


	private String eventHandler(){


		StringBuffer sb=new StringBuffer();

		/****
		 *  分页控件提交脚本
		 *
		 * ****/
		sb.append("<script type=\"text/javascript\">\r\n");
		sb.append("       $(function(){\r\n");

		sb.append(MessageFormat.format("            var attcheFormId=\"{0}\";\r\n  ",getAttcheform()));
		//定义附加form
		sb.append("            var   attcheForm;  \r\n");
		sb.append("            if(  attcheFormId !=\"null\"){\r\n");
		sb.append("                  attcheForm=$(\"#\"+attcheFormId);\r\n");
		sb.append("            }else");
		//如果没有绑定附加form 则采用当前最近父form
		sb.append("            attcheForm=$(this).closest(\"form\");\r\n");


		//页号索引提交开始

		sb.append("            $(\".daowenpager-pagebutton\").click(function(){\r\n");


		sb.append("               if(attcheForm.find(\"[name=currentpageindex]:hidden\").size()<=0)\r\n");

		sb.append("                 {\r\n");

		//添加页面编号
		sb.append("                   attcheForm.append('<input type=\"hidden\" name=\"currentpageindex\"  value=\"'+$(this).attr(\"pageindex\")+'\"/>');\r\n");

		sb.append("                 }\r\n");
		//如果存在则直接赋予页号值
		sb.append("               else       ");

		sb.append("                   attcheForm.find(\"[name=currentpageindex]:hidden\").val( $(this).attr(\"pageindex\"));\r\n");
		//提交请求
		sb.append("               attcheForm[0].submit();\r\n");

		sb.append("            })\r\n");
		//页号提交结束


		//页面跳转
		sb.append("            $(\".daowenpager-btngopage\").click(function(){\r\n");


		sb.append("               if(attcheForm.find(\"[name=currentpageindex]:hidden\").size()<=0)\r\n");

		sb.append("                 {\r\n");

		//添加页面编号
		sb.append("                   attcheForm.append('<input type=\"hidden\" name=\"currentpageindex\"  value=\"'+$(\"#daowenpager_txtgopage\").val()+'\"/>');\r\n");

		sb.append("                 }\r\n");
		//如果存在则直接赋予页号值
		sb.append("               else       ");

		sb.append("                   attcheForm.find(\"[name=currentpageindex]:hidden\").val( $(\"#daowenpager_txtgopage\").val());\r\n");
		sb.append("                   attcheForm.submit()\r\n");
		//跳转结束
		sb.append("            })\r\n");

		//
		sb.append("       })     \r\n");
		sb.append("</script>\r\n");
		//脚本提交结束

		return sb.toString();


	}

	/***
	 * 请求参数绑定
	 * @return
	 */
	private  String getRequestParams(){


		StringBuffer sb=new StringBuffer();

		Enumeration  params=pageContext.getRequest().getParameterNames();
		while (params.hasMoreElements())
		{
			String paramname=params.nextElement().toString();
			String value=this.pageContext.getRequest().getParameter(paramname);

			sb.append(MessageFormat.format("<input type=\"hidden\" name=\"{0}\" value=\"{1}\"/>", paramname,value));


		}
		return sb.toString();



	}

	@Override
	public int doAfterBody() {

		return this.EVAL_PAGE;
	}

	public String getCurrentpageclass() {
		return currentpageclass;
	}

	public void setCurrentpageclass(String currentpageclass) {
		this.currentpageclass = currentpageclass;
	}

	public void setMetalname(String metalname) {
		this.metalname = metalname;
	}

	public String getMetalname() {
		return metalname;
	}

	public String getCssclass() {
		return cssclass;
	}

	public void setCssclass(String cssclass) {
		this.cssclass = cssclass;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAutoeventhandler() {
		return autoeventhandler;
	}

	public void setAutoeventhandler(String autoeventhandler) {
		this.autoeventhandler = autoeventhandler;
	}

	public String getAttcheform() {
		return attcheform;
	}

	public void setAttcheform(String attcheform) {
		this.attcheform = attcheform;
	}

}
