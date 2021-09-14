package com.user.domain;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
public class UserVO implements Serializable{

	private String idx;
	private String username;
	private String userid;
	private String pwd;
	private String hp1;
	private String hp2;
	private String hp3;
	private Date indate;
	private String mstate;//회원상태(일반회원:0,정지회원1,탈퇴회원:-1);

}////////////////////////////////////