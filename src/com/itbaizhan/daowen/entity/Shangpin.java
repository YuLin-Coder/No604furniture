package com.itbaizhan.daowen.entity;

import java.util.Date;
import java.util.Set;

import javax.persistence.*;

@Entity
public class Shangpin {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	private String spno;

	public String getSpno() {
		return spno;
	}

	public void setSpno(String spno) {
		this.spno = spno;
	}

	private Double jiage;

	public Double getJiage() {
		return jiage;
	}

	public void setJiage(Double jiage) {
		this.jiage = jiage;
	}

	private int dazhe;

	public int getDazhe() {
		return dazhe;
	}

	public void setDazhe(int dazhe) {
		this.dazhe = dazhe;
	}

	private int tuijian;

	public int getTuijian() {
		return tuijian;
	}

	public void setTuijian(int tuijian) {
		this.tuijian = tuijian;
	}

	private int zuixin;

	public int getZuixin() {
		return zuixin;
	}

	public void setZuixin(int zuixin) {
		this.zuixin = zuixin;
	}
	
	private  int hot;
	
	public int getHot(){
		return hot;
	}
	public void  setHot(int hot){
		this.hot=hot;
	}

	private String sptype;

	public String getSptype() {
		return sptype;
	}

	public void setSptype(String sptype) {
		this.sptype = sptype;
	}

	private int sptypeid;

	public int getSptypeid() {
		return sptypeid;
	}

	public void setSptypeid(int sptypeid) {
		this.sptypeid = sptypeid;
	}

	private String tupian;

	public String getTupian() {
		return tupian;
	}

	public void setTupian(String tupian) {
		this.tupian = tupian;
	}

	private String jieshao;

	public String getJieshao() {
		return jieshao;
	}

	public void setJieshao(String jieshao) {
		this.jieshao = jieshao;
	}

	private int hyjia;

	public int getHyjia() {
		return hyjia;
	}

	public void setHyjia(int hyjia) {
		this.hyjia = hyjia;
	}

	private Date pubtime;

	public Date getPubtime() {
		return pubtime;
	}

	public void setPubtime(Date pubtime) {
		this.pubtime = pubtime;
	}

	private String pubren;

	public String getPubren() {
		return pubren;
	}

	public void setPubren(String pubren) {
		this.pubren = pubren;
	}
}
