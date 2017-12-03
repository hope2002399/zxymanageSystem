package cn.zxy.com.dao.login;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.zxy.com.bean.Person;
import cn.zxy.com.bean.User;
import cn.zxy.com.dao.demo.base.BaseMybatisDao;

@Repository
public class LoginMybatisDao  extends BaseMybatisDao<Object>{

	public User login(User formUser) {
		String sql = "user.getUser" ;
		Map<String,Object> params = new HashMap<>();
		params.put("username", formUser.getLoginname());
		params.put("pwd", formUser.getLoginpass());
		Object obj =  this.getOneInfo(sql, params) ;
		if(obj==null){
			return null; 
		}
		return (User) obj ;
 	}

	public List<Map<String, Object>> getDataById(Long userId) {
		String queryStr = "user.getDataById" ; 
		Map<String, Object> params = new HashMap<>() ;
		params.put("userId", userId) ;
		return  this.getSearchList(queryStr, params, false);
 	}

	public int insertPsn(Map<String, String[]> params, User user) {
		String insertStr = "user.insertPsn" ;
		String updateStr = "user.updatePsn" ;
		
		Map<String, Object>  map = new HashMap<>()  ;		
		map.put("zhName", params.get("zhName")[0]==""?" ":params.get("zhName")[0]) ;
		map.put("birthday", params.get("birthday")[0]==""?" ":params.get("birthday")[0]) ;
		map.put("tel", params.get("tel")[0]==""?" ":params.get("tel")[0]) ;
		map.put("phone", params.get("phone")[0]==""?" ":params.get("phone")[0]) ; 
		map.put("position", params.get("position")[0]==""?" ":params.get("position")[0]) ; 
		map.put("parent_id", user.getId()) ; 
		// 从这开始区分是插入 还是更新
		if("100".equals(params.get("flag")[0])){ // 更新数据 
			map.put("psnCode", params.get("psnCode")[0]==""?" ":params.get("psnCode")[0]) ;
			return super.update(updateStr, map); 
		}else{
			return super.insert(insertStr, map); 
 		}
	}

	public Person getDateForUpdate(long psnCode) {
		String selectStr = "user.getDateForUpdate";
		Map<String, Object>  params = new HashMap<>()  ;
		params.put("psnCode", psnCode) ;
		return (Person) this.getOneInfo(selectStr, params);
	}

	public int deletePsn(long parseLong) {
		 String deleteStr = "user.deletePsn";
		 Map<String, Object>  params = new HashMap<>()  ;
		 params.put("psnCode", parseLong) ;
		return  super.delete(deleteStr, params);
	}

}
