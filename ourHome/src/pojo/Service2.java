package pojo;

import java.util.Date;
import java.util.List;
import java.util.Map;

public class Service2 {

	private int id_s;
	private String object;
	private String type;
	private String location;
	private String context;
	private int id_v;
	private int complete;
	private int status_s;
	private Date appoint_time;
	private int id_u;
	private Date complete_time;
	
	private String telephone_u;
	private Map<Integer,String> name_vs;
	private String name_v;
	
	private String uname;
	
	public int getId_s() {
		return id_s;
	}
	public void setId_s(int id_s) {
		this.id_s = id_s;
	}
	public String getObject() {
		return object;
	}
	public void setObject(String object) {
		this.object = object;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public int getId_v() {
		return id_v;
	}
	public void setId_v(int id_v) {
		this.id_v = id_v;
	}
	public int getComplete() {
		return complete;
	}
	public void setComplete(int complete) {
		this.complete = complete;
	}
	public int getStatus_s() {
		return status_s;
	}
	public void setStatus_s(int status_s) {
		this.status_s = status_s;
	}
	public Date getAppoint_time() {
		return appoint_time;
	}
	public void setAppoint_time(Date appoint_time) {
		this.appoint_time = appoint_time;
	}

	public String getName_v() {
		return name_v;
	}
	public void setName_v(String name_v) {
		this.name_v = name_v;
	}
	public int getId_u() {
		return id_u;
	}
	public void setId_u(int id_u) {
		this.id_u = id_u;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public Map<Integer, String> getName_vs() {
		return name_vs;
	}
	public void setName_vs(Map<Integer, String> name_vs) {
		this.name_vs = name_vs;
	}
	public Date getComplete_time() {
		return complete_time;
	}
	public void setComplete_time(Date complete_time) {
		this.complete_time = complete_time;
	}
	public String getTelephone_u() {
		return telephone_u;
	}
	public void setTelephone_u(String telephone_u) {
		this.telephone_u = telephone_u;
	}


	
	
}
