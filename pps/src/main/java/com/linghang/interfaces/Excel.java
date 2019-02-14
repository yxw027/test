package com.linghang.interfaces;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @author liuhao on 2017/2/28.
 */
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Excel {

    /**
     * excel中的标题
     */
    String title();

    /**
     * 是否可以为空
     */
    boolean allowNulls() default true;

    /**
     * 是否唯一
     */
    boolean isOnly() default false;

    Class enumClass() default NullPointerException.class;


}
