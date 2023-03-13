package com.sivan.entity;

import java.time.LocalDateTime;
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
public class OrderList extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @TableField("orderNumber")
    private String ordernumber;

    private String name;

    @TableField("telNumber")
    private Integer telnumber;

    private String address;

    @TableField("createTime")
    private LocalDateTime createtime;


}
