package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pojo.GridData;
import pojo.Notice;
import service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/selectAllNotice")
	@ResponseBody
	public GridData<Notice> selectAllNotice(){
				
		GridData<Notice> gridData = new GridData<Notice>("0", "ok", 1);
		gridData.setData(noticeService.selectAllNotice());
				
		return gridData;
	}
	

	@RequestMapping("/delNoticeById")
	public String delNoticeById(HttpServletRequest request) {
		int id_n = Integer.parseInt(request.getParameter("id_n"));
		noticeService.delNoticeById(id_n);
		return "redirect:/admin/notice-list";
	}
	
	
	@RequestMapping("/updateNoticeById")
	@ResponseBody
	public Notice updateNoticeById(@RequestBody Notice notice) {
		noticeService.updateNoticeById(notice);
		return notice;
	}
	
	@RequestMapping("/selectNoticeByTT")
	@ResponseBody
	public GridData<Notice> selectMobilityByNT_r(HttpServletRequest request){
		String tittle = request.getParameter("tittle");
		String date = request.getParameter("date");
		GridData<Notice> gridData = new GridData<Notice>("0", "ok", 1);
		gridData.setData(noticeService.selectNoticeByTT(tittle, date));
		return gridData;
	}
	
	@RequestMapping("/insertNotice")
	@ResponseBody
	public Notice insertNotice(@RequestBody Notice notice) {
		noticeService.insertNotice(notice);
		return notice;
	}
	
	@RequestMapping("/selectNotice_main")
	@ResponseBody
	public GridData<Notice> selectNotice_main(){
				
		GridData<Notice> gridData = new GridData<Notice>("0", "ok", 1);
		gridData.setData(noticeService.selectNotice_main());
				
		return gridData;
	}
	
	
}
