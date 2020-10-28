package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AdminInfoDao;
import pojo.AdminInfo;

@Service
public class AdminInfoService {

	@Autowired
	private AdminInfoDao adminDao;
	public AdminInfo selectAmdin(String loginName,String password) {
		return adminDao.selectAmdin(loginName,password);
	}
	
	public int updatePassword(String password,int id) {
		return adminDao.updatePassword(password, id);
	}
}
