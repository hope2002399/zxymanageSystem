package cn.zxy.com.service.demo;

import java.util.Map;

 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.zxy.com.action.demo.IndexDemoAction;
import cn.zxy.com.dao.demo.base.IndexDemoMybatisDao;
 

@Service(value="indexService")
public class IndexServiceImpl implements IndexService {
	
	@Autowired
	IndexDemoMybatisDao indexDemoMybatisDao ;
	
//	private static final Logger LOGGER = LoggerFactory.getLogger(IndexDemoAction.class);

	
	@Override
	public Map<String, Object> getData() {
		// TODO Auto-generated method stub
//		LOGGER.debug("servicedebug");
//		LOGGER.info("servicedebuginfo");
//		LOGGER.warn("servicedebugwarn");
//		LOGGER.error("servicedebuginfo");
		return  indexDemoMybatisDao.getData();
 	}

	
}
