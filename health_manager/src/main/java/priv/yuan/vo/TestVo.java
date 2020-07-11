package priv.yuan.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;

import java.util.Date;

/**
 * @author yuanyuan
 * @version 1.0
 * @date 2020/5/2 1:06
 */
@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class TestVo {

    /**
     * 体检时间
     */
    private String data1;

    private String date;
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
