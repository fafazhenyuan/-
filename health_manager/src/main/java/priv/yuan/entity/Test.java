package priv.yuan.entity;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.io.Serializable;

/**
 * (Test)实体类
 *
 * @author makejava
 * @since 2020-04-01 15:00:13
 */
@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Test implements Serializable {
    private static final long serialVersionUID = 183396811178021002L;
    /**
    * 体检id
    */
    private Long testId;
    /**
    * 用户id
    */
    private Long userId;
    /**
    * 体检时间
    */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date data;
    /**
    * 收缩压
    */
    private Double sbp;
    /**
    * 舒张压
    */
    private Double dpb;
    /**
    * 体重指数
    */
    private Double bmi;
    /**
    * 腰臀比
    */
    private Double whr;
    /**
    * 胆固醇
    */
    private Double bun;
    /**
    * 尿素
    */
    private Double ua;
    /**
    * 尿酸
    */
    private Double crea;
    /**
    * 肌酐
    */
    private Double tg;
    /**
    * 甘油三酯
    */
    private Double chol;
    /**
    * 葡萄糖
    */
    private Double glu;
    /**
    * 同型半胱氨酸
    */
    private Double hcy;
    /**
    * 微量白蛋白
    */
    private Double malb;
}