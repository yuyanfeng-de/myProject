package dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import pojo.Mobility_c;
import pojo.Mobility_r;
import pojo.Mobility_v;
import pojo.Temp5;

@Mapper
@Repository
public interface MobilityDao {
	
	public List<Mobility_r> selectMobility_r();
	public List<Mobility_r> selectMobilityByNT_r(@Param("name_r") String name_r,@Param("date") String date);
	public int delMobility_rById(int id_r);
	public int updateMobility_rById(Mobility_r mobility_r);
	public int insertMobility_r(Mobility_r mobility_r);
	
	public List<Mobility_v> selectMobility_v();
	public int updateMobility_vById(Mobility_v mobility_v);
	public int insertMobility_v(Mobility_v mobility_v);
	public int delMobility_vById(int id_v);
	public List<Mobility_v> selectMobilityByNT_v(@Param("name_v") String name_r,@Param("date") String date);
	
	public List<Temp5> selectCount_r();
	public List<Temp5> selectCount_v();
	public List<Temp5> selectCount_c();
	
	public List<Mobility_c> selectAllMobility_c();
	public int insertMobility_c(Mobility_c mobility_c);
	public int updateMobility_c(Mobility_c mobility_c);
	public int delMobility_c(@Param("id_c") int id_c);
	
	public List<Mobility_c> selectMobilityByT_c(@Param("date") String date);
}
