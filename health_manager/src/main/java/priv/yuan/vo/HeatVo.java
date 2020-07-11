package priv.yuan.vo;

import lombok.*;
import org.springframework.stereotype.Component;

/**
 * @author yuanyuan
 * @version 1.0
 * @date 2020/5/13 0:29
 */
@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Component
public class HeatVo {
    private Double weight;
    private int sex;
    private int age;
    private int ex;
}
