package dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import pojo.Notice;

@Repository
@Mapper
public interface NoticeDao {

	public List<Notice> selectAllNotice();
	public int delNoticeById(@Param("id_n") int id_n);
	public int updateNoticeById(Notice notice);
	
	public List<Notice> selectNoticeByTT(@Param("tittle") String tittle,@Param("date") String date);
	public int insertNotice(Notice notice);
	
	public List<Notice> selectNotice_main();
}
