package service;

import java.io.File;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.FileReadAndWriteDao;
import pojo.Filedq;
import pojo.GridData;
@Service
public class FileReadAndWriteService implements FileReadAndWriteDao {

	@Override
	public List<Filedq> readAllFileName(HttpServletRequest request) {
		List<File> tempLists = getFileSort( request);
		GridData<Filedq> gd;
		Filedq filedq;
		List<Filedq> filedqs = new ArrayList<Filedq>();
		if (tempLists == null) {
			filedq  = new Filedq();
			gd = new GridData<>("0", "", 1);
			filedq.setFiletime("null");
			filedq.setFilename("null");
			filedqs.add(0, filedq);
			gd.setData(filedqs);
			return gd.getData();
		} else {
			gd = new GridData<>("0", "", tempLists.size());
			for (int i = 0; i < tempLists.size(); i++) {
				if (tempLists.get(i).isFile()) {
					filedq  = new Filedq();
					String[] filea = tempLists.get(i).toString().split("_");
					filedq.setFilename("<a onclick='aClick(this)' name='"+tempLists.get(i).toString()+"' href='#' id='chakangerenfenxiangjs' data-toggle='modal' data-target='#chakangerenfenxiang'>"+filea[0].substring(filea[0].lastIndexOf("\\") + 1, filea[0].length())+"</a>");
					String[] t = filea[1].substring(0, filea[1].indexOf(".")).split(",");
					filedq.setFiletime(t[0] + "Äê" + t[1] + "ÔÂ" + t[2] + "ÈÕ" + t[3] + ":" + t[4]);
					filedq.setRealname(tempLists.get(i).toString());
					filedqs.add(filedq);
					gd.setData(filedqs);
				}
			}
			return gd.getData();
		}
	}
	 public static List<File> getFileSort(HttpServletRequest request) {
		  
			String filepath = request.getServletContext().getRealPath("/") + "input\\";
			File file = new File(filepath);
			File[] tempLists = file.listFiles();
			List<File> list = new ArrayList<File>();
			for(int i = 0; i<tempLists.length;i++) {
				list.add(tempLists[i]);
			}
	        if (list != null && list.size() > 0) {
	 
	            Collections.sort(list, new Comparator<File>() {
	                public int compare(File file, File newFile) {
	                    if (file.lastModified() < newFile.lastModified()) {
	                        return 1;
	                    } else if (file.lastModified() == newFile.lastModified()) {
	                        return 0;
	                    } else {
	                        return -1;
	                    }
	 
	                }
	            });
	 
	        }
	 
	        return list;
	    }
	@Override
	public List<Filedq> readFileNameByPage(HttpServletRequest request,Integer start,Integer count) {
		List<Filedq> list = readAllFileName(request);
		return list.subList(start, count);
	}
}
