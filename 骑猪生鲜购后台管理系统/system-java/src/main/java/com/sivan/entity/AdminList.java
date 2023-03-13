package com.sivan.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

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
@ToString
public class AdminList extends BaseEntity {

    private static final long serialVersionUID = 1L;

    private String username;

    @JsonIgnore
    private String password;

    @TableField("avatarUrl")
    private String avatarurl;

    @TableField("telNumber")
    private Integer telnumber;

    @TableField("homeAddress")
    private String homeaddress;

    @TableField("contactAddress")
    private String contactaddress;


}
