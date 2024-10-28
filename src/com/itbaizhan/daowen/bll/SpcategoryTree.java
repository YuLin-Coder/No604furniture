package com.itbaizhan.daowen.bll;

import com.itbaizhan.daowen.dal.DALBase;
import com.itbaizhan.daowen.entity.Lanmu;
import com.itbaizhan.daowen.entity.Spcategory;


public class SpcategoryTree extends RecursionTree<Spcategory> {

	public SpcategoryTree(){
	
		setTextfieldname("mingcheng");
		
	}
	
	 public void toNonLeaf(String id){
		   
		   Spcategory m=(Spcategory)DALBase.load("spcategory", "where id="+id);
		    if(m!=null)
		    {
			   // m.setIsleaf(0);
			    DALBase.update(m);
		    }
	  }
	
	
	
}
