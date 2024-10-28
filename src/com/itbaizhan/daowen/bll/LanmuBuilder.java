package com.itbaizhan.daowen.bll;

import java.text.MessageFormat;
import java.util.Iterator;
import java.util.List;

import com.itbaizhan.daowen.dal.DALBase;
import com.itbaizhan.daowen.entity.*;


public class LanmuBuilder {




	/**
	 * 新建栏目内容
	 * @param lanmuid 栏目编号
	 * @param classname 栏目名
	 * @return  返回栏目下所有的信息内容
	 */
	public String buildTextContent(int lanmuid,String classname,int topcount){

		StringBuffer sb=new StringBuffer();


		List<Xinxi> listxinxi=findXinxiByLanmu(lanmuid,topcount);

		sb.append(MessageFormat.format("<ul class=\"{0}\">", classname));
		sb.append("\r\n");

		for (Iterator<Xinxi> it = listxinxi.iterator(); it.hasNext();) {

			Xinxi xinxi = it.next();

			sb.append(MessageFormat.format("<li><a title=\"{1}\" href=\"xinxiinfo.jsp?id={0}\">{1}</a></li>", xinxi.getId(),xinxi.getTitle()));


		}
		sb.append("\r\n");
		sb.append("</ul>");

		return sb.toString();


	}

	/***
	 *
	 * @param lanmuid 栏目标题
	 * @param lanmuclass  栏目样式
	 * @return  返回栏目信息
	 */
	public String buildLanmu(int lanmuid,String lanmuclass){

		StringBuffer sb=new StringBuffer();
		Lanmu lm=(Lanmu)DALBase.load("lanmu", "where id="+lanmuid);
		if(lm==null)
			return "";
		sb.append(MessageFormat.format("<div class=\"{0}\">",lanmuclass));
		sb.append(MessageFormat.format("<div class=\"{0}\">{1}</div>",lanmuclass+"-title",lm.getTitle()));
		sb.append("\r\n");

		sb.append(buildTextContent(lanmuid, lanmuclass+"-content"));

		sb.append("</div>");
		return sb.toString();

	}

	public String buildLanmu(int lanmuid,String lanmuclass,int topcount){

		StringBuffer sb=new StringBuffer();
		Lanmu lm=(Lanmu)DALBase.load("lanmu", "where id="+lanmuid);
		if(lm==null)
			return "";
		sb.append(MessageFormat.format("<div class=\"{0}\">",lanmuclass));
		sb.append(MessageFormat.format("<div class=\"{0}\">{1}</div>",lanmuclass+"-title",lm.getTitle()));
		sb.append("\r\n");

		sb.append(buildTextContent(lanmuid, lanmuclass+"-content",topcount));

		sb.append("</div>");
		return sb.toString();

	}

	public String buildTextContent(int lanmuid,String classname){

		StringBuffer sb=new StringBuffer();


		List<Xinxi> listxinxi=findXinxiByLanmu(lanmuid);

		sb.append(MessageFormat.format("<ul class=\"{0}\">", classname));
		sb.append("\r\n");

		for (Iterator<Xinxi> it = listxinxi.iterator(); it.hasNext();) {

			Xinxi xinxi = it.next();

			sb.append(MessageFormat.format("<li><a title=\"{1}\" href=\"xinxiinfo.jsp?id={0}\">{1}</a></li>", xinxi.getId(),xinxi.getTitle()));


		}
		sb.append("\r\n");
		sb.append("</ul>");

		return sb.toString();
	}

	/**
	 *
	 * @param classname
	 * @return获取推荐资讯信息文本内容
	 */
	public String buildTuijianTextContent(String classname){

		StringBuffer sb=new StringBuffer();


		List<Xinxi> listxinxi=DALBase.getTopList("xinxi", "where tuijian=1 order by pubtime desc",10);

		sb.append(MessageFormat.format("<ul class=\"{0}\">", classname));
		sb.append("\r\n");

		for (Iterator<Xinxi> it = listxinxi.iterator(); it.hasNext();) {

			Xinxi xinxi = it.next();

			sb.append(MessageFormat.format("<li><a title=\"{1}\" href=\"xinxiinfo.jsp?id={0}\">{1}</a></li>", xinxi.getId(),xinxi.getTitle()));


		}
		sb.append("\r\n");
		sb.append("</ul>");

		return sb.toString();
	}



	/**
	 *
	 * @param classname
	 * @return获取推荐资讯信息文本内容
	 */
	public String buildZuixinTextContent(String classname){

		StringBuffer sb=new StringBuffer();


		List<Xinxi> listxinxi=DALBase.getTopList("xinxi", "where zuixin=1 order by pubtime desc",10);

		sb.append(MessageFormat.format("<ul class=\"{0}\">", classname));
		sb.append("\r\n");

		for (Iterator<Xinxi> it = listxinxi.iterator(); it.hasNext();) {

			Xinxi xinxi = it.next();

			sb.append(MessageFormat.format("<li><a title=\"{1}\" href=\"xinxiinfo.jsp?id={0}\">{1}</a></li>", xinxi.getId(),xinxi.getTitle()));


		}
		sb.append("\r\n");
		sb.append("</ul>");

		return sb.toString();
	}






	public String buildImgContent(int lanmuid,String classname,int topcount){
		StringBuffer sb=new StringBuffer();
		int i=0;

		sb.append(MessageFormat.format("<dd class=\"{0}\">",classname));
		sb.append("\r\n");

		List<Xinxi> listxinxi=findXinxiByLanmu(lanmuid,topcount);
		for(Iterator<Xinxi> iterator = listxinxi.iterator();iterator.hasNext();){
			Xinxi xinxi=iterator.next();


			sb.append(" <div class=\"picturebox\">");
			sb.append("\r\n");

			sb.append(MessageFormat.format("<a href=\"xinxiinfo.jsp?id={0}\">",xinxi.getId()));
			sb.append(MessageFormat.format("<img src=\"{0}\"/> ",xinxi.getTupian2()));
			sb.append("</a>");
			sb.append("\r\n");
			sb.append(MessageFormat.format("<span><a href=\"xinxiinfo.jsp?id={0}\">{1}</a></span>",xinxi.getId(),xinxi.getTitle()));

			sb.append("</div>");


			i++;
		}
		sb.append("</dd>");
		sb.append("\r\n");
		return sb.toString();
	}


	public  List<Xinxi> findXinxiByLanmu(int lanmuid){

		List<Xinxi> list=DALBase.runNativeSQL(MessageFormat.format("select * from  xinxi where lanmuid in (select id from lanmu where parentid={0}) or lanmuid={0} order by pubtime desc",lanmuid),Xinxi.class);

		return list;
	}

	public  List<Xinxi> findXinxiByLanmu(int lanmuid,int topcount){

		List<Xinxi> list=DALBase.runNativeSQL(MessageFormat.format("select  * from  xinxi where lanmuid in (select id from lanmu where parentid={0}) or lanmuid={0} order by pubtime desc limit {1}",lanmuid,topcount),Xinxi.class);

		return list;
	}





}
