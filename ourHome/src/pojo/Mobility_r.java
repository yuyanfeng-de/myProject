package pojo;

import java.util.Date;

/** 
 * 居民登记表
 * @author lenovo
 *
 */
public class Mobility_r {

	private int id_r;
	private String name_r;
	private String telephone_r;
	private String reason_r; //出入事由

	private Date outtime_r; //外出时间
	private Double out_temp; //温度
	
	private Date returntime_r; //返回数据
	private Double return_temp; //温度
	private int status;
	
	public int getId_r() {
		return id_r;
	}
	public void setId_r(int id_r) {
		this.id_r = id_r;
	}
	public String getName_r() {
		return name_r;
	}
	public void setName_r(String name_r) {
		this.name_r = name_r;
	}
	public String getTelephone_r() {
		return telephone_r;
	}
	public void setTelephone_r(String telephone_r) {
		this.telephone_r = telephone_r;
	}
	public String getReason_r() {
		return reason_r;
	}
	public void setReason_r(String reason_r) {
		this.reason_r = reason_r;
	}
	public Date getOuttime_r() {
		return outtime_r;
	}
	public void setOuttime_r(Date outtime_r) {
		this.outtime_r = outtime_r;
	}
	public Double getOut_temp() {
		return out_temp;
	}
	public void setOut_temp(Double out_temp) {
		this.out_temp = out_temp;
	}
	public Date getReturntime_r() {
		return returntime_r;
	}
	public void setReturntime_r(Date returntime_r) {
		this.returntime_r = returntime_r;
	}
	public Double getReturn_temp() {
		return return_temp;
	}
	public void setReturn_temp(Double return_temp) {
		this.return_temp = return_temp;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
