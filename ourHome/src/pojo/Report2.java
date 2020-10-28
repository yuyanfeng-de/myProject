package pojo;

import java.util.Date;

public class Report2 {

	private int id_t;
	private int id_u;
	private String health;
	private Double temperature;
	private int contact;
	private int difficulty;
	private int outplan;
	private int status_t;
	private Date report_time;
	
	private String uname;
	private String telephone_u;
	private String uaddress;
	
	public int getId_t() {
		return id_t;
	}
	public void setId_t(int id_t) {
		this.id_t = id_t;
	}
	public int getId_u() {
		return id_u;
	}
	public void setId_u(int id_u) {
		this.id_u = id_u;
	}
	public String getHealth() {
		return health;
	}
	public void setHealth(String health) {
		this.health = health;
	}
	public Double getTemperature() {
		return temperature;
	}
	public void setTemperature(Double temperature) {
		this.temperature = temperature;
	}
	public int getContact() {
		return contact;
	}
	public void setContact(int contact) {
		this.contact = contact;
	}
	public int getDifficulty() {
		return difficulty;
	}
	public void setDifficulty(int difficulty) {
		this.difficulty = difficulty;
	}
	public int getOutplan() {
		return outplan;
	}
	public void setOutplan(int outplan) {
		this.outplan = outplan;
	}
	public int getStatus_t() {
		return status_t;
	}
	public void setStatus_t(int status_t) {
		this.status_t = status_t;
	}
	public Date getReport_time() {
		return report_time;
	}
	public void setReport_time(Date report_time) {
		this.report_time = report_time;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getTelephone_u() {
		return telephone_u;
	}
	public void setTelephone_u(String telephone_u) {
		this.telephone_u = telephone_u;
	}
	public String getUaddress() {
		return uaddress;
	}
	public void setUaddress(String uaddress) {
		this.uaddress = uaddress;
	}
	
}
