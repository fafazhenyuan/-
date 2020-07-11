package priv.yuan.entity;

import lombok.*;

import java.util.Date;
import java.io.Serializable;

/**
 * (Log)实体类
 *
 * @author makejava
 * @since 2020-04-01 15:00:12
 */
@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Log implements Serializable {
    private static final long serialVersionUID = 230162991723318576L;
    /**
    * 日志id
    */
    private Long logId;
    /**
    * 用户id
    */
    private Long userId;
    /**
    * 日期
    */
    private Date logData;
    /**
    * 日志内容
    */
    private String text;
    /**
    * 睡眠时间
    */
    private Double sleephour;
    /**
    * 心情
    */
    private String mood;
    /**
    * 吸烟
    */
    private Integer cigrette;
    /**
    * 体重
    */
    private Double weight;
    /**
    * 压力
    */
    private String pressure;
    /**
    * 高压
    */
    private Double bphigh;
    /**
    * 低压
    */
    private Double bplow;
    /**
    * 心率
    */
    private Double  bs;
}