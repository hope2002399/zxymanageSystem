package cn.zxy.com.dao.demo.base;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

 
import org.springframework.stereotype.Repository;

 
@Repository(value="indexDemoMybatisDao")
public class IndexDemoMybatisDao extends BaseMybatisDao<Object> {
	
//	private static final Logger LOGGER = LoggerFactory.getLogger(IndexDemoMybatisDao.class);


	public Map<String, Object> getData() {
	// LOGGER.info("��ȥdao ��");
	Map<String, Object> res = new HashMap<String, Object>(); 
	List<Object> list=  super.getSearchList("indexDemo2.demoSele2ct", null) ;
	 res.put("res",list)  ;
	 return res ;
	}
	 
	
}
