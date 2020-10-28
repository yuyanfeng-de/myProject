package dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import pojo.User;
import pojo.Query_1;

@Mapper
@Repository
public interface UserDao {

	public List<User> selectAllUser();
	public List<User> selectRole(@Param("condition") int condition);
	public int delUser(int uid);
	public List<User> selectUserByInfo(@Param("condition") String condition);
	public int insertUser(User user);
	public int updateUserById(User user);
	
	public List<User> selectUserByExamine();
	public int updateUserById2(User user);
	public List<User> selectUserByName2(@Param("uname") String uname);
	public int delUser2(int uid);
	
	public List<Query_1> selectVerify_v();
	public List<Query_1>selectVerifyByName_v(@Param("uname") String uname);
	
	public int updateTime(@Param("date")Date date,@Param("uid") int uid);
	public List<User> selectUserByUid(@Param("uid") int uid);
}
