package com.itbaizhan.daowen.bll;

import java.lang.reflect.InvocationTargetException;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;

import com.itbaizhan.daowen.dal.DALBase;
import com.itbaizhan.daowen.util.NameUtil;
/**
 *
 * @author Daowen
 *
 *  递归树完成系统的导航分类 功能
 *
 *  时间:2014-01-17
 *
 */
public class RecursionTree<T> implements IRecursionTree<T>{


	public static int ROOTID=0;

	private String idfieldname="id";
	private String parentidfieldname="parentid";
	private String textfieldname="";

	private String isleaffieldname="isleaf";

	public String getIdfieldname() {
		return idfieldname;
	}

	public void setIdfieldname(String idfieldname) {
		this.idfieldname = idfieldname;
	}

	public String getParentidfieldname() {
		return parentidfieldname;
	}

	public void setParentidfieldname(String parentidfieldname) {
		this.parentidfieldname = parentidfieldname;
	}

	public String getTextfieldname() {
		return textfieldname;
	}

	public void setTextfieldname(String textfieldname) {
		this.textfieldname = textfieldname;
	}

	public String getIsleaffieldname() {
		return isleaffieldname;
	}

	public void setIsleaffieldname(String isleaffieldname) {
		this.isleaffieldname = isleaffieldname;
	}

	/****
	 *
	 * @param tablename
	 * @param parentid
	 * @return 返回树资源
	 */
	public   List<T> getTree(String tablename,int parentid){

		String filter=MessageFormat.format(" where {0}={1}", getParentidfieldname(),parentid);

		//获取
		List<T> list=DALBase.getEntity(tablename, filter);
		List<T> list2=new ArrayList<T>();

		for(T t : list)
		{
			//加入元素
			list2.add(t);
			try {

				int temid=(Integer)t.getClass().getMethod("get"+NameUtil.toFirstUpper(idfieldname), null).invoke(t, null);
				int temisleaf=(Integer) t.getClass().getMethod("get"+NameUtil.toFirstUpper(isleaffieldname), null).invoke(t, null);

				//如果不是叶子节点
				if(temisleaf==0){

					List<T> temchilds=getTree(tablename, temid);

					list2.addAll(temchilds);
				}


			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


		}


		return list2;
	}


	/*
	 * 获取类别显示文本
	 * **/

	public  String getShowText(String tablename, int id){


		String text="";
		if(id==ROOTID)
			return "系统根路径 ";

		try {

			T  t=(T)DALBase.load(tablename, MessageFormat.format("where {0}={1}",getIdfieldname(),id));

			text=t.getClass().getMethod("get"+NameUtil.toFirstUpper(getTextfieldname()),null).invoke(t, null).toString();


			int parentid=(Integer)t.getClass().getMethod("get"+NameUtil.toFirstUpper(getParentidfieldname()), null).invoke(t, null);

			if(parentid!=ROOTID)
			{
				text=getShowText(tablename,parentid)+text;
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
		return text;


	}

	public void deleteLeafNode(String tablename,int id){


		T t=(T)DALBase.load(tablename, MessageFormat.format("where {0}={1}",getIdfieldname(),id));

		int res=DALBase.delete(tablename, MessageFormat.format("where {0}={1}",getIdfieldname(),id));

		if(res!=-1){

			try {

				int parentid=(Integer)t.getClass().getMethod("get"+NameUtil.toFirstUpper(getParentidfieldname()), null).invoke(t, null);
				if(parentid!=ROOTID)
				{
					int parentchilds=DALBase.getRecordCount(tablename, MessageFormat.format("where {0}={1}",getParentidfieldname(),parentid));

					//如果父节点没有了元素则更新为叶子节点
					if(parentchilds==0)
					{
						T parentnode=(T)DALBase.load(tablename, MessageFormat.format("where {0}={1}",getIdfieldname(),parentid));
						parentnode.getClass().getMethod("set"+NameUtil.toFirstUpper(getIsleaffieldname()), int.class).invoke(parentnode, 1);
						DALBase.update(parentnode);
					}

				}

			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}



		}



	}

	public Boolean saveTreeNode(T t){

		Boolean result=DALBase.save(t);
		if(!result)
			return false;
		try {

			int parentid=(Integer)t.getClass().getMethod("get"+NameUtil.toFirstUpper(getParentidfieldname()), null).invoke(t, null);

			T parentnode=(T)DALBase.load(t.getClass(),parentid);

			if(parentnode!=null)
			{
				System.out.println("执行叶子节点反射");
				parentnode.getClass().getMethod("set"+NameUtil.toFirstUpper(getIsleaffieldname()), int.class).invoke(parentnode, 0);
				return DALBase.update(parentnode);
			}
			else {
				return false;
			}

		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;

	}





}
