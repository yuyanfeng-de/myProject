package dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import pojo.Report;
import pojo.Report2;
import pojo.Service2;
import pojo.Temp4;

@Repository
@Mapper
public interface ReportDao {

	public int insertReport(Report report);
	public List<Report> selectReport();
	
	public int updateStatus(@Param("id_u") int id_u);
	public List<Report> selectReport2(@Param("id_u") int id_u);
	public int updateReport(Report report);
	
	public List<Report2> selectAllReport();
	public int delReportById(@Param("id_t") int id_t);
	
	public List<Report2> selectReportByUT(@Param("uname") String uname,@Param("date") String date);
	public List<Report2> selectTemp_h();
	
	public List<Temp4> selectCount_T();
}
