package com.stmt.codegenerate.common.utils;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.stmt.codegenerate.common.utils.PropertyUtils;
import com.stmt.codegenerate.dao.EntityDao;
import com.stmt.codegenerate.domain.bean.Entity;
import com.stmt.codegenerate.domain.bean.Property;
import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;

public class CodeUtils {

	public static File generate(Map<String, Object> root, File codeFile, String templatePath, String templateName) {
		Configuration cfg = new Configuration();
		Writer javaWriter = null;
		try {
			cfg.setDirectoryForTemplateLoading(new File(
					templatePath));
			cfg.setObjectWrapper(new DefaultObjectWrapper());
			cfg.setDefaultEncoding("UTF-8");
			Template template = cfg.getTemplate(templateName);

			if (codeFile != null) {
				javaWriter = new FileWriter(codeFile);
				template.process(root, javaWriter);
				javaWriter.flush();
				javaWriter.close();
			}
			return codeFile;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(null!=javaWriter){
				try {
					javaWriter.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return  null;
	}

    public static File toJavaFilename(File outDirFile, String javaClassName) {

        File file = new File(outDirFile, javaClassName + ".java");
        return file;
    }

	public static File toFilename(File outDirFile, String javaClassName, String type) {

		File file = null;
		if("java".equals(type)){
			file = new File(outDirFile, javaClassName + ".java");
		}else if("jsp".equals(type)){
			file = new File(outDirFile, javaClassName + ".jsp");
		}else if("js".equals(type)){
			file = new File(outDirFile, javaClassName + ".js");
		}else if("vue".equals(type)){
			file = new File(outDirFile, javaClassName + ".vue");
		}
		return file;
	}

}
