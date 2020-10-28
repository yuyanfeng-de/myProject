package dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import pojo.Filedq;
@Repository
public interface FileReadAndWriteDao {
public List<Filedq> readAllFileName(HttpServletRequest request);
public List<Filedq> readFileNameByPage(HttpServletRequest request,Integer start,Integer count); 
}
