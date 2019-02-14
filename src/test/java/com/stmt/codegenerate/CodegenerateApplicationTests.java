package com.stmt.codegenerate;

import com.stmt.codegenerate.common.utils.*;
import com.stmt.codegenerate.dao.EntityDao;
import com.stmt.codegenerate.domain.bean.Entity;
import com.stmt.codegenerate.domain.bean.Property;
import com.stmt.codegenerate.domain.jsc.JscEntity;
import com.stmt.codegenerate.engine.prepare.beanData.BeanData;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CodegenerateApplicationTests {

    @Autowired
    private BeanData beanData;

    @Test
    public void test() throws FileNotFoundException {
        Map<String, Object> root = new HashMap<String, Object>();
        String path = "D:";
        String tableName = "T_RPT_ILLEGAL_NORMAL_WAYBILL"; //表名
        String className = "IllegalWaybill"; //代码模型命名
        String dateField = "createTime"; //查询时间字段
        String orgCodeField = "buyCode"; // 关联机构字段
        String source = "jingang"; //项目表示（jingang，jsc）
        List<File> fileList = new ArrayList<>();
        Entity entity = new Entity();
        beanData.setProperty(entity, tableName, className, dateField, orgCodeField, false, source);
        beanData.setProperty(entity, tableName, className, dateField, orgCodeField, true, source);
        root.put("entity", entity);
        String rootPath = this.getClass().getResource("/").getFile().toString();
        rootPath = rootPath.substring(1,rootPath.indexOf("target"));
        String templatePath = rootPath+"src/main/resources/templates/jingang";
        File file1 = new File(path);
        file1 = CodeUtils.toJavaFilename(file1, className + "Action");
        CodeUtils.generate(root, file1, templatePath + "/action", "action.ftl");
        fileList.add(file1);
        File file2 = new File(path);
        file2 = CodeUtils.toJavaFilename(file2, className + "Dao");
        CodeUtils.generate(root, file2, templatePath + "/dao", "dao.ftl");
        fileList.add(file2);
        File file3 = new File(path);
        file3 = CodeUtils.toJavaFilename(file3, className + "DaoImpl");
        CodeUtils.generate(root, file3, templatePath + "/dao/impl", "daoImpl.ftl");
        fileList.add(file3);
        File file4 = new File(path);
        file4 = CodeUtils.toJavaFilename(file4, className + "Biz");
        CodeUtils.generate(root, file4, templatePath + "/biz", "biz.ftl");
        fileList.add(file4);
        File file5 = new File(path);
        file5 = CodeUtils.toJavaFilename(file5, className + "BizImpl");
        CodeUtils.generate(root, file5, templatePath + "/biz/impl", "bizImpl.ftl");
        fileList.add(file5);
        File file6 = new File(path);
        file6 = CodeUtils.toFilename(file6, StringUtils.captureName(className), "jsp");
        fileList.add(file6);
        CodeUtils.generate(root, file6, templatePath + "/jsp", "jsp.ftl");
        File file7 = new File(path);
        file7 = CodeUtils.toFilename(file7, StringUtils.captureName(className), "js");
        CodeUtils.generate(root, file7, templatePath + "/js", "js.ftl");
        fileList.add(file7);
        File file8 = new File(path);
        file8 = CodeUtils.toJavaFilename(file8, className);
        CodeUtils.generate(root, file8, templatePath + "/bean", "entity.ftl");
        fileList.add(file8);
        File file9 = new File(path);
        file9 = CodeUtils.toJavaFilename(file9, className + "Sum");
        CodeUtils.generate(root, file9, templatePath + "/bean", "entitySum.ftl");
        fileList.add(file9);
        FileOutputStream fos = new FileOutputStream(new File(path + "/jingang.zip"));
        ZipUtils.toZip(fileList, fos);
        fileList.stream().forEach(f -> f.delete());
    }

    @Test
    public void jscTest() throws FileNotFoundException {
        Map<String, Object> root = new HashMap<String, Object>();
        String path = "D:";
        String model = "CenterIntoAmount";
        String tableName = "center_into_amount";
        String dateField = "rptDate";
        String orgCodeField = "orgCode";
        String source = "jsc";
        List<File> fileList = new ArrayList<>();
        JscEntity entity = new JscEntity();
        beanData.setProperty(entity, tableName.toUpperCase(), model, dateField, orgCodeField, false, source);
        beanData.setProperty(entity, tableName.toUpperCase(), model, dateField, orgCodeField, true, source);
        entity.setNow(DateUtils.getCurrentDate(0, "yyyy-MM-dd HH:mm:ss"));
        root.put("entity", entity);
        String rootPath = this.getClass().getResource("/").getFile().toString();
        rootPath = rootPath.substring(1,rootPath.indexOf("target"));
        String templatePath = rootPath+"src/main/resources/templates/jsc";
        File file1 = new File(path);
        file1 = CodeUtils.toJavaFilename(file1, model + "Detail");
        CodeUtils.generate(root, file1, templatePath + "/model/entity", "detBean.ftl");
        fileList.add(file1);
        File file2 = new File(path);
        file2 = CodeUtils.toJavaFilename(file2, model + "Request");
        CodeUtils.generate(root, file2, templatePath + "/model/entity", "request.ftl");
        fileList.add(file2);
        File file3 = new File(path);
        file3 = CodeUtils.toJavaFilename(file3, model + "Total");
        CodeUtils.generate(root, file3, templatePath + "/model/entity", "sumBean.ftl");
        fileList.add(file3);
        File file4 = new File(path);
        file4 = CodeUtils.toJavaFilename(file4, model + "Dao");
        CodeUtils.generate(root, file4, templatePath + "/model/dao", "dao.ftl");
        fileList.add(file4);
        File file5 = new File(path);
        file5 = CodeUtils.toJavaFilename(file5, model + "Provider");
        CodeUtils.generate(root, file5, templatePath + "/model/dao", "provider.ftl");
        fileList.add(file5);
        File file6 = new File(path);
        file6 = CodeUtils.toJavaFilename(file6, "I"+ model + "Service");
        CodeUtils.generate(root, file6, templatePath + "/model/service", "service.ftl");
        fileList.add(file6);
        File file7 = new File(path);
        file7 = CodeUtils.toJavaFilename(file7, model + "ServiceImpl");
        CodeUtils.generate(root, file7, templatePath + "/model/service", "serviceImpl.ftl");
        fileList.add(file7);
        File file8 = new File(path);
        file8 = CodeUtils.toJavaFilename(file8, model + "Controller");
        CodeUtils.generate(root, file8, templatePath + "/model/controller", "controller.ftl");
        fileList.add(file8);
        File file9 = new File(path);
        file9 = CodeUtils.toFilename(file9, StringUtils.captureName(model), "vue");
        CodeUtils.generate(root, file9, templatePath + "/vue", "vue.ftl");
        fileList.add(file9);
        FileOutputStream fos = new FileOutputStream(new File(path + "/jsc.zip"));
        ZipUtils.toZip(fileList, fos);
        fileList.stream().forEach(f -> f.delete());
    }

}
