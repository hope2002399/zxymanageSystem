package cn.zxy.com.service.admin;

import java.util.List;
import java.util.Map;

import cn.zxy.com.bean.User;

public interface AdminService {

	List<Object> getAdminManage();

	int addAdmin(Map<String, String[]> params);

	int updateAdminData(String userId, String status);

}
