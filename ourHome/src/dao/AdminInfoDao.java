package dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import pojo.AdminInfo;

@Repository
@Mapper
public interface AdminInfoDao {

	public AdminInfo selectAmdin(@Param("loginName") String loginName,@Param("password") String password);
	public int updatePassword(@Param("password") String password,@Param("id") int id);
}
