package com.itbaizhan.daowen.bll;

import java.text.MessageFormat;
import java.util.Iterator;
import java.util.List;

import com.itbaizhan.daowen.dal.DALBase;
import com.itbaizhan.daowen.entity.Jiaodiantu;
import com.itbaizhan.daowen.entity.Notice;

public class FocusgraphicBLL {

	public static String getFocusgraphic()
	{
		StringBuffer sb = new StringBuffer();
		StringBuffer imagessb=new StringBuffer();
		StringBuffer titlesb=new StringBuffer();
		sb.append("<div class=\"carousel\" >");
		sb.append("<div class=\"car-big-picture\">");

		List<Jiaodiantu> list = DALBase.getTopList("jiaodiantu", "", 10);
		int i=0;
		for (Iterator<Jiaodiantu> it = list.iterator(); it.hasNext();) {
			Jiaodiantu n = it.next();
			String style="";
			if(i++==0){
				style=" style='display:block;'";
			}
			imagessb.append(MessageFormat.format(
					"<a target=\"_blank\" href=''{0}''><img  {2}  src=\"{1}\"></a>",
					n.getHref(), n.getTupian(),style));
			imagessb.append("\r\n");

			titlesb.append(MessageFormat.format("<p>{0}</p>",n.getTitle()));


		}
		sb.append(imagessb);
		sb.append("</div>");

		sb.append("\r\n");
		sb.append("<div class=\"car_click\">");
		//БъЬт

		sb.append("<div class=\"car_c_title\">");
		sb.append(titlesb);
		sb.append("</div>");

		//аЁЭМ
		sb.append("<div class=\"car_c_smallpic\">");

		sb.append("<input class=\"car_c_inpt1\" type=\"button\"/>");

		sb.append(imagessb);

		sb.append("<input class=\"car_c_inpt2\" type=\"button\"/>");

		sb.append("</div>");
		//car_click
		sb.append("</div>");


		//end carousel
		sb.append("</div>");


		return sb.toString();

	}

}
