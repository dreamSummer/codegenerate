package cn.com.yto56.coresystem.module.logic.statement.dao;

import java.util.Map;
import com.ibm.gbs.ai.portal.framework.server.metadata.IPage;
import com.ibm.gbs.ai.portal.framework.server.metadata.QueryPage;

public interface I${entity.className}Dao {

        IPage<?> querySum(QueryPage queryPage, Map<String, String> searchFields);

        IPage<?> queryDatail(QueryPage queryPage, Map<String, String> searchFields);

}