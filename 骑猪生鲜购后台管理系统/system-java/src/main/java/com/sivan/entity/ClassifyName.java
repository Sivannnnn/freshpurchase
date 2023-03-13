package com.sivan.entity;

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
public class ClassifyName extends BaseEntity {

    private static final long serialVersionUID = 1L;

    private String title;

    private String classifyId;

    private String sales;
}
