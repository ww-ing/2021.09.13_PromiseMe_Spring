package com.yaksok.domain;

import java.io.Serializable;

public class YaksokCalendarVO implements Serializable {
	
	private String cidx;
	private String ctitle;
	private String ccontent;
	private String cyear;
	private String cmonth;
	private String cday;
	private String yidx;
	
	public YaksokCalendarVO() {
		
	}

	public YaksokCalendarVO(String cidx, String ctitle, String ccontent, String cyear, String cmonth, String cday,
			String yidx) {
		super();
		this.cidx = cidx;
		this.ctitle = ctitle;
		this.ccontent = ccontent;
		this.cyear = cyear;
		this.cmonth = cmonth;
		this.cday = cday;
		this.yidx = yidx;
	}

	public String getCidx() {
		return cidx;
	}

	public void setCidx(String cidx) {
		this.cidx = cidx;
	}

	public String getCtitle() {
		return ctitle;
	}

	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}

	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	public String getCyear() {
		return cyear;
	}

	public void setCyear(String cyear) {
		this.cyear = cyear;
	}

	public String getCmonth() {
		return cmonth;
	}

	public void setCmonth(String cmonth) {
		this.cmonth = cmonth;
	}

	public String getCday() {
		return cday;
	}

	public void setCday(String cday) {
		this.cday = cday;
	}

	public String getYidx() {
		return yidx;
	}

	public void setYidx(String yidx) {
		this.yidx = yidx;
	}
	
	

}