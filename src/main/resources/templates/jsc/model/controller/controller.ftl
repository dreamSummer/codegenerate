package cn.com.yto56.cockpit.controller.controller.${entity.model};

import cn.com.yto56.cockpit.controller.controller.BaseController;
import cn.com.yto56.cockpit.controller.controller.common.ConvertUtils;
import cn.com.yto56.cockpit.controller.controller.common.ExcelUtils;
import cn.com.yto56.basic.framework.rest.model.DataResult;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.com.yto56.cockpit.entity.dto.system.ChatToken;
import cn.com.yto56.cockpit.entity.dto.system.Object2json;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import cn.com.yto56.cockpit.service.iservice.${entity.model}.I${entity.model}Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import cn.com.yto56.cockpit.entity.dto.YtoVueTable;
import lombok.extern.slf4j.Slf4j;


/**
* @author  Mr.
* @create  ${entity.now}
* @desc
**/

@RestController
@Slf4j
@RequestMapping("/api/${entity.model?uncap_first}Controller")
public class ${entity.model}Controller extends BaseController {

    @Autowired
    private I${entity.model}Service ${entity.model?uncap_first}Service;

    /**
    * 查询汇总数据
    *
    * @param
    * @return
    */
    @RequestMapping(value = "/query${entity.sumBeanName}", method = RequestMethod.POST)
    public DataResult<${entity.jsonName}> query${entity.sumBeanName}(@RequestBody ${entity.model}Request request) {
        ChatToken chatToken = getChatToken();
        if (chatToken == null) {
            return DataResult.fail(-40100, "用户会话异常");
        }
        request.setUserOrgCode(chatToken.getUserOrgCode());
        request.setUserOrgType(chatToken.getUserOrgType());
        PageHelper.startPage(request.getPageNum(), request.getPageSize());
        List<${entity.sumBeanName}> list = ${entity.model?uncap_first}Service.queryTotalPage(request);
        PageInfo<${entity.sumBeanName}> pageInfo = new PageInfo<>(list);
        YtoVueTable ytoVueTable = ConvertUtils.convertYtoTable(pageInfo);
        ytoVueTable.initHeader(${entity.sumBeanName}.class);

        return DataResult.ok(new Object2json(ytoVueTable));
    }

    /**
    * 查询明细数据
    *
    * @param
    * @return
    */
    @RequestMapping(value = "/query${entity.detBeanName}", method = RequestMethod.POST)
    public DataResult<${entity.jsonName}> query${entity.detBeanName}(@RequestBody ${entity.model}Request request) {
        ChatToken chatToken = getChatToken();
        if (chatToken == null) {
            return DataResult.fail(-40100, "用户会话异常");
        }
        request.setUserOrgCode(chatToken.getUserOrgCode());
        request.setUserOrgType(chatToken.getUserOrgType());
        PageHelper.startPage(request.getPageNum(), request.getPageSize());
        List<${entity.detBeanName}> list = ${entity.model?uncap_first}Service.queryDetailPage(request);
        PageInfo<${entity.detBeanName}> pageInfo = new PageInfo<>(list);
        YtoVueTable ytoVueTable = ConvertUtils.convertYtoTable(pageInfo);
        ytoVueTable.initHeader(${entity.detBeanName}.class);

        return DataResult.ok(new Object2json(ytoVueTable));
    }

    /**
    * 数据导出
    *
    * @param
    * @return
    */
    @RequestMapping(value = "/export${entity.model}", method = RequestMethod.POST)
    public void export${entity.model}(@RequestBody ${entity.model}Request request) throws IOException {
        ChatToken chatToken = getChatToken();
        request.setUserOrgCode(chatToken.getUserOrgCode());
        request.setUserOrgType(chatToken.getUserOrgType());
        if("total".equals(request.getQueryType())) {
            List<${entity.sumBeanName}> res = ${entity.model?uncap_first}Service.queryTotalPage(request);
            ExcelUtils.exportExcel(res, ${entity.sumBeanName}.class, this.response, "汇总导出");
        } else if ("detail") {
            List<${entity.detBeanName}> res = ${entity.model?uncap_first}Service.queryDetailPage(request);
            ExcelUtils.exportExcel(res, ${entity.detBeanName}.class, this.response, "明细导出");
        }
    }

    /**
    * 查询echarts数据
    *
    * @param
    * @return
    */
    @RequestMapping(value = "/queryEchartDatas", method = RequestMethod.POST)
    public DataResult<${entity.jsonName}> queryEchartDatas(@RequestBody ${entity.model}Request request) {
        ChatToken chatToken = getChatToken();
        if (chatToken == null) {
            return DataResult.fail(-40100, "用户会话异常");
        }

        Map<String, Object> result = new HashMap<>();
        return  DataResult.ok(new Object2json(result));
    }

}
















































