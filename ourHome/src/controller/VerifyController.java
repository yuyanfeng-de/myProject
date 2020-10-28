package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pojo.GridData;
import pojo.Query_2;
import pojo.Temp_1;
import pojo.Temp_2;
import service.VerifyService;

@Controller
@RequestMapping("/verify")
public class VerifyController {

	@Autowired
	private VerifyService verifyService;
	
	@RequestMapping("/updateVerifyInfo_v")
	@ResponseBody
	public Temp_1  updateVerifyInfo_v(@RequestBody Temp_1 temp_1) {
		verifyService.updateRoot_u(temp_1);
		verifyService.updateVerify_v2(temp_1);
		
		if(verifyService.selectInfoById_v(temp_1.getUid()) != null) {
			verifyService.updateVerify_v(temp_1);
		}else {
			verifyService.insertVerify_v(temp_1);
		}
		return temp_1;
	}
	
	@RequestMapping("/updateVerifyInfo_v2")
	@ResponseBody
	public Temp_1 updateVerifyInfo_v2(@RequestBody Temp_1 temp_1) {
		
		verifyService.updateVerify_v2(temp_1);
		return temp_1;
	}
	
	@RequestMapping("/delVerify_v")
	public String delVerifyr_v(HttpServletRequest request) {
		int uid = Integer.parseInt(request.getParameter("uid"));
		verifyService.delVerify_v(uid);
		return "redirect:/admin/volunteerVerify";
	}
	
	@RequestMapping("/selectVerify_e")
	@ResponseBody
	public GridData<Query_2> selectVerify_e() {

		GridData<Query_2> gridData = new GridData<Query_2>("0", "ok", 1);
		gridData.setData(verifyService.selectVerify_e());
		
		return gridData;
	}
	
	@RequestMapping("/selectVerifyByName_e")
	@ResponseBody
	public GridData<Query_2> selectVerifyByName_e(HttpServletRequest request) {
		String uname = request.getParameter("uname");
		
		GridData<Query_2> gridData = new GridData<Query_2>("0", "ok", 1);
		gridData.setData(verifyService.selectVerifyByName_e(uname));
		
		return gridData;
	}
	
	@RequestMapping("/updateVerifyInfo_e")
	@ResponseBody
	public Temp_2  updateVerifyInfo_e(@RequestBody Temp_2 temp_2) {
		verifyService.updateRoot_u2(temp_2);
		verifyService.updateVerify_e(temp_2);
		
		if(verifyService.selectInfoById_e(temp_2.getUid()) != null) {
			verifyService.updateVerify_e2(temp_2);
		}else {
			verifyService.insertVerify_e(temp_2);
		}
		return temp_2;
	}
	
	@RequestMapping("/updateVerifyInfo_e2")
	@ResponseBody
	public Temp_2 updateVerifyInfo_e2(@RequestBody Temp_2 temp_2) {
		
		verifyService.updateVerify_e2(temp_2);
		return temp_2;
	}
	
	@RequestMapping("/delVerify_e")
	public String delVerify_e(HttpServletRequest request) {
		int uid = Integer.parseInt(request.getParameter("uid"));
		verifyService.delVerify_e(uid);
		return "redirect:/admin/elderlyVerify";
	}
	
}
