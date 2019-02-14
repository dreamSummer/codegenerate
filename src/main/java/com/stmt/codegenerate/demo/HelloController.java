package com.stmt.codegenerate.demo;

import com.stmt.codegenerate.dao.EntityDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
public class HelloController {

    @Autowired
    private EntityDao entityDao;

    @RequestMapping("/hello")
    public String hello(){
        List<Map<String, Object>> list = entityDao.getProperty("T_RPT_END_SEND_DELAY","");
        StringBuffer sb = new StringBuffer();

        for(Map<String,Object> map: list){
            sb.append(map.get("name")).append(",").append(map.get("type")).append("\r\n");
        }

        return sb.toString();
    }
}
