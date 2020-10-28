package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pojo.Convenient;
import pojo.GridData;
import pojo.Notice;
import service.ConvenientService;


@Controller
@RequestMapping("/convenient")
public class ConvenientController {

	@Autowired
	private ConvenientService convenientService;
	
	
	@RequestMapping("/selectAllConvenient")
	@ResponseBody
	public GridData<Convenient> selectAllConvenient(){
				
		GridData<Convenient> gridData = new GridData<Convenient>("0", "ok", 1);
		gridData.setData(convenientService.selectAllConvenient());
				
		return gridData;
	}
	
	@RequestMapping("/insertConvenient")
	@ResponseBody
	public Convenient insertConvenient(@RequestBody Convenient convenient) {
		convenientService.insertConvenient(convenient);
		return convenient;
	}
	
	@RequestMapping("/delConvenient")
	public String delConvenient(HttpServletRequest request) {
		int id_i = Integer.parseInt(request.getParameter("id_i"));
		convenientService.delConvenient(id_i);
		return "redirect:/admin/convenient";
	}
	
	@RequestMapping("/updateConvenient")
	@ResponseBody
	public Convenient updateConvenient(@RequestBody Convenient convenient) {
		convenientService.updateConvenient(convenient);
		return convenient;
	}
}
