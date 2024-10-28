package com.itbaizhan.daowen.util;

public class PagerMetal {

	private int pagesize=10;

	private int totalcount;

	private int curpageindex=1;

	public PagerMetal(int pagesize,int totalcount){
		this.pagesize=pagesize;
		this.totalcount=totalcount;
	}
	public PagerMetal(int totalcount){
		this.totalcount=totalcount;
	}

	public int getPagesize() {
		return pagesize;
	}

	public int getTotalPages()
	{
		return (totalcount+pagesize-1)/(pagesize);
	}
	/****
	 ****设置页面大小
	 * @param pagesize
	 */
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}

	public int getTotalcount() {
		return totalcount;
	}
	/****
	 *
	 * 设置总分页数
	 * @param totalcount
	 */
	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}

	public int getCurpageindex() {
		return curpageindex;
	}
	/***
	 * 设置当前页索引
	 * @param curpageindex
	 */
	public void setCurpageindex(int curpageindex) {
		this.curpageindex = curpageindex;
	}


}
