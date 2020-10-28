package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ActivityDao;
import pojo.Activity;

@Service
public class ActivityService {

	@Autowired
	private ActivityDao activityDao;
	
	public List<Activity>selectAllActivity(){
		return activityDao.selectAllActivity();
	}
	public int updateActivity(Activity activity) {
		return activityDao.updateActivity(activity);
	}
	
	public int delActivityById(int id_a ) {
		return activityDao.delActivityById(id_a);
	}
	
	public List<Activity> selectActivityByTT(String theme,String date){
		return activityDao.selectActivityByTT(theme, date);
	}
	
	public int insertActivity(Activity activity) {
		return activityDao.insertActivity(activity);
	}
	
	public List<Activity> selectActivity_0() {
		return activityDao.selectActivity_0();
	}
	public List<Activity> selectActivity_1() {
		return activityDao.selectActivity_1();
	}
	public List<Activity> selectActivity_2() {
		return activityDao.selectActivity_2();
	}
	
	public List<Activity> selectActivity_main(){
		return activityDao.selectActivity_main();
	}
}
