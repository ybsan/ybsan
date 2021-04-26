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
public class SalaryInf implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "ID", type = IdType.AUTO)
    private Integer id;

    @TableField("DEPT_ID")
    private Integer deptId;

    @TableField("JOB_ID")
    private Integer jobId;

    @TableField("EMP_ID")
    private Integer empId;

    @TableField("SALARY_STATION")
    private Integer salaryStation;

    @TableField("SALARY_LEVEL")
    private Integer salaryLevel;

    @TableField("SENIORITY_PAY")
    private Integer seniorityPay;

    @TableField("PERFORMANCE")
    private Integer performance;

    @TableField("INDIVIDUAL_INCOME")
    private Float individualIncome;

    @TableField("CREATE_DATE")
    private Date createDate;

    @TableField(exist = false)
    private EmployeeInf emp;
    @TableField(exist = false)
    private JobInf job;
    @TableField(exist = false)
    private DeptInf dept;
}
