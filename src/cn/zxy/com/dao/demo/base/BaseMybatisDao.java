package cn.zxy.com.dao.demo.base;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.ObjectUtils;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

 

/**
 * mybatis公用dao类
 * 
 * @param <T>
 * 
 * 
 */
@Repository
public class BaseMybatisDao<T> extends SqlSessionDaoSupport {
	
 
	/**
	 * 查询List
	 * 
	 * @param queryStr
	 * @param params
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<T> getSearchList(String queryStr, Object params) {

		List<T> list = new ArrayList<T>();
		try {
			list = getSqlSession().selectList(queryStr, params);
		} catch (Exception e) {
			logger.error("getSearchList()异常", e);
		}
		return list;
	}
	
	
	
	/**
	 * 查询List(列 SQL 统计)
	 * 
	 * @param queryStr
	 * @param params
	 * @isSqlStat  是否有列需要单独统计
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> getSearchList(String queryStr, Object params,boolean isSqlStat) {

		if(!isSqlStat)return (List<Map<String,Object>>)getSearchList(queryStr,params);

		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		try {
			list = getSqlSession().selectList(queryStr, params);
			 
		} catch (Exception e) {
			logger.error("getSearchList() (含SQL统计)异常", e);
		}
		return list;
	}

	 

	/**
	 * 计算列表总数
	 * 
	 * @param countStr
	 * @param params
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Integer getSearchSize(String countStr, Map<String, Object> params) {
		Integer totalCount = 0;
		if (!"".equalsIgnoreCase(countStr)) {
			try {
				List<Map<String, Object>> list = getSqlSession().selectList(countStr, params);
				if (list.size() > 0) {
					totalCount = Integer.parseInt(ObjectUtils.toString(list.get(0).get("totalCount")));
				}
			} catch (Exception e) {
				logger.error("getSearchSize()异常", e);
			}
		}
		return totalCount;
	}

	 
	
 
	/**
	 * 插入SQL执行
	 * 
	 * @param updateStr
	 * @param params
	 * @return
	 */
	public int insert(String updateStr, Map<String, Object> params) {
		int result = 0;
		try {
			result = getSqlSession().insert(updateStr, params);
		} catch (Exception e) {
			logger.error("update()异常", e);
		}
		return result;
	}

	/**
	 * 更新SQL执行
	 * 
	 * @param updateStr
	 * @param params
	 * @return
	 */
	public int update(String updateStr, Map<String, Object> params) {
		int result = 0;
		try {
			result = getSqlSession().update(updateStr, params);
		} catch (Exception e) {
			logger.error("update()异常", e);
		}
		return result;
	}

	/**
	 * 删除SQL执行
	 * 
	 * @param updateStr
	 * @param params
	 * @return
	 */
	public int delete(String updateStr, Map<String, Object> params) {
		int result = 0;
		try {
			result = getSqlSession().delete(updateStr, params);
		} catch (Exception e) {
			logger.error("delete()异常", e);
		}
		return result;
	}

	/**
	 * 根据条件返回单个对象
	 * 
	 * @param selectStr
	 * @param params
	 * @return
	 */
	public Object getOneInfo(String selectStr, Map<String, Object> params) {
		Object result = null;
		try {
			result = getSqlSession().selectOne(selectStr, params);
		} catch (Exception e) {
			logger.error("select()异常", e);
		}
		return result;
	}

	// /**
	// * 根据条件返回单个对象
	// *
	// * @param selectStr
	// * @param params
	// * @return
	// */
	// public Map<String, Object> getOneInfoMap(String selectStr, Object parameter, String mapKey) {
	// Map<String, Object> result = null;
	// try {
	// result = getSqlSession().selectMap(selectStr, mapKey);
	// } catch (Exception e) {
	// logger.error("select()异常", e);
	// }
	// return result;
	// }
}
