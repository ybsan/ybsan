package com.ly.bigdata.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
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
public class Department extends Model<Department> {

    private static final long serialVersionUID=1L;

      @TableId(value = "depart_id", type = IdType.AUTO)
    private Integer departId;

    private String departName;

    private String departDirector;

    private String departEmail;

    private String departIntroduce;


    @Override
    protected Serializable pkVal() {
        return this.departId;
    }

}
