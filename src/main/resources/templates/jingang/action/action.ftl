package cn.com.yto56.coresystem.module.business.statement.action;

import com.ibm.gbs.ai.portal.framework.server.action.CrudBaseAction;
import com.ibm.gbs.ai.portal.framework.server.metadata.Page;
import com.ibm.gbs.ai.portal.framework.server.metadata.QueryPage;

import cn.com.yto56.coresystem.module.logic.statement.domain.${entity.className};
import cn.com.yto56.coresystem.module.business.statement.biz.I${entity.className}Biz;
import cn.com.yto56.coresystem.module.core.frameworkimpl.service.IExcelService;

@SuppressWarnings("serial")
public class ${entity.className}Action extends CrudBaseAction {

        private I${entity.className}Biz  ${entity.className?uncap_first}Biz;

        private IExcelService excelService;

        @Override
        public String list() {
                return SUCCESS;
        }

        @Override
        @SuppressWarnings("unchecked")
        public String search() {
            searchFields.put("currentOrgCode", getCurrentUser().getCurrentOrgCode());
            String tabIndex = searchFields.get("tabIndex");
            if ("0".equals(tabIndex)) {
                result = (Page<${entity.sumClassName}>) ${entity.className?uncap_first}Biz.querySum(queryPage, searchFields);
            }else if("1".equals(tabIndex)){
                result = (Page<${entity.className}>) ${entity.className?uncap_first}Biz.queryDatail(queryPage, searchFields);
            }
            super.setResult(result);
            return AJAX_RETURN_TYPE;
        }

        @SuppressWarnings("unchecked")
        @Override
        public String export() {
            searchFields.put("currentOrgCode", getCurrentUser().getCurrentOrgCode());
            String tabIndex = searchFields.get("tabIndex");
            String records = searchFields.get("records");
            queryPage = new QueryPage(Integer.parseInt(records), getPage());
            if ("0".equals(tabIndex)) {
                exportSetting.setFileName("统计汇总.xls");
                result = (Page<${entity.sumClassName}>) ${entity.className?uncap_first}Biz.querySum(queryPage, searchFields);
                if(null != result && result.getRows().size() > 0){
                    excelService.exportToFileBySheet(result.getRows(), exportSetting);
                }
            }else if("1".equals(tabIndex)) {
                exportSetting.setFileName("统计明细.xls");
                result = (Page<${entity.className}>) ${entity.className?uncap_first}Biz.queryDatail(queryPage, searchFields);
                if(null != result && result.getRows().size() > 0){
                excelService.exportToFileBySheet(result.getRows(), exportSetting);
                }
            }
            return "export";
        }

        public I${entity.className}Biz get${entity.className}Biz(){ return ${entity.className?uncap_first}Biz; }

        public void set${entity.className}Biz(I${entity.className}Biz ${entity.className?uncap_first}Biz) {
                this.${entity.className?uncap_first}Biz = ${entity.className?uncap_first}Biz;
        }

        public IExcelService getExcelService() { return excelService; }

        public void setExcelService(IExcelService excelService) {
                this.excelService = excelService;
        }

        @Override
        public String delete() {
                return null;
        }

        @Override
        public String create() {
                return null;
        }

        @Override
        public String modify() {
                return null;
        }

        @Override
        public String saveOrUpdate() {
                return null;
        }

}
