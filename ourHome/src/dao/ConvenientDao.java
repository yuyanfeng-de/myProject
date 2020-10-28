package dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import pojo.Convenient;

@Repository
@Mapper
public interface ConvenientDao {

	public List<Convenient> selectAllConvenient();
	public int insertConvenient(Convenient convenient);
	public int delConvenient(@Param("id_i") int id_i);
	public int updateConvenient(Convenient convenient);
}
