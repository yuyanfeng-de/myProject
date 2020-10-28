package pojo;

import java.util.List;

public class GridData<T> {

	private String code;
	private String msg;
	private int count;
	
	private List<T> data;
	
	public GridData (){
	}
	public GridData (String code,String msg,int count){
		this.code=code;
		this.msg=msg;
		this.count=count;
	}
	
	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
}
