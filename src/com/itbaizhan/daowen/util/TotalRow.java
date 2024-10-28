package com.itbaizhan.daowen.util;

import java.util.List;

public class TotalRow {
	public List getRows() {
		return rows;
	}
	public void setRows(List rows) {
		this.rows = rows;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	private List rows;
	private int total;

}
