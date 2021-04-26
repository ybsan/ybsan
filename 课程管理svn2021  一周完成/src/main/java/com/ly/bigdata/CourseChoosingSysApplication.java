package com.ly.bigdata;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@MapperScan("com.ly.bigdata.mapper")
@SpringBootApplication
public class CourseChoosingSysApplication {

    public static void main(String[] args) {
        SpringApplication.run(CourseChoosingSysApplication.class, args);
    }

}
