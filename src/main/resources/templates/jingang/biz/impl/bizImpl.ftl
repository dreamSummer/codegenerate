package cn.com.yto56.coresystem.module.business.statement.biz.impl;

import java.util.Map;

import cn.com.yto56.coresystem.module.business.statement.biz.I${entity.className}Biz;
import cn.com.yto56.coresystem.module.logic.statement.dao.I${entity.className}Dao;

import com.ibm.gbs.ai.portal.framework.server.metadata.ExportSetting;
import com.ibm.gbs.ai.portal.framework.server.metadata.IPage;
import com.ibm.gbs.ai.portal.framework.server.metadata.QueryPage;

public class ${entity.className}BizImpl implements I${entity.className}Biz {

        private I${entity.className}Dao ${entity.className?uncap_first}Dao;

        @Override
        public IPage<?> querySum(QueryPage queryPage, Map<String, String> searchFields){

            return ${entity.className?uncap_first}Dao.querySum(queryPage, searchFields);
        }

        @Override
        public IPage<?> queryDatail(QueryPage queryPage, Map<String, String> searchFields){

            return ${entity.className?uncap_first}Dao.querySum(queryPage, searchFields);
        }

        public I${entity.className}Dao get${entity.className}Dao(){ return ${entity.className?uncap_first}Dao; }

        public void set${entity.className}Dao(I${entity.className}Dao ${entity.className?uncap_first}Dao){
            this.${entity.className?uncap_first}Dao = ${entity.className?uncap_first}Dao;
        }

}
