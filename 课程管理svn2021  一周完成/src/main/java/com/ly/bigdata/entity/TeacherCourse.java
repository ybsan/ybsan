package com.ly.bigdata.entity;

import com.baomidou.mybatisplus.annotation.IdType;
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
 * @since 2021-04-15
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class TeacherCourse extends Model<TeacherCourse> {

    private static final long serialVersionUID=1L;

      @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @TableField("teacherName")
    private String teacherName;

    @TableField("courseName")
    private String courseName;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
