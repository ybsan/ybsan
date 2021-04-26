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
 * @since 2021-03-28
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class LeaveInf implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private Integer empId;

    private Integer deptId;

    private Integer jobId;

    private String startdata;

    private String enddata;

    private String leavedays;

    private Integer leavetype;

    private String content;

    private Integer leavestatus;

    /**
     * 创建时间
     */
    private Date leavetime;

    @TableField(exist = false)
    private EmployeeInf emp;
    @TableField(exist = false)
    private JobInf job;
    @TableField(exist = false)
    private DeptInf dept;

}
