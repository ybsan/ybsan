package com.ly.bigdata.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.time.LocalDate;
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
@TableName("tb_teacher")
public class Teacher extends Model<Teacher> {

    private static final long serialVersionUID=1L;

    @TableId("TeacherNum")
    private Integer teacherNum;

    @TableField("DeptNum")
    private Integer deptNum;

    @TableField("TeacherName")
    private String teacherName;

    @TableField("TeacherSex")
    private String teacherSex;

    @TableField("TeacherBirthday")
    private LocalDate teacherBirthday;

    @TableField("TeacherPassword")
    private String teacherPassword;

    @TableField("TeacherTitle")
    private String teacherTitle;

    @TableField(exist = false)
    private Department dept;

    @Override
    protected Serializable pkVal() {
        return this.teacherNum;
    }

}
