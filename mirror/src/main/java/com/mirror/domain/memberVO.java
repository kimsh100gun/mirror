package com.mirror.domain;

public class memberVO {
	private String m_no = null;
	private String m_id = null ;
	private String m_pw = null;
	private String m_nick =null;
	
	memberVO(){
		
	}

	public memberVO(String m_no) {
		super();
		this.m_no = m_no;
	}

	public memberVO(String m_id, String m_pw, String m_nick) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_nick = m_nick;
	}

	public memberVO(String m_no, String m_id, String m_pw, String m_nick) {
		super();
		this.m_no = m_no;
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_nick = m_nick;
	}

	public memberVO(String m_id, String m_pw) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
	}

	public String getM_no() {
		return m_no;
	}

	public void setM_no(String m_no) {
		this.m_no = m_no;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_nick() {
		return m_nick;
	}

	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}

}