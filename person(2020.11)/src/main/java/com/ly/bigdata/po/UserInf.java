package com.ly.bigdata.po;

import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
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
 * @since 2021-03-22
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class UserInf implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private String loginname;

    private String password;

    private String email;

    /**
     * 0：未审核，1：已审核
     */
    private Integer statusId;

    /**
     * 创建时间
     */
    private Date createdate;

    private String username;

    private Integer empId;


}
