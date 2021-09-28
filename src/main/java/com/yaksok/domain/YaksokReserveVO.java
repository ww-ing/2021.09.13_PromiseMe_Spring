package com.yaksok.domain;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
public class YaksokReserveVO implements Serializable {
	
	private String ridx;
	private String rusername;
	private String rhp;
	private String rcontent;
	private String rnumber;
	private Date rindate;
	private String rcheckedstate;
	private String cidx;
	private String yidx;
	
}
