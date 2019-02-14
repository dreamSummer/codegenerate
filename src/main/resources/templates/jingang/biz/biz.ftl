package cn.com.yto56.coresystem.module.business.statement.biz;

import java.util.Map;

import com.ibm.gbs.ai.portal.framework.server.metadata.ExportSetting;
import com.ibm.gbs.ai.portal.framework.server.metadata.IPage;
import com.ibm.gbs.ai.portal.framework.server.metadata.QueryPage;

public interface ${entity.className} {

        /**
        * 汇总查询
        * @param queryPage
        * @param searchFields
        * @return
        */
        IPage<?> querySum(QueryPage queryPage, Map<String, String> searchFields);

        /**
        * 明细查询
        * @param queryPage
        * @param searchFields
        * @return
        */
        IPage<?> queryDatail(QueryPage queryPage, Map<String, String> searchFields);

}