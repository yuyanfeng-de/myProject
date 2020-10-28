package service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDao;
import pojo.Query_1;
import pojo.User;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	public List<User> selectAllUser(){
		return userDao.selectAllUser();
	}
	
	public List<User> selectRole(int condition){
		return userDao.selectRole(condition);
	}
	
	public int delUser(int uid) {
		return userDao.delUser(uid);
	}
	
	public List<User> selectUserByInfo(String condition){
		return userDao.selectUserByInfo(condition);
	}
	
	public int insertUser(User user) {
		return userDao.insertUser(user);
	}
	
	public int updateUserById(User user) {
		return userDao.updateUserById(user);
	}
	
	public List<User> selectUserByExamine() {
		return userDao.selectUserByExamine();
	}
	
	public int updateUserById2(User user) {
		return userDao.updateUserById2(user);
	}
	
	public List<User> selectUserByName2(String uname){
		return userDao.selectUserByName2(uname);
	}
	
	public int delUser2(int uid) {
		return userDao.delUser2(uid);
	}
	
	public List<Query_1> selectVerify_v(){
		return userDao.selectVerify_v();
	}
	
	public List<Query_1>selectVerifyByName_v(String uname){
		return userDao.selectVerifyByName_v(uname);
	}
	
	public int updateTime(Date date,int uid) {
		return userDao.updateTime(date, uid);
	}
	
	public List<User> selectUserByUid(int uid){
		return userDao.selectUserByUid(uid);
	}
}
