package com.mirror.domain;

import java.util.Date;

public class replyVO {
	
	private String r_no;
	private String m_no;
	private String r_con;
	private Date r_date;
	private String m_nick;
	private String p_no;
	
	
	public replyVO() {
		super();
	}
	
	
	public replyVO(String input) {
		super();
		this.r_no = input;
		this.m_no = input;
		this.r_con = input;
		this.m_nick = input;
		this.p_no = input;
		
	}


	



	public replyVO(String m_no, String r_con, String p_no) {
		super();
		this.m_no = m_no;
		this.r_con = r_con;
		this.p_no = p_no;
	}
	
	
	public replyVO(String r_no, String m_no ,String m_nick, String r_con, Date r_date, String p_no) {
		super();
		this.r_no = r_no;
		this.m_no = m_no;
		this.m_nick = m_nick;
		this.r_con = r_con;
		this.r_date = r_date;
		this.p_no = p_no;
	}
	
	
	public replyVO(String r_no, String m_no, String r_con, String p_no) {
		super();
		this.r_no = r_no;
		this.m_no = m_no;
		this.r_con = r_con;
		this.p_no = p_no;
	}


	public String getR_no() {
		return r_no;
	}
	public void setR_no(String r_no) {
		this.r_no = r_no;
	}
	public String getM_no() {
		return m_no;
	}
	public void setM_no(String m_no) {
		this.m_no = m_no;
	}
	public String getR_con() {
		return r_con;
	}
	public void setR_con(String r_con) {
		this.r_con = r_con;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	public String getM_nick() {
		return m_nick;
	}
	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}


	public String getP_no() {
		return p_no;
	}


	public void setP_no(String p_no) {
		this.p_no = p_no;
	}


	public replyVO(String r_no, String m_no, String r_con, Date r_date, String p_no) {
		super();
		this.r_no = r_no;
		this.m_no = m_no;
		this.r_con = r_con;
		this.r_date = r_date;
		this.p_no = p_no;
	}
	
	
	
	
	

}
