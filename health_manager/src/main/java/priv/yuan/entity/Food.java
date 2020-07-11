package priv.yuan.entity;

import lombok.*;

import java.io.Serializable;

/**
 * (Food)实体类
 *
 * @author makejava
 * @since 2020-04-01 14:59:55
 */
@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Food implements Serializable {
    private static final long serialVersionUID = 249055138912024155L;
    /**
    * 食物id
    */
    private Long foodId;
    /**
    * 食物名称
    */
    private String foodName;
    /**
    * 热量
    */
    private Double heat;
    /**
    * 碳水化合物
    */
    private Double carbohydrate;
    /**
    * 脂肪
    */
    private Double fat;
    /**
    * 纤维素
    */
    private Double fiber;
    /**
    * 蛋白质
    */
    private Double protein;
    /**
    * 种类
    */
    private Integer type;
}