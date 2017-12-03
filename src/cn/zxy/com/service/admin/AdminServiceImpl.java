package cn.zxy.com.service.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.zxy.com.bean.User;
import cn.zxy.com.dao.admin.AdminMybatisDao;

@Service
public class AdminServiceImpl implements AdminService {
   
	@Autowired
	private AdminMybatisDao adminDao  ;

	@Override
	public List<Object> getAdminManage() {
		return adminDao.getAdminManage();
 	}

	@Override
	public int addAdmin(Map<String, String[]> params) {
		return adminDao.addAdmin(params);
	}

	@Override
	public int updateAdminData(String userId, String status) {
		return adminDao.updateAdminData(userId,status);
	}
}
