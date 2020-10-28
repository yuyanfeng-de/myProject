package pojo;

import java.util.Date;

/** 
 * 访客登记表
 * @author lenovo
 *
 */
public class Mobility_v {

	private int id_v;
	private String name_v;
	private String telephone_v;
	private String reason_v; //来访事由

	private Date visit_time; //来访时间
	private Double visit_temp; //温度
	
	private Date departure_time; //离开时间
	private Double departure_temp; //温度
	private int status;
	public int getId_v() {
		return id_v;
	}
	public void setId_v(int id_v) {
		this.id_v = id_v;
	}
	public String getName_v() {
		return name_v;
	}
	public void setName_v(String name_v) {
		this.name_v = name_v;
	}
	public String getTelephone_v() {
		return telephone_v;
	}
	public void setTelephone_v(String telephone_v) {
		this.telephone_v = telephone_v;
	}
	public String getReason_v() {
		return reason_v;
	}
	public void setReason_v(String reason_v) {
		this.reason_v = reason_v;
	}
	public Date getVisit_time() {
		return visit_time;
	}
	public void setVisit_time(Date visit_time) {
		this.visit_time = visit_time;
	}
	public Double getVisit_temp() {
		return visit_temp;
	}
	public void setVisit_temp(Double visit_temp) {
		this.visit_temp = visit_temp;
	}
	public Date getDeparture_time() {
		return departure_time;
	}
	public void setDeparture_time(Date departure_time) {
		this.departure_time = departure_time;
	}
	public Double getDeparture_temp() {
		return departure_temp;
	}
	public void setDeparture_temp(Double departure_temp) {
		this.departure_temp = departure_temp;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
