package cn.zxy.com.service.login;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.zxy.com.bean.Person;
import cn.zxy.com.bean.User;
import cn.zxy.com.dao.login.LoginMybatisDao;


@Service
@Transactional(rollbackFor = Exception.class)
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginMybatisDao loginDao  ;

	@Override
	public User login(User formUser) {
		return loginDao.login(formUser);
	}

	@Override
	public List<Map<String, Object>> getDataById(Long id) {
 		return loginDao.getDataById(id);
	}
 

	@Override
	public int insertPsn(Map<String, String[]> params, User user) {
		return loginDao.insertPsn(params,user);
	}

	@Override
	public Person getDateForUpdate(long psnCode) {
		return loginDao.getDateForUpdate(psnCode);
	}

	@Override
	public int deletePsn(long parseLong) {
		 
		return loginDao.deletePsn(parseLong);
	}
}
