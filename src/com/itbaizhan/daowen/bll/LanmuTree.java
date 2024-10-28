package com.itbaizhan.daowen.bll;

import com.itbaizhan.daowen.dal.DALBase;
import com.itbaizhan.daowen.entity.Lanmu;


public class LanmuTree extends RecursionTree<Lanmu> {

	public LanmuTree(){
	
		setTextfieldname("title");
		
	}
	
	 public void toNonLeaf(String id){
		   
		    Lanmu m=(Lanmu)DALBase.load("lanmu", "where id="+id);
		    if(m!=null)
		    {
			    m.setIsleaf(0);
			    DALBase.update(m);
		    }
	  }
	
	
	
}
