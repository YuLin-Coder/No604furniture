package com.itbaizhan.daowen.webcontrol;

import java.io.IOException;
import java.text.MessageFormat;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;

/*******************************************************************************
 *
 * 列表选项卡
 *
 */
public class ListItem extends BodyTagSupport {

	private String value;

	/***************************************************************************
	 * 当前父控件是否绑定了数据源
	 *
	 * @return 绑定返回真 ，否则为假
	 *
	 */
	public ListItem(){

	}
	private Boolean hasBindingDatasource() {

		Object parent=getParent();

		if(parent==null)
			return false;

		String pclassname = getParent().getClass().getName();

		if(pclassname.equals("com.daowen.webcontrol.DropdownList"))
		{
			if(((DropdownList)getParent()).getDatasource()==null)
				return false;
			else
				return true;

		}
		if(pclassname.equals("com.daowen.webcontrol.RadioButtonList"))
		{
			if(((RadioButtonList)getParent()).getDatasource()==null)
				return false;
			else
				return true;

		}



		return false;
	}

	@Override
	public int doStartTag() {

		if (getParent() == null) {
			try {
				pageContext.getOut().write("");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return SKIP_BODY;
		}
		return EVAL_BODY_BUFFERED;
	}

	@Override
	public void setBodyContent(BodyContent bc) {
		super.setBodyContent(bc);

	}

	@Override
	public int doAfterBody() throws JspException {

		if (getParent() == null)
			return SKIP_BODY;

		String bodycontent="";

		JspWriter out=getBodyContent().getEnclosingWriter();
		// 父控件类名
		String pclassname = getParent().getClass().getName();

		System.out.println("parent control name=" + pclassname);

		// 如果父控件已经绑定数据源，那么当前控件设置数据项被覆盖
		if (hasBindingDatasource())

			return SKIP_BODY;
		//根据父控件的类型进行呈现数据选项
		if(pclassname.equals("com.daowen.webcontrol.DropdownList"))

			bodycontent=buildDropdownlistItems();

		if(pclassname.equals("com.daowen.webcontrol.RadioButtonList"))
		{
			String temtext=getBodyContent().getString();
			String temvalue=value==null?temtext:value;
			bodycontent=buildRadioButtonItem(temtext, temvalue);
		}
		try {

			out.write(bodycontent);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return SKIP_BODY;



	}


	/************
	 * 显示DropdownList 控件选项
	 */
	private String buildDropdownlistItems(){

		BodyContent bc = getBodyContent();


		StringBuffer sb = new StringBuffer();

		DropdownList parent=(DropdownList)getParent();

		String parentvalue = parent.getValue();


		String optionvalue="";
		String temvalue=value;


		if (temvalue != null)

			optionvalue = "value=\"" + temvalue + "\"";
		else
		{
			temvalue=bc.getString();
			optionvalue = "value=\"" + temvalue + "\"";
		}

		String select="";
		//如果当前选项卡为控件值则设置选择
		if(temvalue.equals(parentvalue))

			select=" selected=\"selected\" ";

		sb.append(MessageFormat.format("<option {1} {2} >{0}</option>", bc
				.getString(), optionvalue,select));

		return sb.toString();


	}
	private String buildRadioButtonItem(String text,String value){

		StringBuffer sb=new StringBuffer();

		RadioButtonList rbl=(RadioButtonList)getParent();
		if(rbl==null)
			return "";

		String name=rbl.getName();

		//值属性
		String valueattr="";
		if(valueattr!=null){
			valueattr=" value=\""+value+"\"";
		}
		//check属性
		String checkattr="";

		if(this.value!=null&&this.value.equals(value))
			checkattr=" checked=\"checked\"";
		String nameattr="";

		if(name!=null)
			nameattr=" name=\""+name+"\"";

		sb.append(MessageFormat.format("<input {0} type=\"radio\"  {1}  {2} />{3}",nameattr,valueattr,checkattr,text));



		return sb.toString();

	}

	@Override
	public int doEndTag() {
		return EVAL_PAGE;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

}
