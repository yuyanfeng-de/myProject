package pojo;

import java.util.Date;

/** 
 *  user role volunteers ������ѯ
 * @author lenovo
 *
 */

public class Query_1 {

	private int uid;
	private String upassword;
	private String uname;
	private String usex;
	private String uidcard;
	private String upolitic;
	private String ueducation;
	private String uaddress;
	private int ustatus;//�û��Ƿ����
	private int root;  //�û���ɫ 1��ͨ����/2־Ը��/3�¹�����
	private int examine; //��˱�ʶ 0δ���/1�����/2���δͨ��
	private String telephone_u;
	private Date apply_time; //�������ʱ��
	//private String root_name;
	private Volunteers volunteers;
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUpassword() {
		return upassword;
	}
	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUsex() {
		return usex;
	}
	public void setUsex(String usex) {
		this.usex = usex;
	}
	public String getUidcard() {
		return uidcard;
	}
	public void setUidcard(String uidcard) {
		this.uidcard = uidcard;
	}
	public String getUpolitic() {
		return upolitic;
	}
	public void setUpolitic(String upolitic) {
		this.upolitic = upolitic;
	}
	public String getUeducation() {
		return ueducation;
	}
	public void setUeducation(String ueducation) {
		this.ueducation = ueducation;
	}
	public String getUaddress() {
		return uaddress;
	}
	public void setUaddress(String uaddress) {
		this.uaddress = uaddress;
	}
	public int getUstatus() {
		return ustatus;
	}
	public void setUstatus(int ustatus) {
		this.ustatus = ustatus;
	}

	public int getRoot() {
		return root;
	}
	public void setRoot(int root) {
		this.root = root;
	}
	public int getExamine() {
		return examine;
	}
	public void setExamine(int examine) {
		this.examine = examine;
	}
	public String getTelephone_u() {
		return telephone_u;
	}
	public void setTelephone_u(String telephone_u) {
		this.telephone_u = telephone_u;
	}
	public Date getApply_time() {
		return apply_time;
	}
	public void setApply_time(Date apply_time) {
		this.apply_time = apply_time;
	}

	public Volunteers getVolunteers() {
		return volunteers;
	}
	public void setVolunteers(Volunteers volunteers) {
		this.volunteers = volunteers;
	}
	
	
	
}
