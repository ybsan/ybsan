package com.ly.bigdata.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author ${author}
 * @since 2021-04-14
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("tb_course")
public class Course extends Model<Course> {

    private static final long serialVersionUID=1L;

      @TableId("CourseNum")
    private Integer courseNum;

    @TableField("CourseName")
    private String courseName;

    /**
     * 学分
     */
    @TableField("CourseCredit")
    private Float courseCredit;

    /**
     * 学时
     */
    @TableField("CourseTimes")
    private Integer courseTimes;

    /**
     * 课程介绍
     */
    @TableField("CourseDesc")
    private String courseDesc;


    @Override
    protected Serializable pkVal() {
        return this.courseNum;
    }

}
