package com.itbaizhan.daowen.entity;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;

@Entity
public class Acl {
	@GenericGenerator(name = "generator",  strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	private int moduleid;
	
	public int getModuleid(){
		return moduleid;
	}
	
	public void setModuleid(int moduleid){
		
		this.moduleid=moduleid;
		
	}

	private String rolename;

	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	private String modulename;

	public String getModulename() {
		return modulename;
	}

	public void setModulename(String modulename) {
		this.modulename = modulename;
	}

	private String acl;

	public String getAcl() {
		return acl;
	}

	public void setAcl(String acl) {
		this.acl = acl;
	}

	private String des;

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}
}
