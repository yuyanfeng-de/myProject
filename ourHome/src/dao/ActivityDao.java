package dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import pojo.Activity;
import pojo.Notice;

@Repository
@Mapper
public interface ActivityDao {
	
	public List<Activity>selectAllActivity();
	public int updateActivity(Activity activity);
	
	public int delActivityById(@Param("id_a") int id_a );
	public List<Activity> selectActivityByTT(@Param("theme") String theme,@Param("date") String date);
	
	public int insertActivity(Activity activity);
	
	public List<Activity> selectActivity_0();
	public List<Activity> selectActivity_1();
	public List<Activity> selectActivity_2();
	
	public List<Activity> selectActivity_main();
}
