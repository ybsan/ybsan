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
public class Admin extends Model<Admin> {

    private static final long serialVersionUID=1L;

      @TableId(value = "admin_no", type = IdType.AUTO)
    private Integer adminNo;

    private String adminName;

    private String adminSex;

    private String adminBirth;

    private String adminPwd;

//x
    @Override
    protected Serializable pkVal() {
        return this.adminNo;
    }

}
