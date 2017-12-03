package cn.zxy.com.action.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.zxy.com.service.admin.AdminService;

@Controller
public class AdminAction {
 
 @Autowired
  private AdminService adminService ; 
	
	// 得到所有的管理员账号
	@RequestMapping(value="/getAdminManage")
	public String getAdminManage(HttpServletRequest req){
		List<Object> res  = adminService.getAdminManage();
		req.setAttribute("res", res);
		return "admin/adminMain" ;
	}
	
	@RequestMapping(value="/showAddMessage")
	public String showAddMessage(HttpServletRequest req){
		 return "admin/addAdmin" ;
	}
	
	@RequestMapping(value="/addAdmin")
	public void addAdmin(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		Map<String, String[]>  params = req.getParameterMap();
		int res =  adminService.addAdmin(params);
		resp.getWriter().print(res);
	}
	
	@RequestMapping(value="/updateAdminData")
	public void updateAdminData(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		String userId = req.getParameter("userId") ;// 用户id
		String status = req.getParameter("status") ;//  1 启用 0 禁用 -1 删掉
		
		int res =  adminService.updateAdminData(userId,status);
		resp.getWriter().print(res);
	}
	
	
}
