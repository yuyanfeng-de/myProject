package pojo;

import java.util.Date;

public class Notice {

	private int id_n;
	private String tittle;
	private String context;
	private Date publishTime;
	private int nstatus;
	public int getId_n() {
		return id_n;
	}
	public void setId_n(int id_n) {
		this.id_n = id_n;
	}
	public String getTittle() {
		return tittle;
	}
	public void setTittle(String tittle) {
		this.tittle = tittle;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public Date getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}
	public int getNstatus() {
		return nstatus;
	}
	public void setNstatus(int nstatus) {
		this.nstatus = nstatus;
	}
}
