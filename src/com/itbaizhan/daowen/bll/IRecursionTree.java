package com.itbaizhan.daowen.bll;

import java.util.List;

public interface IRecursionTree<T> {

	
	public List<T>  getTree(String tableanme,int id);
	
	
	public String  getShowText(String tablename,int id);
	
	
	public  void  deleteLeafNode(String tablename,int id);
	
	public Boolean  saveTreeNode(T t);
	
	
	
}
