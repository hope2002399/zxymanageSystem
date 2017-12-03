package cn.zxy.com.dao.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.print.DocFlavor.STRING;

import org.springframework.stereotype.Repository;

import cn.zxy.com.dao.demo.base.BaseMybatisDao;

@Repository
public class AdminMybatisDao  extends BaseMybatisDao<Object>{

	public List<Object> getAdminManage() {
	 String queryStr = "admin.getAdminManage"  ;
	 
	return 	super.getSearchList(queryStr, null) ;
		
		
	}

	public int addAdmin(Map<String, String[]> params) {
		Map<String, Object>  map = new HashMap<>()  ;		
		map.put("zhName", params.get("zhName")[0]==""?" ":params.get("zhName")[0]) ;
		map.put("loginName", params.get("loginName")[0]==""?" ":params.get("loginName")[0]) ;
		map.put("email", params.get("email")[0]==""?" ":params.get("email")[0]) ; 
		return super.insert("admin.addAdmin", map);
	}

	public int updateAdminData(String userId, String status) {
		String str="admin.updateAdminData" ; 
		Map<String ,Object>  param = new HashMap<>();
		param.put("userId", userId);
		param.put("status", status);
		
		if(!status.equals("-1")){
			return super.update(str, param);
		}else{
			str = "admin.deleteData" ;
			return super.delete(str, param);
		} 
	}

}
