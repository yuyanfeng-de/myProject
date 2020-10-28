package dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import pojo.Elderly;
import pojo.Query_2;
import pojo.Temp_1;
import pojo.Temp_2;
import pojo.Volunteers;

@Mapper
@Repository
public interface VerifyDao {

	public int updateRoot_u(Temp_1 temp_1);
	public int updateVerify_v(Temp_1 temp_1);
	public int updateVerify_v2(Temp_1 temp_1);
	
	public Volunteers selectInfoById_v(@Param("uid") int uid);
	public int insertVerify_v(Temp_1 temp_1);
	public int delVerify_v(@Param("uid") int uid);
	
	public List<Query_2>selectVerify_e();
	
	public int updateRoot_u2(Temp_2 temp_2);
	public int updateVerify_e(Temp_2 temp_2);
	public int updateVerify_e2(Temp_2 temp_2);
	
	public Elderly selectInfoById_e(@Param("uid") int uid);
	public int insertVerify_e(Temp_2 temp_2);
	public int delVerify_e(@Param("uid") int uid);
	public List<Query_2>selectVerifyByName_e(@Param("uname") String uname);
	
	public int countExamine_0();
	public int countExamine_v0();
	public int countExamine_e0();
}
