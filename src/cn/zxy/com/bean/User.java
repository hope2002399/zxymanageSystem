package cn.zxy.com.bean;

public class User {

	// 对应数据库表
	/*
	 * 所有属性，除了登录和注册时需要，在修改密码的时候也是需要表单校验
	 */
		private Long id;//主键
		private String loginname;//登录名
		private String loginpass;//登录密码
		private String email;//邮箱
  		private String verifyCode;//验证码
		private String newpass;//新密码
		private String serverHost ;// 主机名称，便于以后使用
		private String zh_name ;
		private String status;

		 

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

		public String getZh_name() {
			return zh_name;
		}

		public void setZh_name(String zh_name) {
			this.zh_name = zh_name;
		}

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}
		
		public String getServerHost() {
			return serverHost;
		}

		public void setServerHost(String serverHost) {
			this.serverHost = serverHost;
		}

		 

		public String getLoginname() {
			return loginname;
		}

		public void setLoginname(String loginname) {
			this.loginname = loginname;
		}

		public String getLoginpass() {
			return loginpass;
		}

		public void setLoginpass(String loginpass) {
			this.loginpass = loginpass;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		 
	 
  
		public String getVerifyCode() {
			return verifyCode;
		}

		public void setVerifyCode(String verifyCode) {
			this.verifyCode = verifyCode;
		}
 

		public String getNewpass() {
			return newpass;
		}

		public void setNewpass(String newpass) {
			this.newpass = newpass;
		}

}
