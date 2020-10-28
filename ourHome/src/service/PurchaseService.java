package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.PurchaseDao;
import pojo.Allbuy;
import pojo.Temp3;
import pojo.Temp6;

@Service
public class PurchaseService {

	@Autowired
	private PurchaseDao purchaseDao;
	
	//获取订单详细
	public List<Temp6> select_1(){
		return purchaseDao.select_1();
	}
	//获取所有商品名
	public List<String> select_2(){
		return purchaseDao.select_2();
	}
	//获取所有空闲的志愿者
	public List<Temp3> select_3(){
		return purchaseDao.select_3();
	}
	public List<Allbuy>selectAllbuy(){
		return purchaseDao.selectAllbuy();
	}
	public int insertDescribe(String describe) {
		return purchaseDao.insertDescribe(describe);
	}
	public int updateAllbuyById(Allbuy allbuy) {
		return purchaseDao.updateAllbuyById(allbuy);
	}
	public int updateAllbuy_c(Allbuy allbuy) {
		return purchaseDao.updateAllbuy_c(allbuy);
	}
	public List<Allbuy> selectAllbuyById(int vtid){
		return purchaseDao.selectAllbuyById(vtid);
	}
	public List<Allbuy> selectComplete_0(){
		return purchaseDao.selectComplete_0();
	}
	public int selectComplete_3() {
		return purchaseDao.selectComplete_3();
	}
}
