package dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import pojo.Service2;
import pojo.Temp3;
import pojo.Temp4;

@Repository
@Mapper
public interface ServiceDao {

	public List<Service2> selectAllService();
	
	public List<Temp3> selectVolunteerNames();
	public String selectVolunteerName(@Param("id_v") int id_v);
	
	public int updateServiceById(Service2 service2);
	public int delServiceById(@Param("id_s") int id_s);
	public int updateService_c(@Param("date") Date date,@Param("id_s") int id_s);
	public List<Service2> selectServiceByUT(@Param("uname") String uname,@Param("date") String date);
	
	public int insertService(Service2 service2);
	
	public List<Service2> selectComplete(@Param("condition") int condition);
	
	public int countComplete_0();
	public List<Service2> selectComplete_2();
	public List<Service2> selectServiceById_v(@Param("id_v") int id_v);
	public int selectId_vByUid(@Param("uid") int uid);
	
	public int updateCompleteBefore(Service2 service2);
	
	public int updateService_c2(Service2 service2);
	public List<Service2> selectComplete_3();
	
}
