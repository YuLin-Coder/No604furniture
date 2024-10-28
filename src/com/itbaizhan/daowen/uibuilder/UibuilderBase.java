package com.itbaizhan.daowen.uibuilder;

import java.text.MessageFormat;
import java.util.Iterator;
import java.util.List;


import com.itbaizhan.daowen.dal.DALBase;
import com.itbaizhan.daowen.util.NameUtil;

public  class UibuilderBase{

	private String lanmuclassname ="";

	public String getLanmuclassname() {
		return lanmuclassname;
	}

	public void setLanmuclassname(String lanmuclassname) {
		this.lanmuclassname = lanmuclassname;
	}
	private String textfieldname;

	private  String imagefieldname;

	private  String tablename="";


	public UibuilderBase(String tablename, String lanmuclassname,String textfieldname,String imagefieldname){
		this.tablename=tablename;
		this.lanmuclassname=lanmuclassname;
		this.textfieldname=textfieldname;
		this.imagefieldname=imagefieldname;
	}

	/**
	 *
	 * @param topcount
	 * @param lanmudes
	 * @return
	 */
	public  String buildImageLanmu(String filter,int topcount,String  lanmudes){
		List list=null;
		if(topcount>0)
			list=DALBase.getTopList(tablename, filter, topcount);
		else
			list=DALBase.getEntity(tablename, filter);
		return buildImageLanmu(list, lanmudes);
	}



	/**
	 *
	 * @param topcount
	 * @param lanmudes
	 * @return
	 */
	public  String buildTextLanmu(String filter,int topcount,String  lanmudes){
		List list=DALBase.getTopList(tablename, filter, topcount);
		return buildTextLanmu(list, lanmudes);
	}

	/**
	 *
	 * @param list  构建数据源
	 * @param lanmudes  栏目描述信息
	 * @return
	 */
	public String buildImageLanmu(List list,String lanmudes )
	{
		StringBuffer sb=new StringBuffer();
		int i=0;

		sb.append(MessageFormat.format("<div class=\"{0}\">",lanmuclassname));
		sb.append("\r\n");
		//栏目标题
		sb.append(MessageFormat.format("<div class=\"title\"><strong>{0}</strong></div>",lanmudes));
		//
		sb.append("<div class=\"content\">");
		sb.append("<div class=\"image-items\">");
		for(Iterator iterator = list.iterator();iterator.hasNext();){
			Object object=iterator.next();

			sb.append(" <div class=\"image-item image-size\">");
			sb.append("\r\n");
			String id="";
			String texfieldvalue="";
			String imagefieldvalue="";
			try {
				id = object.getClass().getMethod("get"+NameUtil.toFirstUpper("id"), null).invoke(object, null).toString();
				texfieldvalue=object.getClass().getMethod("get"+NameUtil.toFirstUpper(textfieldname), null).invoke(object, null).toString();
				imagefieldvalue=object.getClass().getMethod("get"+NameUtil.toFirstUpper(imagefieldname), null).invoke(object, null).toString();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			sb.append(MessageFormat.format("<a href=\"{0}info.jsp?id={1}\">",tablename,id));
			sb.append(MessageFormat.format("<img src=\"{0}\"/> ",imagefieldvalue));
			sb.append("</a>");
			sb.append("\r\n");
			sb.append(MessageFormat.format("<div class=\"text-info\"><a href=\"{0}info.jsp?id={1}\">{2}</a></div>",tablename,id,texfieldvalue));
			//end image-item
			sb.append("</div>");


			i++;
		}
		//end of images-items
		sb.append("</div>");
		//end of content
		sb.append("</div>");
		sb.append("\r\n");
		//end of lanmu
		sb.append("</div>");
		return sb.toString();
	}
	/**
	 *
	 * @param list  构建数据源
	 * @param lanmudes  栏目描述信息
	 * @return
	 */
	public String buildTextLanmu(List list,String lanmudes )
	{
		StringBuffer sb=new StringBuffer();
		int i=0;

		sb.append(MessageFormat.format("<div class=\"{0}\">",lanmuclassname));
		sb.append("\r\n");
		//栏目标题
		sb.append(MessageFormat.format("<div class=\"title\"><strong>{0}</strong></div>",lanmudes));
		//
		sb.append("<div class=\"content\">");
		sb.append("<ul>");
		for(Iterator iterator = list.iterator();iterator.hasNext();){
			Object object=iterator.next();

			sb.append(" <li >");
			sb.append("\r\n");
			String id="";
			String texfieldvalue="";
			String imagefieldvalue="";
			try {
				id = object.getClass().getMethod("get"+NameUtil.toFirstUpper("id"), null).invoke(object, null).toString();
				texfieldvalue=object.getClass().getMethod("get"+NameUtil.toFirstUpper(textfieldname), null).invoke(object, null).toString();
				imagefieldvalue=object.getClass().getMethod("get"+NameUtil.toFirstUpper(imagefieldname), null).invoke(object, null).toString();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			sb.append(MessageFormat.format("<a href=\"{0}info.jsp?id={1}\">",tablename,id));
			sb.append(MessageFormat.format("{0} ",texfieldvalue));
			sb.append("</a>");
			sb.append("\r\n");

			//end text-item
			sb.append("</li>");


			i++;
		}
		//end of text-items
		sb.append("</ul>");
		//end of content
		sb.append("</div>");
		sb.append("\r\n");
		//end of lanmu
		sb.append("</div>");
		return sb.toString();
	}



}
