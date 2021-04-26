package com.ly.bigdata.po;

import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author ybsan
 * @since 2021-03-29
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class TraindataInf implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private String title;

    private String filename;

    private String remark;

    /**
     * 创建时间
     */
    private Date createdate;

    private Integer userId;
    @TableField(exist = false)
    private EmployeeInf emp;
}
