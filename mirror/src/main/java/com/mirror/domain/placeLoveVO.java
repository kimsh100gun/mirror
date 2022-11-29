package com.mirror.domain;

public class placeLoveVO {
	private String m_no;
	private String m_nick;
	private String p_no;
	private String p_name;
	private String p_info;
	private double p_lati;
	private double p_long;
	private String p_region;
	private String p_type;
	
	
	private int startNum ;
	private int endNum ;
	
	
	public placeLoveVO(String m_no, int startNum, int endNum) {
		super();
		this.m_no = m_no;
		this.startNum = startNum;
		this.endNum = endNum;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	public String getM_no() {
		return m_no;
	}
	public void setM_no(String m_no) {
		this.m_no = m_no;
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
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_info() {
		return p_info;
	}
	public void setP_info(String p_info) {
		this.p_info = p_info;
	}
	public double getP_lati() {
		return p_lati;
	}
	public void setP_lati(double p_lati) {
		this.p_lati = p_lati;
	}
	public double getP_long() {
		return p_long;
	}
	public void setP_long(double p_long) {
		this.p_long = p_long;
	}
	public String getP_region() {
		return p_region;
	}
	public void setP_region(String p_region) {
		this.p_region = p_region;
	}
	public String getP_type() {
		return p_type;
	}
	public void setP_type(String p_type) {
		this.p_type = p_type;
	}
	public placeLoveVO(String m_no, String m_nick, String p_no, String p_name, String p_info, double p_lati,
			double p_long, String p_region, String p_type) {
		super();
		this.m_no = m_no;
		this.m_nick = m_nick;
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_info = p_info;
		this.p_lati = p_lati;
		this.p_long = p_long;
		this.p_region = p_region;
		this.p_type = p_type;
	}
	public placeLoveVO() {
		super();
	}

	
}
