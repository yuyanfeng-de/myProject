package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.Verify_bDao;
import pojo.Elderly;
import pojo.Volunteers;

@Service
public class Verify_bService {

	@Autowired
	private Verify_bDao verify_bDao;
	
	public List<Elderly> selectInfoById_e(int uid){
		return verify_bDao.selectInfoById_e(uid);
	}
	public  int updateVerify_e(Elderly elderly) {
		return verify_bDao.updateVerify_e(elderly);
	}
	public  int insertVerfy_e(Elderly elderly) {
		return verify_bDao.insertVerfy_e(elderly);
	}
	
	public List<Volunteers> selectInfoById_v(int id_u){
		return verify_bDao.selectInfoById_v(id_u);
	}
	public int updateVerify_v(Volunteers volunteers) {
		return verify_bDao.updateVerify_v(volunteers);
	}
	public int insertVerfy_v(Volunteers volunteers) {
		return verify_bDao.insertVerfy_v(volunteers);
	}
}
