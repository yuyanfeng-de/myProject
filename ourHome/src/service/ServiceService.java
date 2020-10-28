package service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ServiceDao;
import pojo.Service2;
import pojo.Temp3;
import pojo.Temp4;

@Service
public class ServiceService {

	@Autowired
	private ServiceDao serviceDao;
	public List<Service2> selectAllService(){
		return serviceDao.selectAllService();
	}
	
	public List<Temp3> selectVolunteerNames(){
		return serviceDao.selectVolunteerNames();
	}
	public String selectVolunteerName(int id_v){
		return serviceDao.selectVolunteerName(id_v);
	}
	
	public int updateServiceById(Service2 service2) {
		return serviceDao.updateServiceById(service2);
	}
	public int delServiceById(int id_s) {
		return serviceDao.delServiceById(id_s);
	}
	public int updateService_c(Date date,int id_s) {
		return serviceDao.updateService_c(date,id_s);
	}
	public List<Service2> selectServiceByUT(String uname,String date){
		return serviceDao.selectServiceByUT(uname, date);
	}
	public int insertService(Service2 service2) {
		return serviceDao.insertService(service2);
	}
	public List<Service2> selectComplete(int condition){
		return serviceDao.selectComplete(condition);
	}
	public int countComplete_0() {
		return serviceDao.countComplete_0();
	}
	public List<Service2> selectComplete_2(){
		return serviceDao.selectComplete_2();
	}
	public List<Service2> selectServiceById_v(int id_v){
		return serviceDao.selectServiceById_v(id_v);
	}
	public int selectId_vByUid(int uid) {
		return serviceDao.selectId_vByUid(uid);
	}
	public int updateCompleteBefore(Service2 service2) {
		return serviceDao.updateCompleteBefore(service2);
	}
	public int updateService_c2(Service2 service2) {
		return serviceDao.updateService_c2(service2);
	}
	public List<Service2> selectComplete_3(){
		return serviceDao.selectComplete_3();
	}
}
