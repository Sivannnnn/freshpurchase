package com.sivan.entity;

import java.math.BigDecimal;
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
public class IndexTimelimit extends BaseEntity {

    private static final long serialVersionUID = 1L;

    private String title;

    private String src;

    @TableField("oldPrice")
    private BigDecimal oldprice;

    @TableField("newPrice")
    private BigDecimal newprice;


}
