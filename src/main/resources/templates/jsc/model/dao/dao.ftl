package cn.com.yto56.cockpit.dao.${entity.model};

import cn.com.yto56.basic.framework.dao.annotation.MyBatisRepository;
import cn.com.yto56.cockpit.entity.dto.${entity.model}.${entity.detBeanName};
import cn.com.yto56.cockpit.entity.dto.${entity.model}.${entity.model}Request;
import cn.com.yto56.cockpit.entity.dto.${entity.model}.${entity.sumBeanName};
import org.apache.ibatis.annotations.SelectProvider;

import java.util.List;
import java.util.Map;

@MyBatisRepository()
@Repository("${entity.model?uncap_first}Dao")
public interface ${entity.model}Dao {

    //汇总查询
    @SelectProvider(type = ${entity.model}SqlProvider.class, method = "listQueryTotal")
    List<${entity.sumBeanName}> queryTotalPage(${entity.model}Request request);

    //明细查询
    @SelectProvider(type = ${entity.model}SqlProvider.class, method = "listQueryDetail")
    List<${entity.detBeanName}> queryDetailPage(${entity.model}Request request);

}