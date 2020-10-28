package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pojo.Mobility_r;
import pojo.Mobility_v;
import pojo.Mobility_c;
import pojo.GridData;
import service.MobilityService;

@Controller
@RequestMapping("/mobility")
public class MobilityController {

	
	@Autowired
	private MobilityService mobilityService;
	
	
	//查找居民登记信息
	@RequestMapping("/selectMobility_r")
	@ResponseBody
	public GridData<Mobility_r> selectMobility_r(){
		GridData<Mobility_r> gridData = new GridData<Mobility_r>("0", "ok", 1);
		gridData.setData(mobilityService.selectMobility_r());
		return gridData;	
	}
	
	
	//根据姓名、时间查找居民登记信息
	@RequestMapping("/selectMobilityByNT_r")
	@ResponseBody
	public GridData<Mobility_r> selectMobilityByNT_r(HttpServletRequest request){
		String name_r = request.getParameter("name_r");
		String date = request.getParameter("date");
		GridData<Mobility_r> gridData = new GridData<Mobility_r>("0", "ok", 1);
		gridData.setData(mobilityService.selectMobilityByNT_r(name_r, date));
		return gridData;
	}
	
	//删除一条居民登记信息
	@RequestMapping("/delMobility_rById")
	public String delMobility_rById(HttpServletRequest request) {
		int id_r = Integer.parseInt(request.getParameter("id_r"));
		mobilityService.delMobility_rById(id_r);
		return "redirect:/admin/resident";
	}
	
	//更新居民登记信息
	@RequestMapping("/updateMobility_rById")
	@ResponseBody
	public Mobility_r updateMobility_rById(@RequestBody Mobility_r mobility_r) {
		mobilityService.updateMobility_rById(mobility_r);
		return mobility_r;
	}
	
	//插入居民登记信息
	@RequestMapping("/insertMobility_r")
	@ResponseBody
	public Mobility_r insertMobility_r(@RequestBody Mobility_r mobility_r) {
		mobilityService.insertMobility_r(mobility_r);
		return mobility_r;
	}
	
	//查找访客登记信息
	@RequestMapping("/selectMobility_v")
	@ResponseBody
	public GridData<Mobility_v> selectMobility_v(){	
		GridData<Mobility_v> gridData = new GridData<Mobility_v>("0", "ok", 1);
		gridData.setData(mobilityService.selectMobility_v());
		return gridData;
	}
	
	//更新访客登记信息
	@RequestMapping("/updateMobility_vById")
	@ResponseBody
	public Mobility_v updateMobility_vById(@RequestBody Mobility_v mobility_v) {
		mobilityService.updateMobility_vById(mobility_v);
		return mobility_v;
	}
	
	//插入访客登记信息
	@RequestMapping("/insertMobility_v")
	@ResponseBody
	public Mobility_v insertMobility_v(@RequestBody Mobility_v mobility_v) {
		mobilityService.insertMobility_v(mobility_v);
		return mobility_v;
	}
	//删除访客登记信息
	@RequestMapping("/delMobility_vById")
	public String delMobility_vById(HttpServletRequest request) {
		int id_v = Integer.parseInt(request.getParameter("id_v"));
		mobilityService.delMobility_vById(id_v);
		return "redirect:/admin/visitor";
	}
	//根据姓名、时间查找访客登记信息
	@RequestMapping("/selectMobilityByNT_v")
	@ResponseBody
	public GridData<Mobility_v> selectMobilityByNT_v(HttpServletRequest request){
		String name_v = request.getParameter("name_v");
		String date = request.getParameter("date");
	
		GridData<Mobility_v> gridData = new GridData<Mobility_v>("0", "ok", 1);
		gridData.setData(mobilityService.selectMobilityByNT_v(name_v, date));

		return gridData;
	}
	
	
	@RequestMapping("/selectAllMobility_c")
	@ResponseBody
	public GridData<Mobility_c> selectAllMobility_c(){
		GridData<Mobility_c> gridData = new GridData<Mobility_c>("0", "ok", 1);
		gridData.setData(mobilityService.selectAllMobility_c());
		return gridData;	
	}

	@RequestMapping("/updateMobility_c")
	@ResponseBody
	public Mobility_c updateMobility_c(@RequestBody Mobility_c mobility_c) {
		mobilityService.updateMobility_c(mobility_c);
		return mobility_c;
	}
	
	@RequestMapping("/insertMobility_c")
	@ResponseBody
	public Mobility_c insertMobility_c(@RequestBody Mobility_c mobility_c) {
		mobilityService.insertMobility_c(mobility_c);
		return mobility_c;
	}
	
	@RequestMapping("/delMobility_c")
	public String delMobility_c(HttpServletRequest request) {
		int id_c = Integer.parseInt(request.getParameter("id_c"));
		mobilityService.delMobility_c(id_c);
		return "redirect:/admin/registration_c";
	}
	
	@RequestMapping("/selectMobilityByT_c")
	@ResponseBody
	public GridData<Mobility_c> selectMobilityByT_c(HttpServletRequest request){
		String date = request.getParameter("date");
		GridData<Mobility_c> gridData = new GridData<Mobility_c>("0", "ok", 1);
		gridData.setData(mobilityService.selectMobilityByT_c(date));
		return gridData;
	}
}
