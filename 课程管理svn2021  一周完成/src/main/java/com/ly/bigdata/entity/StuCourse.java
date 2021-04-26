package com.ly.bigdata.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.extension.activerecord.Model;
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
public class StuCourse extends Model<StuCourse> {

    private static final long serialVersionUID=1L;

    private Integer stuId;

    private Integer courseId;

    private Integer teacherId;

    private String grade;

    @TableField(exist = false)
    private Course course;

    @TableField(exist = false)
    private Student stu;

    public String getName(){
        return stu.getName();
    }

    public String getCourseName(){
        return course.getCourseName();
    }

    public Float getCourseCredit(){
        return course.getCourseCredit();
    }

    public Integer getCourseTimes(){
        return course.getCourseTimes();
    }



    @Override
    protected Serializable pkVal() {
        return this.stuId;
    }


}
