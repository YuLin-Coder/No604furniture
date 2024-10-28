package com.itbaizhan.daowen.entity;
import java.util.Date;
import javax.persistence.*;
@Entity
public class Dingdan
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
   private String ddno ;
   public String getDdno() 
   {
      return ddno;
  }
   public void setDdno(String ddno) 
   {
      this.ddno= ddno;
  }
   private Date xiadantime ;
   public Date getXiadantime() 
   {
      return xiadantime;
  }
   public void setXiadantime(Date xiadantime) 
   {
      this.xiadantime= xiadantime;
  }
   private String xiadanren ;
   public String getXiadanren() 
   {
      return xiadanren;
  }
   public void setXiadanren(String xiadanren) 
   {
      this.xiadanren= xiadanren;
  }
   private double totalprice ;
   public double getTotalprice() 
   {
      return totalprice;
  }
   public void setTotalprice(Double totalprice) 
   {
      this.totalprice= totalprice;
  }
   private String status ;
   public String getStatus() 
   {
      return status;
  }
   public void setStatus(String status) 
   {
      this.status= status;
  }
   private String fahuoren ;
   public String getFahuoren() 
   {
      return fahuoren;
  }
   public void setFahuoren(String fahuoren) 
   {
      this.fahuoren= fahuoren;
  }
   private Date fahuotime ;
   public Date getFahuotime() 
   {
      return fahuotime;
  }
   public void setFahuotime(Date fahuotime) 
   {
      this.fahuotime= fahuotime;
  }
   private String shouhuodizhi ;
   public String getShouhuodizhi() 
   {
      return shouhuodizhi;
  }
   public void setShouhuodizhi(String shouhuodizhi) 
   {
      this.shouhuodizhi= shouhuodizhi;
  }
   private String shrtel ;
   public String getShrtel() 
   {
      return shrtel;
  }
   public void setShrtel(String shrtel) 
   {
      this.shrtel= shrtel;
  }
   private String shraddress ;
   public String getShraddress() 
   {
      return shraddress;
  }
   public void setShraddress(String shraddress) 
   {
      this.shraddress= shraddress;
  }
   private String shrname ;
   public String getShrname() 
   {
      return shrname;
  }
   public void setShrname(String shrname) 
   {
      this.shrname= shrname;
  }
   private String des ;
   public String getDes() 
   {
      return des;
  }
   public void setDes(String des) 
   {
      this.des= des;
  }
}
