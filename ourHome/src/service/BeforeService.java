package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BeforeDao;
import pojo.User2;

@Service
public class BeforeService {

	@Autowired
	private BeforeDao beforeDao;
	public User2 selectUser(String uname,String upassword) {
		return beforeDao.selectUser(uname,upassword);
	}
	
	public int updatePassword(String upassword,int uid) {
		return beforeDao.updatePassword(upassword, uid);
	}
}
