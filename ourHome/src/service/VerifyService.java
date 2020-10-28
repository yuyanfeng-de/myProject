package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.VerifyDao;
import pojo.Elderly;
import pojo.Query_2;
import pojo.Temp_1;
import pojo.Temp_2;
import pojo.Volunteers;

@Service
public class VerifyService {

	@Autowired
	private VerifyDao verifyDao;
	
	public int updateRoot_u(Temp_1 temp_1) {
		return verifyDao.updateRoot_u(temp_1);
	}
	public int updateVerify_v(Temp_1 temp_1) {
		return verifyDao.updateVerify_v(temp_1);
	}
	public int updateVerify_v2(Temp_1 temp_1) {
		return verifyDao.updateVerify_v2(temp_1);
	}
	public Volunteers selectInfoById_v(int uid) {
		return verifyDao.selectInfoById_v(uid);
	}
	
	public int insertVerify_v(Temp_1 temp_1) {
		return verifyDao.insertVerify_v(temp_1);
	}
	
	public int delVerify_v(int uid) {
		return verifyDao.delVerify_v(uid);
	}
	
	public List<Query_2>selectVerify_e(){
		return verifyDao.selectVerify_e();
	}
	
	public int updateRoot_u2(Temp_2 temp_2) {
		return verifyDao.updateRoot_u2(temp_2);
	}
	public int updateVerify_e(Temp_2 temp_2) {
		return verifyDao.updateVerify_e(temp_2);
	}
	public int updateVerify_e2(Temp_2 temp_2) {
		return verifyDao.updateVerify_e2(temp_2);
	}
	
	public Elderly selectInfoById_e(int uid) {
		return verifyDao.selectInfoById_e(uid);
	}
	public int insertVerify_e(Temp_2 temp_2) {
		return verifyDao.insertVerify_e(temp_2);
	}
	public int delVerify_e(int uid) {
		return verifyDao.delVerify_e(uid);
	}
	public List<Query_2>selectVerifyByName_e(String uname){
		return verifyDao.selectVerifyByName_e(uname);
	}
	public int countExamine_0() {
		return verifyDao.countExamine_0();
	}
	public int countExamine_v0(){
		return verifyDao.countExamine_v0();
	}
	public int countExamine_e0(){
		return verifyDao.countExamine_e0();
	}
}
