package com.ly.bigdata.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
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
public class Major extends Model<Major> {

    private static final long serialVersionUID=1L;

      @TableId(value = "major_id", type = IdType.AUTO)
    private Integer majorId;

    private Integer departId;

    private String majorName;

    /**
     * 辅导员
     */
    private String majorDuidance;

    private String email;

    private String majorIntroduce;

    @TableField(exist = false)
    private Department depart;


    @Override
    protected Serializable pkVal() {
        return this.majorId;
    }

}
