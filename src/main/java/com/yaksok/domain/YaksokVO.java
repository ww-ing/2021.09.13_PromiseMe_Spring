package com.yaksok.domain;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
public class YaksokVO implements Serializable{

	private String yidx;
	private String yaksokname;
	private Date indate;
	private String idx;
}