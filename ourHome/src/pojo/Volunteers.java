package pojo;

public class Volunteers {

	private int id_v;
	private int id_u; //user.uid �����
	private String occupation;
	private String specialty;
	private String intention; //��������
	private String experience; //��ع�������
	private String other; //����˵����Ҫ��
	private int examine_v;//���״̬ 0δ���/1�����/2���δͨ��
	private int status;
	
	public int getId_v() {
		return id_v;
	}
	public void setId_v(int id_v) {
		this.id_v = id_v;
	}
	public int getId_u() {
		return id_u;
	}
	public void setId_u(int id_u) {
		this.id_u = id_u;
	}
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	public String getSpecialty() {
		return specialty;
	}
	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}
	public String getIntention() {
		return intention;
	}
	public void setIntention(String intention) {
		this.intention = intention;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	public String getOther() {
		return other;
	}
	public void setOther(String other) {
		this.other = other;
	}
	public int getExamine_v() {
		return examine_v;
	}
	public void setExamine_v(int examine_v) {
		this.examine_v = examine_v;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
