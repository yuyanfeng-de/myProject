package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pojo.GridData;
import pojo.Query_1;
import pojo.User;
import service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	//��ѯ�����û�
	@RequestMapping("/selectAllUser")
	@ResponseBody
	public GridData<User> selectAllUser(){
		
		GridData<User> gridData = new GridData<User>("0", "ok", 1);
		gridData.setData(userService.selectAllUser());
		
		return gridData;
	}
	
	
	//���ݽ�ɫ���ѯ
	@RequestMapping("/selectRole")
	@ResponseBody
	public GridData<User> selectRole(HttpServletRequest request){
		System.out.println(request.getParameter("condition"));
		int condition = Integer.parseInt(request.getParameter("condition"));
		
		GridData<User> gridData = new GridData<User>("0", "ok", 1);
		gridData.setData(userService.selectRole(condition));
			
		return gridData;
	}
	
	
	//����uidɾ���û�
	@RequestMapping("/delUser")
	public String delUser(HttpServletRequest request) {
		int uid = Integer.parseInt(request.getParameter("uid"));
		userService.delUser(uid);
		return "redirect:/admin/userManage";
	}
	
	//ͨ���ַ�ģ�������û�
	@RequestMapping("/selectUserByInfo")
	@ResponseBody
	public GridData<User> selectUserByInfo(HttpServletRequest request) {
		String condition = request.getParameter("condition");
		
		GridData<User> gridData = new GridData<User>("0", "ok", 1);
		gridData.setData(userService.selectUserByInfo(condition));
		
		return gridData;	
	}
	
	//�����û���Ϣ
	@RequestMapping("/insertUser")
	@ResponseBody
	public User insertUser(@RequestBody User user) {
		userService.insertUser(user);
		return user;
	}
	
	//�����û���Ϣ
	@RequestMapping("/updateUserById")
	@ResponseBody
	public User updateUserById(@RequestBody User user) {
		userService.updateUserById(user);
		return user;
	}
	
	//��user2�в���������Ϣ
	@RequestMapping("/selectUserByExamine")
	@ResponseBody
	public GridData<User> selectUserByExamine(){
		
		GridData<User> gridData = new GridData<User>("0", "ok", 1);
		gridData.setData(userService.selectUserByExamine());
		
		return gridData;
	}
	
	//����uidɾ���û�
	@RequestMapping("/delUser2")
	public String delUser2(HttpServletRequest request) {
		int uid = Integer.parseInt(request.getParameter("uid"));
		userService.delUser2(uid);
		return "redirect:/admin/generalVerify";
	}
	
	//ֻ���� user2��Ϣ
	@RequestMapping("/updateUserById2")
	@ResponseBody
	public User updateUserById2(@RequestBody User user) {
		userService.updateUserById2(user);
		return user;
	}
	
	//user2 �в����û�
	@RequestMapping("/selectUserByName2")
	@ResponseBody
	public GridData<User> selectUserByName2(HttpServletRequest request) {
		String uname = request.getParameter("uname");
		
		GridData<User> gridData = new GridData<User>("0", "ok", 1);
		gridData.setData(userService.selectUserByName2(uname));
		
		return gridData;	
	}
	
	//����user��user2��Ϣ
	@RequestMapping("/updateUserById3")
	@ResponseBody
	public User updateUserById3(@RequestBody User user) {
		userService.updateUserById(user);
		userService.updateUserById2(user);
		return user;
	}
	

	@RequestMapping("/selectVerify_v")
	@ResponseBody
	public GridData<Query_1> selectVerify_v() {

		GridData<Query_1> gridData = new GridData<Query_1>("0", "ok", 1);
		gridData.setData(userService.selectVerify_v());
		
		return gridData;	
	}
	
	@RequestMapping("/selectVerifyByName_v")
	@ResponseBody
	public GridData<Query_1> selectVerifyByName_v(HttpServletRequest request) {
		String uname = request.getParameter("uname");
		
		GridData<Query_1> gridData = new GridData<Query_1>("0", "ok", 1);
		gridData.setData(userService.selectVerifyByName_v(uname));
		
		return gridData;	
	}
	
	//��ѯ�����û�
	@RequestMapping("/selectUserByUid")
	@ResponseBody
	public GridData<User> selectUserByUid(HttpServletRequest request){
		int uid = Integer.parseInt(request.getParameter("uid"));
		GridData<User> gridData = new GridData<User>("0", "ok", 1);
		gridData.setData(userService.selectUserByUid(uid));
			
		return gridData;
	}
	
}
