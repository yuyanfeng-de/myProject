package controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javafx.scene.control.Alert;
import pojo.Filedq;
import pojo.GridData;
import pojo.User2;
import service.BeforeService;
import service.FileReadAndWriteService;

@Controller
@RequestMapping("/before")
public class BeforeController {

	@Autowired
	private BeforeService beforeService;
	@Autowired
	private FileReadAndWriteService frawsserivce;
	
	@RequestMapping("/")
	public String login() {
		return "before/index";
	}
	
	
	//登录
	@RequestMapping("/beforeLogin")
	public String main(String uname,String upassword,Model model,HttpSession session) {		
	if(beforeService.selectUser(uname,upassword) != null) {
		 session.setAttribute("User", beforeService.selectUser(uname,upassword));
		 return "before/index";
	}else {
		
		model.addAttribute("uname", uname);
		model.addAttribute("upassword", upassword);
		model.addAttribute("message_b","账号或密码输入错误请重新输入！");
		return "before/index";
	}
	 
   }
	
	//修改密码
	@RequestMapping("/updatePassword")
	public String updateUpassword(HttpServletRequest request,HttpSession session,Model model) {
		String password = request.getParameter("password");
		String npassword = request.getParameter("npassword");
		String rpassword = request.getParameter("rpassword");
		
		String message="";
		
		//取出登录时保存的session
		User2 user=(User2) request.getSession().getAttribute("User");
		//对比原始密码是否正确
		if(password.equals(user.getUpassword()))
		{
			//正确，对比新密码和确认新密码是否一致辞
			if(npassword.equals(rpassword)) {
				//调用修改密码方法
				int n = beforeService.updatePassword(rpassword, user.getUid());
				if(n>0) {
					message="修改成功，请重新登录";
					model.addAttribute("message_p", message);
					return "forward:/before/";
				}else {
					message="修改密码失败";
				}
			}else {
				message="两次新密码输入不一致";
			}
		}else {
			message="原始密码输入错误";
		}
		model.addAttribute("message_p", message);
		model.addAttribute("password", password);
		model.addAttribute("npassword", npassword);
		model.addAttribute("rpassword", rpassword);
		return "before/index";
	}
	
	//注销
	@RequestMapping("/userLogout")
	public String userLogout(HttpServletRequest request) {
		// 删除所有session
		Enumeration em = request.getSession().getAttributeNames();
		while (em.hasMoreElements()) {
			request.getSession().removeAttribute(em.nextElement().toString());
		}
		return "redirect:/before/";
	}
	
	@RequestMapping(value = "/input",method = RequestMethod.GET)
	 @ResponseBody
	    public void input(String tittle, String tt, HttpServletRequest request) throws IOException {
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy,MM,dd,HH,mm,ss");
	    	String time = sdf.format(new Date());
	        String path = request.getServletContext().getRealPath("/") + "input\\" + tittle +"_"+time+ ".txt";
	        System.out.println(path);
	        File file = new File(path);
	        try {
	            if (!file.exists()) {
	                file.getParentFile().mkdir();
	            }
	            file.createNewFile();
	            FileWriter fw = new FileWriter(file, true);
	            BufferedWriter bw = new BufferedWriter(fw);
	            bw.write(tt);
	            bw.flush();
	            bw.close();
	            fw.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	 @RequestMapping(value = "/getallname",method = RequestMethod.GET)
	 @ResponseBody
	    public GridData<Filedq> readAllFileName(HttpServletRequest request,int page, int limit) {
		 	GridData<Filedq> data = new GridData<>();
		 	Integer count = frawsserivce.readAllFileName(request).size();
		 	Integer end =0;
		 	if(count-(page*limit)<0) end=count;
		 	else end=page*limit;
		 	List<Filedq> file = frawsserivce.readFileNameByPage(request, ((page-1)*limit),end);
		 	data.setCode("0");
		 	data.setMsg("");
		 	data.setCount(count);
		 	data.setData(file);
//		 	System.out.println(file.get((page-1)*limit).getFilename());
	        return data;
	    }
	    @RequestMapping("/readfile")
	    @ResponseBody
		public String readFile(String filename,String realname) throws IOException {
	    	String path = realname;
			File file = new File(path);
			FileReader fr = new FileReader(file);
			BufferedReader br = new BufferedReader(fr);
			String inputFile = br.readLine();
			return inputFile;
		}
	
}
