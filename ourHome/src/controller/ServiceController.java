package controller;


import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pojo.Activity;
import pojo.GridData;
import pojo.Mobility_r;
import pojo.Notice;
import pojo.Service2;
import pojo.Temp3;
import pojo.User;
import service.ActivityService;
import service.ServiceService;

@Controller
@RequestMapping("/service")
public class ServiceController {

	@Autowired
	private ServiceService serviceService;
	@Autowired
	private ActivityService activityService;
	
	@RequestMapping("/selectAllService")
	@ResponseBody
	public GridData<Service2> selectAllService(){
				
		GridData<Service2> gridData = new GridData<Service2>("0", "ok", 1);
		
		List<Service2> list = serviceService.selectAllService();
		int id_v;
		List<Temp3>temps;
		
		Map<Integer, String> map = new HashMap<Integer, String>();
		String name_v;
		for(Service2 ss:list) {
			id_v = ss.getId_v();
			if((Integer)id_v != null && id_v !=0) {
				name_v = serviceService.selectVolunteerName(id_v);
				ss.setName_v(name_v);
			}else {
				temps= serviceService.selectVolunteerNames();
				if(temps != null) {
					for(Temp3 tt:temps) {
						map.put(tt.getId_v(), tt.getUname());
					}
					ss.setName_vs(map);
				}
			}
		}
		gridData.setData(list);
				
		return gridData;
	}
	
	@RequestMapping("/updateServiceById")
	@ResponseBody
	public Service2 updateServiceById(@RequestBody Service2 service2) {
		serviceService.updateServiceById(service2);
		return service2;
	}
	
	@RequestMapping("/updateServiceById2")
	@ResponseBody
	public Service2 updateServiceById2(@RequestBody Service2 service2) {
		int uid = service2.getId_v();
		int id_v = serviceService.selectId_vByUid(uid);
		service2.setId_v(id_v);
		serviceService.updateServiceById(service2);
		return service2;
	}
	
	//删除任务
	@RequestMapping("/delServiceById")
	public String delServiceById(HttpServletRequest request) {
		int id_s = Integer.parseInt(request.getParameter("id_s"));
		serviceService.delServiceById(id_s);
		return "redirect:/admin/serviceAppoint";
	}
	
	@RequestMapping("/updateService_c")
	@ResponseBody
	public Service2 updateService_c(@RequestBody Service2 service2) {
		Timestamp date = new Timestamp(new Date().getTime());
		service2.setComplete_time(date);
		serviceService.updateService_c2(service2);
		
		//将完成的服务记录 更新到活动
		String name = serviceService.selectVolunteerName(service2.getId_v());
		String theme="志愿服务活动";
		String object=service2.getObject();
		Date service_time= service2.getAppoint_time();
		Date end_time=service2.getComplete_time();
		String location = service2.getLocation();
		String describe ="参与志愿者:"+name+"\n详情描述:"+service2.getContext();
		Date publishTime=service2.getComplete_time();
		
		Activity activity = new Activity();
		activity.setTheme(theme);
		activity.setObject(object);
		activity.setService_time(service_time);
		activity.setEnd_time(end_time);
		activity.setDescribe(describe);
		activity.setPublishTime(publishTime);
		activity.setLocation(location);
		
		activityService.insertActivity(activity);
		
		return service2;
	}
	/*
	//更改任务状态
	@RequestMapping("/updateService_c")
	public String updateService_c(HttpServletRequest request) {
		int id_s = Integer.parseInt(request.getParameter("id_s"));
		//当前时间
		Timestamp date = new Timestamp(new Date().getTime());
		String theme= ;
		serviceService.updateService_c(date,id_s);
		return "redirect:/admin/serviceAppoint";
	}*/
	
	@RequestMapping("/selectServiceByUT")
	@ResponseBody
	public GridData<Service2> selectServiceByUT(HttpServletRequest request){
		String uname = request.getParameter("uname");
		String date = request.getParameter("date");
		GridData<Service2> gridData = new GridData<Service2>("0", "ok", 1);
		
		List<Service2> list = serviceService.selectServiceByUT(uname, date);
		
		int id_v;
		List<Temp3>temps;
		Map<Integer, String> map = new HashMap<Integer, String>();
		String name_v;
		
		for(Service2 ss:list) {
			id_v = ss.getId_v();
			if((Integer)id_v != null && id_v !=0) {
				name_v = serviceService.selectVolunteerName(id_v);
				ss.setName_v(name_v);
			}else {
				temps= serviceService.selectVolunteerNames();
				if(temps != null) {
					for(Temp3 tt:temps) {
						map.put(tt.getId_v(), tt.getUname());
					}
					ss.setName_vs(map);
				}
			}
		}
		gridData.setData(list);
		return gridData;
	}
	
	@RequestMapping("/insertService")
	@ResponseBody
	public Service2 insertService(@RequestBody Service2 service2) {
		serviceService.insertService(service2);
		return service2;
	}
	
    //根据服务完成状态查询
	@RequestMapping("/selectComplete")
	@ResponseBody
	public GridData<Service2> selectComplete(HttpServletRequest request){
		int condition = Integer.parseInt(request.getParameter("condition"));
		
		GridData<Service2> gridData = new GridData<Service2>("0", "ok", 1);
		gridData.setData(serviceService.selectComplete(condition));
			
		return gridData;
	}
	
	@RequestMapping("/selectComplete_2")
	@ResponseBody
	public GridData<Service2> selectComplete2(){

		GridData<Service2> gridData = new GridData<Service2>("0", "ok", 1);
		List<Service2> list = serviceService.selectComplete_2();
	
		int id_v;
		String name_v;
		for(Service2 ss:list) {
			id_v = ss.getId_v();
			if((Integer)id_v != null && id_v !=0) {
				name_v = serviceService.selectVolunteerName(id_v);
				ss.setName_v(name_v);
			}
		}
		gridData.setData(list);
			
		return gridData;
	}
	
	@RequestMapping("/selectServiceById_v")
	@ResponseBody
	public GridData<Service2> selectServiceById_v(HttpServletRequest request){
		int uid = Integer.parseInt(request.getParameter("uid"));
		int id_v =  serviceService.selectId_vByUid(uid);
		
		GridData<Service2> gridData = new GridData<Service2>("0", "ok", 1);
		
		//安排的志愿服务
		List<Service2> list = serviceService.selectServiceById_v(id_v);
		//还未安排的志愿服务
		List<Service2> list2 =serviceService.selectComplete_3();
		
		
		String name_v;
		for(Service2 ss:list) {
			id_v = ss.getId_v();
			if((Integer)id_v != null && id_v !=0) {
				name_v = serviceService.selectVolunteerName(id_v);
				ss.setName_v(name_v);
			}
		}

		for(Service2 sss:list2) {
			list.add(sss);
		}

		gridData.setData(list);
				
		return gridData;
	}
	
	@RequestMapping("/updateCompleteBefore")
	@ResponseBody
	public Service2 updateCompleteBefore(@RequestBody Service2 service2) {
		Timestamp date = new Timestamp(new Date().getTime());
		service2.setComplete_time(date);
		serviceService.updateCompleteBefore(service2);
		
		//将完成的服务记录 更新到活动
		String name = serviceService.selectVolunteerName(service2.getId_v());
		String theme="志愿服务活动";
		String object=service2.getObject();
		Date service_time= service2.getAppoint_time();
		Date end_time=service2.getComplete_time();
		String location = service2.getLocation();
		String describe ="参与志愿者:"+name+"\n详情描述:"+service2.getContext();
		Date publishTime=service2.getComplete_time();
		
		Activity activity = new Activity();
		activity.setTheme(theme);
		activity.setObject(object);
		activity.setService_time(service_time);
		activity.setEnd_time(end_time);
		activity.setDescribe(describe);
		activity.setPublishTime(publishTime);
		activity.setLocation(location);
		
		activityService.insertActivity(activity);
		return service2;
	}
}
