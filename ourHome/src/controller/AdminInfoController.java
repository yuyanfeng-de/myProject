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
	//��¼
	@RequestMapping("/AdminLogin")
	public String main(HttpServletRequest request,Model model,HttpSession session) {		
	String loginName = request.getParameter("loginName");
	String password = request.getParameter("password");
	
	//��ͨ��Ϣ�������
	int count = verifyService.countExamine_0();
	//��֤�������
	int count2 = verifyService.countExamine_e0()+verifyService.countExamine_v0();
	//��δ���ŵķ����¼��
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
		model.addAttribute("message","�˺Ż���������������������룡");
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
	
	//�޸�����
	@RequestMapping("/updatePassword")
	public String updateUpassword(HttpServletRequest request,HttpServletResponse response) {
		String password = request.getParameter("password");
		String npassword = request.getParameter("npassword");
		String rpassword = request.getParameter("rpassword");
		
		String message="";
		
		//ȡ����¼ʱ�����session
		AdminInfo admin=(AdminInfo) request.getSession().getAttribute("AdminInfo");
		//�Ա�ԭʼ�����Ƿ���ȷ
		if(password.equals(admin.getPassword()))
		{
			//��ȷ���Ա��������ȷ���������Ƿ�һ�´�
			if(npassword.equals(rpassword)) {
				//�����޸����뷽��
				int n = adminService.updatePassword(rpassword, admin.getId());
				if(n>0) {
					message="�޸ĳɹ��������µ�¼";
					request.setAttribute("message", message);
					return "forward:/admin/";
				}else {
					message="�޸�����ʧ��";
				}
			}else {
				message="�������������벻һ��";
			}
		}else {
			message="ԭʼ�����������";
		}
		request.setAttribute("message", message);
		request.setAttribute("password", password);
		request.setAttribute("npassword", npassword);
		request.setAttribute("rpassword", rpassword);
		return "admin/change-password";
	}
	
	//ע��
	@RequestMapping("/AdminLogout")
	public String adminLogout(HttpServletRequest request) {
		// ɾ������session
		Enumeration em = request.getSession().getAttributeNames();
		while (em.hasMoreElements()) {
			request.getSession().removeAttribute(em.nextElement().toString());
		}
		return "redirect:/before/";
	}
	

	
}
