package com.itbaizhan.daowen.entity;
import java.util.Date;
import javax.persistence.*;
@Entity
public class Topic
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
   private String pubren ;
   public String getPubren() 
   {
      return pubren;
  }
   public void setPubren(String pubren) 
   {
      this.pubren= pubren;
  }
   private Date pubtime ;
   public Date getPubtime() 
   {
      return pubtime;
  }
   public void setPubtime(Date pubtime) 
   {
      this.pubtime= pubtime;
  }
   private int clickcount ;
   public int getClickcount() 
   {
      return clickcount;
  }
   public void setClickcount(int clickcount) 
   {
      this.clickcount= clickcount;
  }
   private int replycount ;
   public int getReplycount() 
   {
      return replycount;
  }
   public void setReplycount(int replycount) 
   {
      this.replycount= replycount;
  }
   private String lastreplyor ;
   public String getLastreplyor() 
   {
      return lastreplyor;
  }
   public void setLastreplyor(String lastreplyor) 
   {
      this.lastreplyor= lastreplyor;
  }
   private String lastreplytime ;
   public String getLastreplytime() 
   {
      return lastreplytime;
  }
   public void setLastreplytime(String lastreplytime) 
   {
      this.lastreplytime= lastreplytime;
  }
   private String dcontent ;
   public String getDcontent() 
   {
      return dcontent;
  }
   public void setDcontent(String dcontent) 
   {
      this.dcontent= dcontent;
  }
   private String bkid ;
   public String getBkid() 
   {
      return bkid;
  }
   public void setBkid(String bkid) 
   {
      this.bkid= bkid;
  }
   private String bkname ;
   public String getBkname() 
   {
      return bkname;
  }
   public void setBkname(String bkname) 
   {
      this.bkname= bkname;
  }
   private String istopic ;
   public String getIstopic() 
   {
      return istopic;
  }
   public void setIstopic(String istopic) 
   {
      this.istopic= istopic;
  }
   private String replyid ;
   public String getReplyid() 
   {
      return replyid;
  }
   public void setReplyid(String replyid) 
   {
      this.replyid= replyid;
  }
}
