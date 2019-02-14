package cn.com.yto56.cockpit.service.iservice.${entity.model};

import cn.com.yto56.cockpit.entity.dto.${entity.model}.${entity.detBeanName};
import cn.com.yto56.cockpit.entity.dto.${entity.model}.${entity.model}Request;
import cn.com.yto56.cockpit.entity.dto.${entity.model}.${entity.sumBeanName};
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public interface I${entity.model}Service {

    List<${entity.sumBeanName}> queryTotalPage(${entity.model}Request request);

    List<${entity.detBeanName}> queryDetailPage(${entity.model}Request request);

}