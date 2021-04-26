package com.ly.bigdata.po;

import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
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
 * @author ybsan
 * @since 2021-03-26
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class CheckworkInf implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "ID", type = IdType.AUTO)
    private Integer id;

    @TableField("DEPT_ID")
    private Integer deptId;

    @TableField("JOB_ID")
    private Integer jobId;

    @TableField("EMP_ID")
    private Integer empId;

    @TableField("WORKINGDAYS")
    private Integer workingdays;

    @TableField("DAYSLEAVE")
    private Integer daysleave;

    @TableField("CREATEDATE")
    private Date createdate;

    @TableField("DAYSOUT")
    private Integer daysout;


    @TableField(exist = false)
    private EmployeeInf emp;
    @TableField(exist = false)
    private JobInf job;
    @TableField(exist = false)
    private DeptInf dept;
}
