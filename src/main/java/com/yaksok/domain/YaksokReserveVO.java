package com.yaksok.domain;

import java.io.Serializable;
import java.sql.Date;

public class YaksokReserveVO implements Serializable {
	
	private String ridx;
	private String rusername;
	private String rhp;
	private String rcontent;
	private String rnumber;
	private Date rindate;
	private String rcheckedstate;
	private String yidx;
	
	public YaksokReserveVO() {
		
	}

	public YaksokReserveVO(String ridx, String rusername, String rhp, String rcontent, String rnumber, Date rindate,
			String rcheckedstate, String yidx) {
		super();
		this.ridx = ridx;
		this.rusername = rusername;
		this.rhp = rhp;
		this.rcontent = rcontent;
		this.rnumber = rnumber;
		this.rindate = rindate;
		this.rcheckedstate = rcheckedstate;
		this.yidx = yidx;
	}

	public String getRidx() {
		return ridx;
	}

	public void setRidx(String ridx) {
		this.ridx = ridx;
	}

	public String getRusername() {
		return rusername;
	}

	public void setRusername(String rusername) {
		this.rusername = rusername;
	}

	public String getRhp() {
		return rhp;
	}

	public void setRhp(String rhp) {
		this.rhp = rhp;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public String getRnumber() {
		return rnumber;
	}

	public void setRnumber(String rnumber) {
		this.rnumber = rnumber;
	}

	public Date getRindate() {
		return rindate;
	}

	public void setRindate(Date rindate) {
		this.rindate = rindate;
	}

	public String getRcheckedstate() {
		return rcheckedstate;
	}

	public void setRcheckedstate(String rcheckedstate) {
		this.rcheckedstate = rcheckedstate;
	}

	public String getYidx() {
		return yidx;
	}

	public void setYidx(String yidx) {
		this.yidx = yidx;
	}
	
}
