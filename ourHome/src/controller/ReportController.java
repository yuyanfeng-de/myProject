package controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pojo.GridData;
import pojo.Notice;
import pojo.Report;
import pojo.Report2;
import pojo.Service2;
import pojo.Temp3;
import pojo.Temp4;
import pojo.Temp5;
import service.MobilityService;
import service.ReportService;

@Controller
@RequestMapping("/report")
public class ReportController {

	@Autowired
	private ReportService reportService;
	@Autowired
	private MobilityService mobilityService;
	
	@RequestMapping("/insertReport")
	@ResponseBody
	public Report insertReport(@RequestBody Report report) {
		int id_u = report.getId_u();
		if(reportService.selectReport2(id_u)!=null) {
			reportService.updateReport(report);
		}else {
			reportService.insertReport(report);
		}
		return report;
	}
	
	@RequestMapping("/selectAllReport")
	@ResponseBody
	public GridData<Report2> selectAllReport(){
				
		GridData<Report2> gridData = new GridData<Report2>("0", "ok", 1);
		gridData.setData(reportService.selectAllReport());
				
		return gridData;
	}
	
	//根据id_t删除信息
	@RequestMapping("/delReportById")
	public String delReportById(HttpServletRequest request) {
		int id_t = Integer.parseInt(request.getParameter("id_t"));
		reportService.delReportById(id_t);
		return "redirect:/admin/reportInfo";
	}
	
	@RequestMapping("/selectReportByUT")
	@ResponseBody
	public GridData<Report2> selectReportByUT(HttpServletRequest request){
		String uname = request.getParameter("uname");
		String date = request.getParameter("date");
		GridData<Report2> gridData = new GridData<Report2>("0", "ok", 1);

		gridData.setData(reportService.selectReportByUT(uname, date));
		return gridData;
	}
	
	@RequestMapping("/selectTemp_h")
	@ResponseBody
	public GridData<Report2> selectTemp_h(){
		GridData<Report2> gridData = new GridData<Report2>("0", "ok", 1);
		gridData.setData(reportService.selectTemp_h());
		return gridData;
	}
	
	@RequestMapping("/selectCount_T")
	@ResponseBody
	public GridData<Temp4> selectCount_T(){
				
		GridData<Temp4> gridData = new GridData<Temp4>("0", "ok", 1);
		List<Temp4> temp4 = reportService.selectCount_T();
		List<Temp5> t_r = mobilityService.selectCount_r();
		List<Temp5> t_v = mobilityService.selectCount_v();
		List<Temp5> t_c = mobilityService.selectCount_c();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		int count;
		for(Temp5 tr:t_r) {
			for(Temp5 tv:t_v) {
				
				if(format.format(tr.getTime_r()).equals(format.format(tv.getTime_r()))) {
					count=tr.getCount_r()+tv.getCount_r();
					tr.setCount_r(count);
				}
			}
			

		}
		
		for(Temp4 t4:temp4) {
			for(Temp5 tr:t_r) {
				if(format.format(tr.getTime_r()).equals(format.format(t4.getReport_time()))) {
					t4.setCount_r(tr.getCount_r());
				}
				//t4.setCount(count);
			}
		}
		//车辆流动数
		for(Temp4 t4:temp4) {
			for(Temp5 tc:t_c) {
				if(format.format(tc.getTime_r()).equals(format.format(t4.getReport_time()))) {
					t4.setCount(tc.getCount_r());
				}
			}
		}
		gridData.setData(temp4);
				
		return gridData;
	}
}
