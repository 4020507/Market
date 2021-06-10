package com.market.vo;

public class Paging{
	
	private int page;
	private int perPage;
	private int start;
	private int end;
	
	public Paging() {
		this.page = 1;
		this.perPage = 3;//maximum number of products will be shown
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		
		if(page<=0)
		{
			this.page = 1;
		}
		else
		{
			this.page = page;
		}
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		if(perPage <= 0 || perPage > 100)
		{
			this.perPage = 3;
		}
		else
			this.perPage = perPage;
	}
	
	public int getPageStart() {
		return (this.page-1) * perPage;
	}
	
	public int getStart() {
		return start = (((page-1) * perPage) + 1);
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end = (start + perPage -1);
	}
	public void setEnd(int end) {
		this.end = end;
	}
	
	@Override
	public String toString() {
		return "Paging [page=" + page + ", perPage=" + perPage + ", start=" + start + ", end=" + end + "]";
	}
		
}