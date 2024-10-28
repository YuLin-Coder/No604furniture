package com.itbaizhan.daowen.entity;
import java.util.Date;
import javax.persistence.*;
@Entity
public class Comment
{
@Id
@GeneratedValue(strategy =GenerationType.AUTO)
   private int id ;
   public int getId() 
   {
      return id;
  }
   public void setId(int id) 
   {
      this.id= id;
  }
   private String title ;
   public String getTitle() 
   {
      return title;
  }
   public void setTitle(String title) 
   {
      this.title= title;
  }
   private Date commenttime ;
   public Date getCommenttime() 
   {
      return commenttime;
  }
   public void setCommenttime(Date commenttime) 
   {
      this.commenttime= commenttime;
  }
   private String commentren ;
   public String getCommentren() 
   {
      return commentren;
  }
   public void setCommentren(String commentren) 
   {
      this.commentren= commentren;
  }
   private String commentcontent ;
   public String getCommentcontent() 
   {
      return commentcontent;
  }
   public void setCommentcontent(String commentcontent) 
   {
      this.commentcontent= commentcontent;
  }
   private String xtype ;
   public String getXtype() 
   {
      return xtype;
  }
   public void setXtype(String xtype) 
   {
      this.xtype= xtype;
  }
   private String belongid ;
   public String getBelongid() 
   {
      return belongid;
  }
   public void setBelongid(String belongid) 
   {
      this.belongid= belongid;
  }
}
