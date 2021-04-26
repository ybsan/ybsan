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
public class ContractInf implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "ID", type = IdType.AUTO)
    private Integer id;

    @TableField("DEPT_ID")
    private Integer deptId;

    @TableField("JOB_ID")
    private Integer jobId;

    @TableField("STATUS_ID")
    private Integer statusId;

    @TableField("EMP_ID")
    private Integer empId;

    @TableField("TRAIN_CONTRACT")
    private Integer trainContract;

    @TableField("LABOR_CONTRACT")
    private Integer laborContract;

    @TableField("CREATE_DATE")
    private Date createDate;

    @TableField("CONFIDENTIALITY_CONTRACT")
    private Integer confidentialityContract;

    @TableField(exist = false)
    private EmployeeInf emp;
    @TableField(exist = false)
    private JobInf job;
    @TableField(exist = false)
    private DeptInf dept;
    @TableField(exist = false)
    private LaborcontractInf lab;
    @TableField(exist = false)
    private TraincontractInf tra;
    @TableField(exist = false)
    private ConfidentialitycontractInf con;



}
