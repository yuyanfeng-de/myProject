package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ConvenientDao;
import pojo.Convenient;

@Service
public class ConvenientService {

	@Autowired
	private ConvenientDao convenientDao;
	
	public List<Convenient> selectAllConvenient(){
		return convenientDao.selectAllConvenient();
	}
	public int insertConvenient(Convenient convenient) {
		return convenientDao.insertConvenient(convenient);
	}
	public int delConvenient(int id_i) {
		return convenientDao.delConvenient(id_i);
	}
	public int updateConvenient(Convenient convenient) {
		return convenientDao.updateConvenient(convenient);
	}
}
