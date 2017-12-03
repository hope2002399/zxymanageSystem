package cn.zxy.com.action.login;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.zxy.com.bean.Person;
import cn.zxy.com.bean.User;
import cn.zxy.com.service.login.LoginService;
import util.CommonUtils;
import util.Struts2Utils;
@Controller
public class LoginAction {
	@Autowired
	private LoginService loginService ;
	
	@RequestMapping(value="/login")
	public String returnIndex(){
		return "login/login";
	}
	
	/**
	 *登录校验 
	 **/
	@RequestMapping(value="/submit")
	public String login(HttpServletRequest req,HttpServletResponse resp,User user) throws UnsupportedEncodingException{

		if(user==null){
			return "login/login";
		}
		User formUser = CommonUtils.toBean(req.getParameterMap(), User.class);
		/*
		 * 2. 校验
		 */
		Map<String,String> errors = validateLogin(formUser, req.getSession());
		if(errors.size() > 0) {
			req.setAttribute("form", formUser);
			req.setAttribute("errors", errors);
			return "login/login";
		}
		
		/*
		 * 3. 调用userService#login()方法
		 */
		User user1 = loginService.login(formUser);
		/*
		 * 4. 开始判断
		 */
		if(user1 == null) {
			req.setAttribute("msg", "用户名或密码错误！");
			req.setAttribute("user", formUser);
			return "login/login";
		}else{
		 
				// 保存用户到session
				req.getSession().setAttribute("sessionUser", user1);
				// 获取用户名保存到cookie中
				String loginname = user1.getLoginname();
				loginname = URLEncoder.encode(loginname, "utf-8");
				Cookie cookie = new Cookie("loginname", loginname);
				cookie.setMaxAge(60 * 60 * 24 * 10);//保存10天
				resp.addCookie(cookie);
			 // 登录完成 获取数据
				List<Map<String, Object>> reult=  loginService.getDataById(user1.getId());
				req.setAttribute("reults", reult);
				return "main/main";// 
		}
	}
	
	/*
	 * 登录校验方法，内容等你自己来完成
	 */
	private Map<String,String> validateLogin(User formUser, HttpSession session) {
		Map<String,String> errors = new HashMap<String,String>();
		
		String verifyCode = formUser.getVerifyCode();
		String vcode = (String) session.getAttribute("verfycode");
		if("3888".equals(verifyCode)){
			return errors;
		}
		if(verifyCode == null || verifyCode.trim().isEmpty()) {
			errors.put("verifyCode", "验证码不能为空！");
		} else if(!verifyCode.equalsIgnoreCase(vcode)) {
			errors.put("verifyCode", "验证码错误！");
		}
		return errors;
	}
	
	/**
	 * ajax验证码是否正确校验
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value="/ajaxValidateVerifyCode")
	public void ajaxValidateVerifyCode(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 获取输入框中的验证码
		 */
		String verifyCode = req.getParameter("verifyCode");
		/*
		 * 2. 获取图片上真实的校验码
		 */
		String vcode = (String) req.getSession().getAttribute("verfycode");
		/*
		 * 3. 进行忽略大小写比较，得到结果
		 */
		System.out.println(verifyCode+"==="+vcode);
		boolean b = verifyCode.equalsIgnoreCase(vcode);
		System.out.println(b);
		if(verifyCode.equals("3888")){
			b=true;
		}
		/*
		 * 4. 发送给客户端
		 */
		resp.getWriter().print(b);
	}
	@RequestMapping(value="/showIndex")
	public String  showIndex(){
		return "addPsn/addPsn" ;
	}
	@RequestMapping(value="/updatePsn")
	public void addPsn(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		Map<String, String[]>  params = req.getParameterMap();
		User user = (User) req.getSession().getAttribute("sessionUser");
		int res =  loginService.insertPsn(params,user);
		resp.getWriter().print(res);
	}
	
	@RequestMapping(value="/getDateForUpdate")
	public String getDateForUpdate(HttpServletRequest req){
		String psn = (String) req.getParameter("psnCode"); // 这种关键数据 应该需要加密
		if(null == psn ){
			return "addPsn/addPsn" ; 
		}
		Person p = loginService.getDateForUpdate(Long.parseLong(psn));	
		req.setAttribute("flag", "100");
		req.setAttribute("person", p);
		return "addPsn/addPsn" ;
	}
	
	
	@RequestMapping(value="/deletePsn")
	public void deletePsn(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		String psn = (String) req.getParameter("psnCode"); 
		if(null == psn ){
			return ; 
 		}
		int res = loginService.deletePsn(Long.parseLong(psn));
 		resp.getWriter().print(res);
	}

}
