package controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pojo.Activity;
import pojo.Allbuy;
import pojo.GridData;
import pojo.Service2;
import pojo.Temp3;
import pojo.Temp6;
import service.PurchaseService;
import service.ServiceService;

@Controller
@RequestMapping("/purchase")
public class PurchaseController {

	@Autowired
	private PurchaseService purchaseService;
	@Autowired
	private ServiceService serviceService;
	
	
	@RequestMapping("/selectAllbuy")
	@ResponseBody
	public GridData<Allbuy> selectAllbuy(){
				
		GridData<Allbuy> gridData = new GridData<Allbuy>("0", "ok", 1);
		List<Temp6> temp6 = purchaseService.select_1();
		//List<String> list2 = purchaseService.select_2();
		
		Map<String, Integer> map =new HashMap<String, Integer>();
		int count=0;
		String describe ="";
		for(Temp6 t6:temp6) {
			if(!map.containsKey(t6.getSname())) {
				map.put(t6.getSname(), t6.getNumber());
			}else {
				map.put(t6.getSname(),map.get(t6.getSname())+t6.getNumber());
			}
		}
		for (Entry<String, Integer> m : map.entrySet()) {
		        System.out.println("key:" + m.getKey() + " value:" + m.getValue());
		        describe+=m.getKey()+":"+m.getValue()+"斤"+"\n";
		   }
		
		List<Allbuy> list = purchaseService.selectAllbuy();
		
		
		for(Allbuy aa:list) {
			if(describe.equals(aa.getDescribe())) {
				count++;
			}
		}
		if(count==0) {
		  //插入Allbuy
		  purchaseService.insertDescribe(describe);
			
		}
		
		list = purchaseService.selectAllbuy();
		int id_v;
		List<Temp3>temps;
		List<Temp3>temp3;
		Map<Integer, String> map2 = new HashMap<Integer, String>();
		String name_v;
		
		for(Allbuy ss:list) {
			id_v = ss.getVtid();
			if((Integer)id_v != null && id_v !=0) {
				name_v = serviceService.selectVolunteerName(id_v);
				ss.setName_v(name_v);
			}else {
				temps= serviceService.selectVolunteerNames();
				//temp3= purchaseService.select_3();
				//求交集，获取空闲志愿者
				//temps.retainAll(temp3);
				if(temps != null) {
					for(Temp3 tt:temps) {
						map2.put(tt.getId_v(), tt.getUname());
					}
					ss.setName_vs(map2);
				}
			}
		}
		gridData.setData(list);
				
		return gridData;
	}
	
	
	@RequestMapping("/updateAllbuyById")
	@ResponseBody
	public Allbuy updateAllbuyById(@RequestBody Allbuy allbuy) {
		purchaseService.updateAllbuyById(allbuy);
		return allbuy;
	}
	
	@RequestMapping("/updateAllbuy_c")
	@ResponseBody
	public Allbuy updateAllbuy_c(@RequestBody Allbuy allbuy) {
		Timestamp date = new Timestamp(new Date().getTime());
		allbuy.setAbtime(date);
		purchaseService.updateAllbuy_c(allbuy);
		
		return allbuy;
	}
	
	@RequestMapping("/selectAllbuyById")
	@ResponseBody
	public GridData<Allbuy> selectAllbuyById(HttpServletRequest request){
		int uid = Integer.parseInt(request.getParameter("uid"));
		int id_v =  serviceService.selectId_vByUid(uid);
		
		GridData<Allbuy> gridData = new GridData<Allbuy>("0", "ok", 1);
		
		//安排的志愿服务
		List<Allbuy> list =purchaseService.selectAllbuyById(id_v);
		//List<Service2> list = serviceService.selectServiceById_v(id_v);
		//还未安排的志愿服务
		List<Allbuy> list2 = purchaseService.selectComplete_0();
		//List<Service2> list2 =serviceService.selectComplete_3();
		
		
		String name_v;
		for(Allbuy ss:list) {
			id_v = ss.getVtid();
			if((Integer)id_v != null && id_v !=0) {
				name_v = serviceService.selectVolunteerName(id_v);
				ss.setName_v(name_v);
			}
		}

		for(Allbuy sss:list2) {
			list.add(sss);
		}

		gridData.setData(list);
				
		return gridData;
	}
	
	@RequestMapping("/updatePurchase2")
	@ResponseBody
	public Allbuy updateServiceById2(@RequestBody Allbuy allbuy) {
		int uid = allbuy.getVtid();
		int id_v = serviceService.selectId_vByUid(uid);
		allbuy.setVtid(id_v);
		purchaseService.updateAllbuyById(allbuy);
		return allbuy;
	}
	
	@RequestMapping("/updateComplete_b")
	@ResponseBody
	public Allbuy updateComplete_b(@RequestBody Allbuy allbuy) {
		Timestamp date = new Timestamp(new Date().getTime());
		allbuy.setAbtime(date);
		purchaseService.updateAllbuy_c(allbuy);
		return allbuy;
	}
}
