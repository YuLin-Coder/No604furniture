package com.itbaizhan.daowen.dal;

import java.io.Serializable;
import java.math.BigInteger;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.MessageFormat;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.WebApplicationContext;




import com.itbaizhan.daowen.util.NameUtil;



public class DALBase {
	

	private static  Session session=null; 
	private  static  Session  getSession(){
		 
		  if(session==null||!session.isOpen())
		  {
			 
			 
		     ApplicationContext  context= new ClassPathXmlApplicationContext("applicationContext.xml");
		     SessionFactory  sf=(SessionFactory)context.getBean("sessionFactory");
		     session=sf.openSession();
		  }
		  return session;
		  
		
	}
	
	public static int  getMaxIndex(String tablename ,String pk) {

		    Session s=getSession();
		    
			Transaction t= s.beginTransaction();
		    Statement st=null;
			try {
				st = s.connection().createStatement();
			} catch (HibernateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    ResultSet rs=null;
			try {
				rs = st.executeQuery(String.format("select max(%s) max from %s",pk,tablename));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    
			t.commit();
			
			String max="0";
			try {
				if(rs.next())
					try {
						
						max=rs.getString("max");
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
	        System.out.println("maxindex="+max);
	        if(max==null)
	        	return 0;
	        else
	          return new Integer(max) ;
			
		}
    
	 /**@author daowen
	  * 
	  * @param  tablename 
	  * @Param  filter  
	  * 
	  * ***/
	 public static List getEntity(String tablename,String filter){
		     
		     Session s=getSession();
		     Transaction t=s.beginTransaction();
		     String classname=NameUtil.toFirstUpper(tablename);
		     String HQL=" from "+classname+" "+ (filter==null?"":filter);
		     System.out.println("HQL="+HQL);
		     List list=null;
		     try 
		     {
		    	 
			     
			     Query q=s.createQuery(HQL);
			     list= q.list();
			     t.commit();
			    
		     }catch(HibernateException e){
		    	 e.printStackTrace();
		    	System.out.print( e.getMessage());
		     }
		     return list;
		
	  }
	
	  public static Boolean save(Object o){
		  
		    Session s=getSession();
		    Transaction t=s.beginTransaction();
		    boolean status=true;
		    try 
		    {
			    s.save(o);
			   
			    s.flush();
			    
			    t.commit();
			   
		    }catch(HibernateException e){
		    	
		    	e.printStackTrace();
		        
		    	status=false;
		    }
		    return status;
		    
	  }
	  
	  public static Boolean update(Object o){
		  
		    Session s=getSession();
		    Transaction t=s.beginTransaction();
		    boolean status=true;
		    try 
		    {
			    s.update(o);
			   
			    s.flush();
			    
			    t.commit();
			   
		    }catch(HibernateException e){
		    	e.printStackTrace();
		    	status=false;
		    }
		    return status;
		    
	  }
	  /****/
	  public static Boolean delete(Object o){
		  
		    Session s=getSession();
		    Transaction t=s.beginTransaction();
		    
		    
		    boolean status=true;
		    try 
		    {
			    s.delete(o);
			    t.commit();
			    
		    }catch(HibernateException e){
		    	status=false;
		    }
		    return status;
		    
	  }
	  public static int delete(String tablename,String filter){
		  
		    Session s=getSession();
		    Transaction t=s.beginTransaction();
		    String HQL="delete from "+NameUtil.toFirstUpper(tablename)+ (filter==null?"":"  "+filter);
		    System.out.println("HQL ="+HQL);
		    SQLQuery q=s.createSQLQuery(HQL);
		    
		    int i=0;
		    
		  
		    try 
		    {
			    i= q.executeUpdate();
			    t.commit();
			   
		    }catch(HibernateException e){
		    	e.printStackTrace();
		    	System.out.println(tablename+e.getMessage());
		    	i=-1;
		    }
		    return i;
		    
	  }
	  
	  public static Object load(Class type,Object key){
		  
		  Session s=getSession();
		  Transaction t=s.beginTransaction();
		  Object o=null;
		  try{
		    o=s.load(type, (Serializable) key);
		  }catch(HibernateException e){
			  System.out.println(""+e.getMessage());
		  }
		  return o;
		  
	  }
	  
	  public static  Object load(String tablename,String filter){
		  List list=getEntity(tablename,filter);
		  if(list.isEmpty())
			  return null;
		  return list.get(0);
	  }
	  public static Boolean isExist(String tablename,String filter){
		  
		     List list=getEntity(tablename,filter);
		     if(list.isEmpty())
		    	 return false;
		     else
		    	 return true;
		    	 
		    		 
		  
	  }
	  /**
	   * 
	   * @author Daowen
	   * 
	   * 
	   * ʱ��:2013-12-04
	   * 
	   * 
	   * @param SQL ��ѯSQL 
	   * @param pageindex  ��ǰҳ
	   * @param pagesize    ҳ�ߴ�
	   * @return   ������Ҫ��ѯ��ҳ��¼
	   * 
	   * 
	   * 
	   */
	  public static List getRecords(String HQL,int pageindex,int pagesize){
		  
          Session session=getSession();
		  
		  Transaction  t=session.beginTransaction();
		
		  List list=null;
		  System.out.print("SQL="+HQL);
		  try
		  {
			  Query query=session.createQuery(HQL);
			  System.out.println("first="+((pageindex-1)*pagesize));
			  System.out.println("max="+(pageindex*pagesize-1));
			  list= query.setFirstResult((pageindex-1)*pagesize).setMaxResults(pagesize).list();
		      t.commit();
		  }catch(HibernateException e){
		       e.printStackTrace();
			   System.out.print("ϵͳ�����쳣"+ e.getMessage());
		 }
	    
		  return  list;
		  	  
		  
		  
	  }
	  
	  /***
	   * ��ȡ���ҳʵ��
	   * @param tablename  ����
	   * @param filter    ������
	   * @param pageindex  ��ǰҳ
	   * @param pagesize   ��ҳ�ߴ�
	   * @return    ��ҳ��¼
	   */
	  public static List  getPageEnity(String tablename,String filter,int pageindex,int pagesize){
		  
		  String SQL=MessageFormat.format(" from {0} {1} ",NameUtil.toFirstUpper(tablename),filter);
		  return getRecords(SQL,pageindex,pagesize);
		  
		  
	  }
	  /*****
	   * 
	   * 
	   * 
	   * @param tablename
	   * @param pageindex
	   * @param pagesize
	   * @return
	   */
	  public static List getPageEnity(String tablename,int pageindex,int pagesize){
		  
		  String SQL=MessageFormat.format(" form {0}  ",NameUtil.toFirstUpper(tablename));
		  return getRecords(SQL,pageindex,pagesize);
		  
	  }
	  
	  
	  /**
	   * ��ȡ��¼����
	   * @param tablename
	   * @param filter
	   * @return
	   */
	  public static int getRecordCount(String tablename,String filter){
		 
		  Session session=getSession();
		   
		 
		  Transaction t=session.beginTransaction();
		  
		  SQLQuery query=session.createSQLQuery(MessageFormat.format("select count(*) total from {0} {1}",NameUtil.toFirstUpper(tablename),filter));
		  
		  Number count=(Number) query.uniqueResult();
		  
		  t.commit();
		 
		  
		  return count.intValue();
	  }
	  
	  
	  public static List runNativeSQL(String SQL){
			 
		  Session session=getSession();
		   
		 
		  Transaction t=session.beginTransaction();
		  
		  SQLQuery query=session.createSQLQuery(SQL);
		  
		  List list=query.list();
		  t.commit();
		 
		  return list;
	  }
	  public static List runNativeSQL(String SQL,Class c){
			 
		  Session session=getSession();
		   
		 
		  Transaction t=session.beginTransaction();
		  
		  SQLQuery query=session.createSQLQuery(SQL);
		  
		  List list=query.addEntity(c).list();
		  t.commit();
		 
		  return list;
	  }
	  

	public static List getTopList(String tablename, String filter, int recordcount) {
		  Session s=getSession();
		     Transaction t=s.beginTransaction();
		     String classname=NameUtil.toFirstUpper(tablename);
		     String HQL=" from "+classname+" "+ (filter==null?"":filter);
		     System.out.println("����HQL="+HQL);
		     List list=null;
		     try 
		     {
		    	 
		     
			     Query q=s.createQuery(HQL);
			     q.setFirstResult(0);
			     q.setMaxResults(recordcount);
			     list= q.list();
			     t.commit();
			    
		     }catch(HibernateException e){
		    	 e.printStackTrace();
		    	System.out.print("ϵͳ�����쳣"+ e.getMessage());
		     }
		     return list;
		
	}
	  
	 
	
	 
	 
	

}
