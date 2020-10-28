package dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import pojo.Allbuy;
import pojo.Temp3;
import pojo.Temp6;

@Repository
@Mapper
public interface PurchaseDao {

	public List<Temp6> select_1();
	public List<String> select_2();
	public List<Temp3> select_3();
	
	public List<Allbuy>selectAllbuy();
	public int insertDescribe(@Param("describe") String describe);
	public int updateAllbuyById(Allbuy allbuy);
	public int updateAllbuy_c(Allbuy allbuy);
	
	public List<Allbuy> selectAllbuyById(@Param("vtid") int vtid);
	public List<Allbuy> selectComplete_0();
	public int selectComplete_3();
}
