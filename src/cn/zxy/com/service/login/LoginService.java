package cn.zxy.com.service.login;

import java.util.List;
import java.util.Map;

import cn.zxy.com.bean.Person;
import cn.zxy.com.bean.User;

public interface LoginService {

	User login(User formUser);

	List<Map<String, Object>> getDataById(Long id);

	int insertPsn(Map<String, String[]> params, User user);

	Person getDateForUpdate(long parseLong);

	int deletePsn(long parseLong);

 
}
