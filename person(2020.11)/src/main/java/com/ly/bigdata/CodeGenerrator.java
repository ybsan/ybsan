package com.ly.bigdata;
import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.GlobalConfig;
import com.baomidou.mybatisplus.generator.config.PackageConfig;
import com.baomidou.mybatisplus.generator.config.StrategyConfig;
import com.baomidou.mybatisplus.generator.config.rules.DateType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;

public class CodeGenerrator {



    public static void main(String args[]) {
        // 代码生成器
        AutoGenerator mpg = new AutoGenerator();

        // 全局配置
        GlobalConfig gc=new GlobalConfig();
        // E:\IdeaWorkSpace\jeecg-boot\mybatis-plus-gen-demo
        String projectPath = System.getProperty("user.dir");
        System.out.println(projectPath);
        gc.setOutputDir(projectPath + "/src/main/java");
        gc.setServiceName("%sService");
        gc.setAuthor("ybsan");
        gc.setOpen(false);
        gc.setIdType(IdType.AUTO);
        gc.setDateType(DateType.ONLY_DATE);
        mpg.setGlobalConfig(gc);

        // 数据源配置
        DataSourceConfig dc=new DataSourceConfig();
        dc.setDriverName("com.mysql.cj.jdbc.Driver");
        dc.setUrl("jdbc:mysql://127.0.0.1:3306/personal");
        dc.setUsername("root");
        dc.setPassword("123456");
        dc.setDbType(DbType.MYSQL);
        mpg.setDataSource(dc);


        // 包配置
        PackageConfig pc = new PackageConfig();
        pc.setModuleName("bigdata");
        pc.setParent("com.ly");
        pc.setController("controller");
        pc.setService("service");
        pc.setMapper("mapper");
        pc.setEntity("po");
        mpg.setPackageInfo(pc);

        //策略配置
        StrategyConfig strategy = new StrategyConfig();
        //表名称支持驼峰
        strategy.setNaming(NamingStrategy.underline_to_camel);
        //表里的字段支持驼峰
        strategy.setColumnNaming(NamingStrategy.underline_to_camel);
        strategy.setEntityLombokModel(true);

        // 设置生成的表
        //strategy.setInclude("rj_admin");
        strategy.setInclude("traindata_inf");
        mpg.setStrategy(strategy);

        // 执行，生成代码
        mpg.execute();
    }
}
