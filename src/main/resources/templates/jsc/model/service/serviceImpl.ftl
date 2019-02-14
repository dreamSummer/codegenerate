package cn.com.yto56.cockpit.service.impl.${entity.model};

import cn.com.yto56.cockpit.dao.${entity.model}.${entity.model}Dao;
import cn.com.yto56.cockpit.entity.dto.${entity.model}.${entity.detBeanName};
import cn.com.yto56.cockpit.entity.dto.${entity.model}.${entity.model}Request;
import cn.com.yto56.cockpit.entity.dto.${entity.model}.${entity.sumBeanName};
import cn.com.yto56.cockpit.service.iservice.${entity.model}.I${entity.model}Service;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

@Service("${entity.model?uncap_first}Service")
public class ${entity.model}ServiceImpl implements I${entity.model}Service {

    @Autowired
    private ${entity.model}Dao ${entity.model?uncap_first}Dao;

    @Override
    public List<${entity.sumBeanName}> queryTotalPage(${entity.model}Request request){
        return  ${entity.model?uncap_first}Dao.queryTotalPage(request);
    }

    @Override
    public List<${entity.detBeanName}> queryDetailPage(${entity.model}Request request){
        return  ${entity.model?uncap_first}Dao.queryDetailPage(request);
    }

}