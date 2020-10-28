package service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.NoticeDao;
import pojo.Notice;

@Service
public class NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	
	public List<Notice> selectAllNotice(){
		return noticeDao.selectAllNotice();
	}
	
	public int delNoticeById(int id_n) {
		return noticeDao.delNoticeById(id_n);
	}
	
	public int updateNoticeById(Notice notice) {
		return noticeDao.updateNoticeById(notice);
	}
	
	public List<Notice> selectNoticeByTT(String tittle,String date){
		return noticeDao.selectNoticeByTT(tittle, date);
	}
	
	public int insertNotice(Notice notice) {
		return noticeDao.insertNotice(notice);
	}
	
	public List<Notice> selectNotice_main(){
		return noticeDao.selectNotice_main();
	}
}
