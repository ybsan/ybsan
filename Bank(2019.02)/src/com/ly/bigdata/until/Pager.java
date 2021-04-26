package com.ly.bigdata.until;

import java.util.ArrayList;
import java.util.List;

public class Pager<T> {

	private int pageNo;
	private int pageSize = 3;
	private int total;
	private int lastPage;
	
	//µ±Ç°Ò³¼ÇÂ¼
	public List<T> list = new ArrayList<T>();

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage() {
		this.lastPage = 0;
		if (this.total % this.pageSize == 0) {
			this.lastPage = this.total / this.pageSize;
		} else {
			this.lastPage = this.total / this.pageSize + 1;
		}
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	
	
	
	
	
	public Pager(int pageNo, int pageSize, int total, int lastPage, List<T> list) {
		super();
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.total = total;
		this.lastPage = lastPage;
		this.list = list;
		this.setLastPage();
	}

	@Override
	public String toString() {
		return "Pager [pageNo=" + pageNo + ", pageSize=" + pageSize + ", total=" + total + ", lastPage=" + lastPage
				+ ", list=" + list + "]";
	}

	public Pager() {
		super();
	}
	
	
	
	public int prePageNo() {
		if (this.pageNo <= 1) {
		return 1;	
		}else {
			return this.pageNo - 1;
		}	
	}
	
	public int nextPageNo() {
		if (this.pageNo >= this.lastPage) {
			return this.lastPage;
		}else{
			return this.pageNo + 1;
		}
	}
}
