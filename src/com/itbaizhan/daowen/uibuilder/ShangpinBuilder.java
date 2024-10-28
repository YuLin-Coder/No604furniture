package com.itbaizhan.daowen.uibuilder;

import java.text.MessageFormat;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;


import com.itbaizhan.daowen.dal.DALBase;
import com.itbaizhan.daowen.entity.*;
import com.itbaizhan.daowen.uibuilder.UibuilderBase;


public class ShangpinBuilder extends UibuilderBase {




	public ShangpinBuilder(){

		super("shangpin", "box", "name", "tupian");


	}
	public ShangpinBuilder(String cssclassname){

		super("shangpin", cssclassname, "name", "tupian");

	}
	/**
	 * 图片
	 * @param spcid
	 * @param maxcount
	 * @return
	 */
	public String buildImageShangpin(int spcid,int maxcount)
	{
		StringBuilder sb=new StringBuilder();
		Spcategory spcategory =(Spcategory)DALBase.load("spcategory", "where id="+spcid);
		if(spcategory==null)
			return "";

		List<Shangpin> shangpinlist=null;
		if(maxcount!=-1)
			shangpinlist=findBySpcateid(spcid,maxcount);
		else
			shangpinlist=findBySpcateid(spcid);
		//等到商品信息
		sb.append(buildImageLanmu(shangpinlist, spcategory.getMingcheng()));


		return sb.toString();

	}

	public String buildTextShangpin(int spcid,int maxcount)
	{
		StringBuilder sb=new StringBuilder();
		Spcategory spcategory =(Spcategory)DALBase.load("spcategory", "where id="+spcid);
		if(spcategory==null)
			return "";

		List<Shangpin> shangpinlist=null;
		if(maxcount!=-1)
			shangpinlist=findBySpcateid(spcid,maxcount);
		else
			shangpinlist=findBySpcateid(spcid);
		//等到商品信息
		sb.append(buildTextLanmu(shangpinlist, spcategory.getMingcheng()));


		return sb.toString();

	}


	public String  buildHotSale(){

		StringBuilder sb=new StringBuilder();

		List<Shangpin> shangpinlist=getHotSales();

		//等到商品信息
		sb.append(buildImageLanmu(shangpinlist, "热买商品推荐"));


		return sb.toString();

	}

	//推荐商品
	public String  buildRecomment(){

		StringBuilder sb=new StringBuilder();

		List<Shangpin> shangpinlist=getRecomment();

		//等到商品信息
		sb.append(buildImageLanmu(shangpinlist, "精品推荐"));
		return sb.toString();
	}

	//最新商品
	public String  buildLastest(){

		StringBuilder sb=new StringBuilder();

		List<Shangpin> shangpinlist=getNewest();

		//得到最新商品信息
		sb.append(buildImageLanmu(shangpinlist, "新货上架"));
		return sb.toString();
	}

	public String  buildViewedProduct(HttpServletRequest request){

		StringBuilder sb=new StringBuilder();
		//获取历史浏览
		List<String> ids=ProductViewHistory.HistoryView(request);
		String temids="";
		int i=0;
		for(String id : ids){
			temids+=id;
			if(i<ids.size()-1){
				temids+=",";
			}
			i++;

		}
		if(ids!=null&&ids.size()>0){
			List<Shangpin> shangpinlist=DALBase.getEntity("shangpin", " where id in ("+temids+")");

			//得到最新商品信息
			sb.append(buildImageLanmu(shangpinlist, "猜你喜欢的商品"));
		}
		return sb.toString();
	}

	public String search(String spname,String classname){

		StringBuffer sb=new StringBuffer();
		int i=0;

		sb.append(MessageFormat.format("<dd class=\"{0}\">",classname));
		sb.append("\r\n");

		List<Shangpin> listxinxi=findBySpname(spname);
		for(Iterator<Shangpin> iterator = listxinxi.iterator();iterator.hasNext();){

			Shangpin shangpin=iterator.next();


			sb.append(" <div class=\"picturebox\">");
			sb.append("\r\n");

			sb.append(MessageFormat.format("<a href=\"shangpininfo.jsp?id={0}\">",shangpin.getId()));
			sb.append(MessageFormat.format("<img src=\"{0}\"/> ",shangpin.getTupian()));
			sb.append("</a>");
			sb.append("\r\n");
			sb.append(MessageFormat.format("<span><a href=\"shangpininfo.jsp?id={0}\">{1}</a></span>",shangpin.getId(),shangpin.getName()));

			sb.append("</div>");


			i++;
		}
		sb.append("</dd>");
		sb.append("\r\n");
		return sb.toString();


	}

	private List<Shangpin> findBySpname(String spname) {

		List<Shangpin> list=DALBase.runNativeSQL(MessageFormat.format("select * from  shangpin where name like ''%{0}%'' ",spname),Shangpin.class);

		return list;

	}



	private  List<Shangpin> findBySpcateid(int spcid){

		List<Shangpin> list=DALBase.runNativeSQL(MessageFormat.format("select * from  shangpin where sptypeid={0} ",spcid),Shangpin.class);

		return list;
	}

	private  List<Shangpin> getHotSales(){

		List<Shangpin> list=DALBase.getEntity("shangpin"," where hot=1 ");

		return list;
	}

	private  List<Shangpin> getRecomment(){

		List<Shangpin> list=DALBase.getEntity("shangpin"," where tuijian=1 ");

		return list;
	}

	private  List<Shangpin> getNewest(){

		List<Shangpin> list=DALBase.getTopList("shangpin"," order by pubtime desc ",10);

		return list;
	}




	private  List<Shangpin> findBySpcateid(int spcid,int topcount){

		List<Shangpin> list=DALBase.runNativeSQL(MessageFormat.format("select  * from  shangpin where sptypeid={0} order by pubtime desc limit {1}",spcid,topcount),Shangpin.class);

		return list;
	}





}
