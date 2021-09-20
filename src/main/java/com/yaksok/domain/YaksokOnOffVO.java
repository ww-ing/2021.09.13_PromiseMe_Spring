package com.yaksok.domain;

public class YaksokOnOffVO {
	
	private String yidx;
	private String yaksokonoff;
	private String calendaronoff;
	private String overlaponoff;
	private String payonoff;
	private String maxreserve;
	
	public YaksokOnOffVO() {
		
	}

	public YaksokOnOffVO(String yidx, String yaksokonoff, String calendaronoff, String overlaponoff, String payonoff,
			String maxreserve) {
		super();
		this.yidx = yidx;
		this.yaksokonoff = yaksokonoff;
		this.calendaronoff = calendaronoff;
		this.overlaponoff = overlaponoff;
		this.payonoff = payonoff;
		this.maxreserve = maxreserve;
	}

	public String getYidx() {
		return yidx;
	}

	public void setYidx(String yidx) {
		this.yidx = yidx;
	}

	public String getYaksokonoff() {
		return yaksokonoff;
	}

	public void setYaksokonoff(String yaksokonoff) {
		this.yaksokonoff = yaksokonoff;
	}

	public String getCalendaronoff() {
		return calendaronoff;
	}

	public void setCalendaronoff(String calendaronoff) {
		this.calendaronoff = calendaronoff;
	}

	public String getOverlaponoff() {
		return overlaponoff;
	}

	public void setOverlaponoff(String overlaponoff) {
		this.overlaponoff = overlaponoff;
	}

	public String getPayonoff() {
		return payonoff;
	}

	public void setPayonoff(String payonoff) {
		this.payonoff = payonoff;
	}

	public String getMaxreserve() {
		return maxreserve;
	}

	public void setMaxreserve(String maxreserve) {
		this.maxreserve = maxreserve;
	}

	
	

}
