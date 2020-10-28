package controller;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pojo.Activity;
import pojo.GridData;
import pojo.Notice;
import service.ActivityService;
import service.NoticeService;

@Controller
@RequestMapping("/activity")
public class ActivityController {

	@Autowired
	private ActivityService activityService;
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/selectAllActivity")
	@ResponseBody
	public GridData<Activity> selectAllActivity(){
				
		GridData<Activity> gridData = new GridData<Activity>("0", "ok", 1);
		gridData.setData(activityService.selectAllActivity());
				
		return gridData;
	}
	
	@RequestMapping("/updateActivity")
	@ResponseBody
	public Activity updateActivity(@RequestBody Activity activity) {
		activityService.updateActivity(activity);
		return activity;
	}
	
	@RequestMapping("/delActivityById")
	public String delActivityById(HttpServletRequest request) {
		int id_a = Integer.parseInt(request.getParameter("id_a"));
		activityService.delActivityById(id_a);
		return "redirect:/admin/activity-list";
	}
	
	@RequestMapping("/selectActivityByTT")
	@ResponseBody
	public GridData<Activity> selectActivityByTT(HttpServletRequest request){
		String theme = request.getParameter("theme");
		String date = request.getParameter("date");
		GridData<Activity> gridData = new GridData<Activity>("0", "ok", 1);
		gridData.setData(activityService.selectActivityByTT(theme, date));
		return gridData;
	}
	
	@RequestMapping("/insertActivity")
	@ResponseBody
	public Activity insertActivity(@RequestBody Activity activity) {
		activityService.insertActivity(activity);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//将活动信息同步到公告
		String info = "服务对象:"+activity.getObject()+
						"\n服务地点:"+activity.getLocation()+"\n活动时间:"+format.format(activity.getService_time())+
						"-"+format.format(activity.getEnd_time())+"\n活动描述:"+activity.getDescribe();
		Notice notice =new Notice();
		notice.setTittle(activity.getTheme());
		notice.setPublishTime(activity.getPublishTime());
		notice.setContext(info);
		noticeService.insertNotice(notice);
		
		return activity;
	}
	
	@RequestMapping("/selectActivity_0")
	@ResponseBody
	public GridData<Activity> selectActivity_0(){

		GridData<Activity> gridData = new GridData<Activity>("0", "ok", 1);
		gridData.setData(activityService.selectActivity_0());
		return gridData;
	}
	
	@RequestMapping("/selectActivity_1")
	@ResponseBody
	public GridData<Activity> selectActivity_1(){

		GridData<Activity> gridData = new GridData<Activity>("0", "ok", 1);
		gridData.setData(activityService.selectActivity_1());
		return gridData;
	}
	
	@RequestMapping("/selectActivity_2")
	@ResponseBody
	public GridData<Activity> selectActivity_2(){

		GridData<Activity> gridData = new GridData<Activity>("0", "ok", 1);
		gridData.setData(activityService.selectActivity_2());
		return gridData;
	}
	
	@RequestMapping("/selectActivity_main")
	@ResponseBody
	public GridData<Activity> selectActivity_main(){

		GridData<Activity> gridData = new GridData<Activity>("0", "ok", 1);
		gridData.setData(activityService.selectActivity_main());
		return gridData;
	}
}
