package com.market.vo;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageNumber
{
	private int total;//total number of products
	private int start;//start page
	private int end;//end page
	private boolean prev;//prev possible?
	private boolean next;//next page available?
	private int show = 3;//max 3 products
	private Paging p;
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
		calculation();
	}
	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getShow() {
		return show;
	}
	public void setShow(int show) {
		this.show = show;
	}
	public Paging getP() {
		return p;
	}
	public void setP(Paging p) {
		this.p = p;
	}
	
	//calculate page
	private void calculation()
	{
		end = (int) (Math.ceil(p.getPage() / (double)show) * show);
		start = (end - show) + 1;
	  
		int temp = (int) (Math.ceil(total / (double)p.getPerPage()));
		if (end > temp) {
			end = temp;
		}
		prev = start == 1 ? false : true;
		next = end * p.getPerPage() >= total ? false : true;
	}
	
	//get page
	public String pages(int page) {
		UriComponents uriComponents =
		UriComponentsBuilder.newInstance()
						    .queryParam("page", page)
							.build();
		   
		return uriComponents.toUriString();
	}
	
	
}