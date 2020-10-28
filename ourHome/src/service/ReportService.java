package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ReportDao;
import pojo.Report;
import pojo.Report2;
import pojo.Temp4;

@Service
public class ReportService {

	@Autowired
	private ReportDao reportDao;
	
	public int insertReport(Report report) {
		return reportDao.insertReport(report);
	}
	public List<Report> selectReport(){
		return reportDao.selectReport();
	}
	public int updateStatus(int id_u) {
		return reportDao.updateStatus(id_u);
	}
	public List<Report> selectReport2(int id_u){
		return reportDao.selectReport2(id_u);
	}
	public int updateReport(Report report){
		return reportDao.updateReport(report);
	}
	public List<Report2> selectAllReport(){
		return reportDao.selectAllReport();
	}
	public int delReportById(int id_t) {
		return reportDao.delReportById(id_t);
	}
	public List<Report2> selectReportByUT(String uname,String date){
		return reportDao.selectReportByUT(uname, date);
	}
	public List<Report2> selectTemp_h(){
		return reportDao.selectTemp_h();
	}
	public List<Temp4> selectCount_T(){
		return reportDao.selectCount_T();
	}
}
