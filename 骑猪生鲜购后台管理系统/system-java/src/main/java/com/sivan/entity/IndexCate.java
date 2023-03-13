package com.sivan.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author Sivan
 * @since 2022-11-21
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class IndexCate extends BaseEntity {

    private static final long serialVersionUID = 1L;

    private String title;

    private String src;

    @TableField("classifyId")
    private Integer classifyid;


}
