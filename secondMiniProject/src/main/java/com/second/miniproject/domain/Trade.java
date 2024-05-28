package com.second.miniproject.domain;

import java.sql.Timestamp;

public class Trade {
	private int ucno;
    private String cname;
    private String cnumber;
    private String cmanufacturer;
    private String cimg;
    private int cyear;
    private int cmileage;
    private String carea;
    private int cprice;
    private String cshortment;
    private String cseller;
    private String csellerContact;
    private String ccomment;
    private String ccolor;
    private String cfuelType;
    private String ctransmission;
    private String ccondition;
    private int viewCount;
    private String status;
    private Timestamp cregDate;
	
	public Trade() {}

	public Trade(int ucno, String cname, String cnumber, String cmanufacturer, String cimg, int cyear, int cmileage,
			String carea, int cprice, String cshortment, String cseller, String csellerContact, String ccomment,
			String ccolor, String cfuelType, String ctransmission, String ccondition, int viewCount, String status,
			Timestamp cregDate) {
		super();
		this.ucno = ucno;
		this.cname = cname;
		this.cnumber = cnumber;
		this.cmanufacturer = cmanufacturer;
		this.cimg = cimg;
		this.cyear = cyear;
		this.cmileage = cmileage;
		this.carea = carea;
		this.cprice = cprice;
		this.cshortment = cshortment;
		this.cseller = cseller;
		this.csellerContact = csellerContact;
		this.ccomment = ccomment;
		this.ccolor = ccolor;
		this.cfuelType = cfuelType;
		this.ctransmission = ctransmission;
		this.ccondition = ccondition;
		this.viewCount = viewCount;
		this.status = status;
		this.cregDate = cregDate;
	}

	public int getUcno() {
		return ucno;
	}

	public void setUcno(int ucno) {
		this.ucno = ucno;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCnumber() {
		return cnumber;
	}

	public void setCnumber(String cnumber) {
		this.cnumber = cnumber;
	}

	public String getCmanufacturer() {
		return cmanufacturer;
	}

	public void setCmanufacturer(String cmanufacturer) {
		this.cmanufacturer = cmanufacturer;
	}

	public String getCimg() {
		return cimg;
	}

	public void setCimg(String cimg) {
		this.cimg = cimg;
	}

	public int getCyear() {
		return cyear;
	}

	public void setCyear(int cyear) {
		this.cyear = cyear;
	}

	public int getCmileage() {
		return cmileage;
	}

	public void setCmileage(int cmileage) {
		this.cmileage = cmileage;
	}

	public String getCarea() {
		return carea;
	}

	public void setCarea(String carea) {
		this.carea = carea;
	}

	public int getCprice() {
		return cprice;
	}

	public void setCprice(int cprice) {
		this.cprice = cprice;
	}

	public String getCshortment() {
		return cshortment;
	}

	public void setCshortment(String cshortment) {
		this.cshortment = cshortment;
	}

	public String getCseller() {
		return cseller;
	}

	public void setCseller(String cseller) {
		this.cseller = cseller;
	}

	public String getCsellerContact() {
		return csellerContact;
	}

	public void setCsellerContact(String csellerContact) {
		this.csellerContact = csellerContact;
	}

	public String getCcomment() {
		return ccomment;
	}

	public void setCcomment(String ccomment) {
		this.ccomment = ccomment;
	}

	public String getCcolor() {
		return ccolor;
	}

	public void setCcolor(String ccolor) {
		this.ccolor = ccolor;
	}

	public String getCfuelType() {
		return cfuelType;
	}

	public void setCfuelType(String cfuelType) {
		this.cfuelType = cfuelType;
	}

	public String getCtransmission() {
		return ctransmission;
	}

	public void setCtransmission(String ctransmission) {
		this.ctransmission = ctransmission;
	}

	public String getCcondition() {
		return ccondition;
	}

	public void setCcondition(String ccondition) {
		this.ccondition = ccondition;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Timestamp getCregDate() {
		return cregDate;
	}

	public void setCregDate(Timestamp cregDate) {
		this.cregDate = cregDate;
	}
	
	
}

