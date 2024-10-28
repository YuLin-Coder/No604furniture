package com.itbaizhan.daowen.entity;

import javax.persistence.*;

@Entity
public class Role
{
@Id
   private String rolename ;
   public String getRolename() 
   {
      return rolename;
  }
   public void setRolename(String rolename) 
   {
      this.rolename= rolename;
  }
   private String description ;
   public String getDescription() 
   {
      return description;
  }
   public void setDescription(String description) 
   {
      this.description= description;
  }
}
