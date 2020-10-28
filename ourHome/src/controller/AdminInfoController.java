package controller;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pojo.AdminInfo;
import service.AdminInfoService;
import service.PurchaseService;
import service.ServiceService;
import service.VerifyService;

@Controller
@RequestMapping("/admin")
public class AdminInfoController{

	@Autowired
	private AdminInfoService adminService;
	@Autowired
	private VerifyService verifyService;
	@Autowired
	private ServiceService serviceService;
	@Autowired
	private PurchaseService purchaseService;
	
	@RequestMapping("/")
	public String root () {
		return "admin/login";
	}
	
	@RequestMapping("/main")
	public String main_s() {
		return "admin/main";
	}
	
	@RequestMapping("/resident")
	public String registration_r() {
		return "admin/registration_r";
	}
	
	@RequestMapping("/visitor")
	public String registration_v() {
		return "admin/registration_v";
	}
	

	@RequestMapping("/generalVerify")
	public String generalVerify() {
		return "admin/generalVerify";
	}
	
	@RequestMapping("/volunteerVerify")
	public String VolunteerVerify() {
		return "admin/volunteerVerify";
	}
	
	@RequestMapping("/elderlyVerify")
	public String elderlyVerify() {
		return "admin/elderlyVerify";
	}
	
	@RequestMapping("/notice-list")
	public String notice() {
		return "admin/notice-list";
	}
	
	@RequestMapping("/activity-list")
	public String activity() {
		return "admin/activity-list";
	}
	 
	@RequestMapping("/serviceAppoint")
	public String service2() {
		return "admin/serviceAppoint";
	}
	
	@RequestMapping("/reportInfo")
	public String report() {
		return "admin/reportInfo";
	}
	
	@RequestMapping("/convenient")
	public String convenient() {
		return "admin/convenient";
	}
	
	@RequestMapping("/registration_c")
	public String car() {
		return "admin/registration_c";
	}
	
	
	@RequestMapping("/purchase")
	public String purchase() {
		return "admin/purchase";
	}
	
	
	@RequestMapping("/detailed")
	public String detailed() {
		return "admin/detailed";
	}
	//登录
	@RequestMapping("/AdminLogin")
	public String main(HttpServletRequest request,Model model,HttpSession session) {		
	String loginName = request.getParameter("loginName");
	String password = request.getParameter("password");
	
	//普通信息审核条数
	int count = verifyService.countExamine_0();
	//认证审核条数
	int count2 = verifyService.countExamine_e0()+verifyService.countExamine_v0();
	//还未安排的服务记录数
	int count3 = serviceService.countComplete_0();
	
	int count4 = purchaseService.selectComplete_3();
	if(adminService.selectAmdin(loginName,password) != null) {
		 session.setAttribute("AdminInfo", adminService.selectAmdin(loginName,password));
		 session.setAttribute("count", count);
		 session.setAttribute("count2", count2);
		 session.setAttribute("count3", count3);
		 session.setAttribute("count4", count4);
		 return "admin/main";
	}else {
		model.addAttribute("loginName", loginName);
		model.addAttribute("password", password);
		model.addAttribute("message","账号或密码输入错误请重新输入！");
		return "admin/login";
	}
	 
	}
	@RequestMapping("/userManage")
	public String userManage() {
		return "admin/userManage";
	}
	
	@RequestMapping("/change-password")
	public String changePassword() {
		return "admin/change-password";
	}
	
	//修改密码
	@RequestMapping("/updatePassword")
	public String updateUpassword(HttpServletRequest request,HttpServletResponse response) {
		String password = request.getParameter("password");
		String npassword = request.getParameter("npassword");
		String rpassword = request.getParameter("rpassword");
		
		String message="";
		
		//取出登录时保存的session
		AdminInfo admin=(AdminInfo) request.getSession().getAttribute("AdminInfo");
		//对比原始密码是否正确
		if(password.equals(admin.getPassword()))
		{
			//正确，对比新密码和确认新密码是否一致辞
			if(npassword.equals(rpassword)) {
				//调用修改密码方法
				int n = adminService.updatePassword(rpassword, admin.getId());
				if(n>0) {
					message="修改成功，请重新登录";
					request.setAttribute("message", message);
					return "forward:/admin/";
				}else {
					message="修改密码失败";
				}
			}else {
				message="两次新密码输入不一致";
			}
		}else {
			message="原始密码输入错误";
		}
		request.setAttribute("message", message);
		request.setAttribute("password", password);
		request.setAttribute("npassword", npassword);
		request.setAttribute("rpassword", rpassword);
		return "admin/change-password";
	}
	
	//注销
	@RequestMapping("/AdminLogout")
	public String adminLogout(HttpServletRequest request) {
		// 删除所有session
		Enumeration em = request.getSession().getAttributeNames();
		while (em.hasMoreElements()) {
			request.getSession().removeAttribute(em.nextElement().toString());
		}
		return "redirect:/before/";
	}
	

	
}
