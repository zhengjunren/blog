package xyz.zzz989.my.blog.domain.generator;

import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.converts.MySqlTypeConvert;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.DbColumnType;
import com.baomidou.mybatisplus.generator.config.rules.DbType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class generator {
    public static void main(String[] args) {
        AutoGenerator mpg = new AutoGenerator();
        GlobalConfig gc = new GlobalConfig();
        gc.setOutputDir("G://代码//blog//my-blog-domain//src//main//java");

        gc.setFileOverride(true);
        gc.setActiveRecord(true);
        gc.setEnableCache(false);
        gc.setBaseResultMap(true);
        gc.setBaseColumnList(true);
        gc.setAuthor("zjr");
        gc.setServiceName("%sService");
        gc.setServiceImplName("%sServiceImpl");
//        gc.setControllerName("%sController");
        mpg.setGlobalConfig(gc);

        DataSourceConfig dsc = new DataSourceConfig();
        dsc.setDbType(DbType.MYSQL);
        dsc.setTypeConvert(new MySqlTypeConvert(){
            // 自定义数据库表字段类型转换【可选】
            @Override
            public DbColumnType processTypeConvert(String fieldType) {
                System.out.println("转换类型：" + fieldType);
                // 注意！！processTypeConvert 存在默认类型转换，如果不是你要的效果请自定义返回、非如下直接返回。
                return super.processTypeConvert(fieldType);
            }
        });
        dsc.setDriverName("com.mysql.jdbc.Driver");
        dsc.setUsername("root");
        dsc.setPassword("root");
        dsc.setUrl("jdbc:mysql://localhost:3306/blog?&useSSL=false&characterEncoding=utf8");
        mpg.setDataSource(dsc);


        StrategyConfig strategy = new StrategyConfig();
        strategy.setNaming(NamingStrategy.underline_to_camel);
        strategy.setInclude(new String[] { "blogger" });
        strategy.setEntityLombokModel(true);
        strategy.setSuperEntityClass("xyz.zzz989.my.blog.domain.entity.BaseEntity");
        strategy.setSuperEntityColumns("id","created","updated");
        mpg.setStrategy(strategy);


        PackageConfig pc = new PackageConfig();
        pc.setParent("xyz.zzz989.my.blog");
        mpg.setPackageInfo(pc);

        InjectionConfig cfg = new InjectionConfig() {
            @Override
            public void initMap() {
                Map<String, Object> map = new HashMap<String, Object>();
                map.put("abc", this.getConfig().getGlobalConfig().getAuthor() + "-mp");
                this.setMap(map);
            }
        };
        List<FileOutConfig> focList = new ArrayList<FileOutConfig>();
        focList.add(new FileOutConfig("/templates/mapper.xml.vm") {
            @Override
            public String outputFile(TableInfo tableInfo) {
                return "G:\\ideaworkplace\\test\\hello-generator\\src\\main\\resources\\mapper" + tableInfo.getEntityName() + ".xml";
            }
        });
        mpg.setCfg(cfg);


        TemplateConfig tc = new TemplateConfig();
        tc.setXml(null);
        tc.setController(null);
        tc.setService(null);
        tc.setServiceImpl(null);
        tc.setMapper(null);
        mpg.setTemplate(tc);
        mpg.execute();
    }

}
