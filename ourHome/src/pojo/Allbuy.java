package pojo;

import java.util.Date;
import java.util.Map;

public class Allbuy {

	private int id_b;
	private int oid;
	private int vtid;
	
	private Date abtime;
	private int state;
	private int complete_b;
	private String describe;
	

	private String name_v;
	private Map<Integer,String> name_vs;
	public int getId_b() {
		return id_b;
	}
	public void setId_b(int id_b) {
		this.id_b = id_b;
	}
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public int getVtid() {
		return vtid;
	}
	public void setVtid(int vtid) {
		this.vtid = vtid;
	}
	public Date getAbtime() {
		return abtime;
	}
	public void setAbtime(Date abtime) {
		this.abtime = abtime;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getComplete_b() {
		return complete_b;
	}
	public void setComplete_b(int complete_b) {
		this.complete_b = complete_b;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public String getName_v() {
		return name_v;
	}
	public void setName_v(String name_v) {
		this.name_v = name_v;
	}
	public Map<Integer, String> getName_vs() {
		return name_vs;
	}
	public void setName_vs(Map<Integer, String> name_vs) {
		this.name_vs = name_vs;
	}
}
