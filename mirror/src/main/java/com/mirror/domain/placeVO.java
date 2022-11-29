package com.mirror.domain;

public class placeVO {
	private String p_no = null;
	private String p_name = null;
	private String p_info= null;
	private String p_lati= null;
	private String p_long= null;
	
	private String p_region= null;
	private String p_type= null;
	
	
	private int startNum ;
	private int endNum ;
	
	
	
	public placeVO(String p_region, String p_type, int startNum, int endNum) {
		super();
		this.p_region = p_region;
		this.p_type = p_type;
		this.startNum = startNum;
		this.endNum = endNum;
	}

	public placeVO() {
		super();
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

	public String getP_lati() {
		return p_lati;
	}

	public void setP_lati(String p_lati) {
		this.p_lati = p_lati;
	}

	public String getP_long() {
		return p_long;
	}

	public void setP_long(String p_long) {
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

	public placeVO(String p_region, String p_type) {
		super();
		this.p_region = p_region;
		this.p_type = p_type;
	}

	public placeVO(String p_no) {
		super();
		this.p_no = p_no;
	}

	public placeVO(String p_no, String p_name, String p_info, String p_lati, String p_long,
			String p_region, String p_type) {
		super();
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_info = p_info;
		this.p_lati = p_lati;
		this.p_long = p_long;
		this.p_region = p_region;
		this.p_type = p_type;
	}
	
	
	
	
	
	
	
	


}
