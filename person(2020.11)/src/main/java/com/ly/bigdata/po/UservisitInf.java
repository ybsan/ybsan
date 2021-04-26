package com.ly.bigdata.po;

import com.baomidou.mybatisplus.annotation.IdType;
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
 * @since 2021-03-23
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class UservisitInf implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private String loginTime;

    private String exitTime;

    private String visitIp;

    private String userAddress;

    private String userFrom;

    private String browser;

    private String opsystem;

    private String version;

    private String loginname;

    private String iphone;


}
