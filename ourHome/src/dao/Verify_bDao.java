package dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import pojo.Elderly;
import pojo.Volunteers;

@Repository
@Mapper
public interface Verify_bDao {

	public List<Elderly> selectInfoById_e(@Param("uid") int uid);
	public  int updateVerify_e(Elderly elderly);
	public  int insertVerfy_e(Elderly elderly);
	
	public List<Volunteers> selectInfoById_v(@Param("uid") int id_u);
	public int updateVerify_v(Volunteers volunteers);
	public int insertVerfy_v(Volunteers volunteers);
}
