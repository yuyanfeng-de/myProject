package dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import pojo.User2;

@Repository
@Mapper
public interface BeforeDao {

	public User2 selectUser(@Param("uname") String uname,@Param("upassword") String upassword);
	public int updatePassword(@Param("upassword") String upassword,@Param("uid") int uid);
}
