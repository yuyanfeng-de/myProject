package pojo;

import java.util.Date;

public class Activity {

	private int id_a;
	private String theme;
	private String object;
	private String location;
	private Date service_time;
	private Date end_time;
	private Date publishTime;
	private int astatus;
	private String describe;
	public int getId_a() {
		return id_a;
	}
	public void setId_a(int id_a) {
		this.id_a = id_a;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	public String getObject() {
		return object;
	}
	public void setObject(String object) {
		this.object = object;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Date getService_time() {
		return service_time;
	}
	public void setService_time(Date service_time) {
		this.service_time = service_time;
	}
	public Date getEnd_time() {
		return end_time;
	}
	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}
	public int getAstatus() {
		return astatus;
	}
	public void setAstatus(int astatus) {
		this.astatus = astatus;
	}

	public Date getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
}
