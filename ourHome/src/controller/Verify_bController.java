package controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pojo.Elderly;
import pojo.Volunteers;
import service.UserService;
import service.Verify_bService;

@Controller
@RequestMapping("/before")
public class Verify_bController {

	@Autowired
	private Verify_bService verify_bService;
	@Autowired
	private UserService UserService;
	
	@RequestMapping("/insertVerfy_e")
	@ResponseBody
	public Elderly  updateVerifyInfo_e(@RequestBody Elderly elderly) {
		int uid = elderly.getId_u();
		//当前时间
		Timestamp date = new Timestamp(new Date().getTime());
		UserService.updateTime(date, uid);
		
		if(verify_bService.selectInfoById_e(uid) != null) {
			verify_bService.updateVerify_e(elderly);
		}else {
			verify_bService.insertVerfy_e(elderly);
		}
		return elderly;
	}
	
	@RequestMapping("/insertVerfy_v")
	@ResponseBody
	public Volunteers  updateVerifyInfo_v(@RequestBody Volunteers volunteers) {
		int uid = volunteers.getId_u();
		Timestamp date = new Timestamp(new Date().getTime());
		UserService.updateTime(date, uid);
		
		if(verify_bService.selectInfoById_v(uid) != null) {
			verify_bService.updateVerify_v(volunteers);
		}else {
			verify_bService.insertVerfy_v(volunteers);
		}
		return volunteers;
	}
}
