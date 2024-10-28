package com.itbaizhan.daowen.entity;

import java.util.Date;

import javax.persistence.*;
import org.hibernate.annotations.GenericGenerator;

@Entity
public class Attachement {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	// ���۱���
	private String title;
	// ����ʱ��
	private Date pubtime;
	// ������
	private String url;
	// �ļ���
	private String filename;
	// ��������
	private String type;
	// �����������
	private String belongid;
	// ��������
	private String belongtable;
	// ��������
	private String belongfileldname;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getPubtime() {
		return pubtime;
	}

	public void setPubtime(Date pubtime) {
		this.pubtime = pubtime;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getBelongid() {
		return belongid;
	}

	public void setBelongid(String belongid) {
		this.belongid = belongid;
	}

	public String getBelongtable() {
		return belongtable;
	}

	public void setBelongtable(String belongtable) {
		this.belongtable = belongtable;
	}

	public String getBelongfileldname() {
		return belongfileldname;
	}

	public void setBelongfileldname(String belongfileldname) {
		this.belongfileldname = belongfileldname;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

}