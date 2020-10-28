package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MobilityDao;
import pojo.Mobility_c;
import pojo.Mobility_r;
import pojo.Mobility_v;
import pojo.Temp5;

@Service
public class MobilityService {

	@Autowired
	private MobilityDao mobilityDao;
	
	public List<Mobility_r> selectMobility_r (){
		return mobilityDao.selectMobility_r();
	}
	
	public List<Mobility_r> selectMobilityByNT_r(String name_r,String date){
		return mobilityDao.selectMobilityByNT_r(name_r, date);
	}
	
	public int delMobility_rById(int id_r) {
		return mobilityDao.delMobility_rById(id_r);
	}
	
	public int updateMobility_rById(Mobility_r mobility_r) {
		return mobilityDao.updateMobility_rById(mobility_r);
	}
	
	public int insertMobility_r(Mobility_r mobility_r) {
		return mobilityDao.insertMobility_r(mobility_r);
	}
	
	public List<Mobility_v> selectMobility_v(){
		return mobilityDao.selectMobility_v();
	}
	
	public int updateMobility_vById(Mobility_v mobility_v) {
		return mobilityDao.updateMobility_vById(mobility_v);
	}
	
	public int insertMobility_v(Mobility_v mobility_v) {
		return mobilityDao.insertMobility_v(mobility_v);
	}
	
	public int delMobility_vById(int id_v) {
		return mobilityDao.delMobility_vById(id_v);
	}
	
	public List<Mobility_v> selectMobilityByNT_v(String name_v,String date){
		return mobilityDao.selectMobilityByNT_v(name_v, date);
	}
	public List<Temp5> selectCount_r(){
		return mobilityDao.selectCount_r();
	}
	public List<Temp5> selectCount_v(){
		return mobilityDao.selectCount_v();
	}
	public List<Temp5> selectCount_c(){
		return mobilityDao.selectCount_c();
	}
	public List<Mobility_c> selectAllMobility_c(){
		return mobilityDao.selectAllMobility_c();
	}
	public int insertMobility_c(Mobility_c mobility_c){
		return mobilityDao.insertMobility_c(mobility_c);
	}
	public int updateMobility_c(Mobility_c mobility_c){
		return mobilityDao.updateMobility_c(mobility_c);
	}
	public int delMobility_c(int id_c){
		return mobilityDao.delMobility_c(id_c);
	}
	public List<Mobility_c> selectMobilityByT_c(String date){
		return mobilityDao.selectMobilityByT_c(date);
	}

}
