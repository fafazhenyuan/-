package priv.yuan.vo;

import lombok.*;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

/**
 * @author yuanyuan
 * @version 1.0
 * @date 2020/5/8 15:16
 */
@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Component
public class SickVo {
    private double bpHigh;
    private double bpLow;
    private double bs;
    private int historyHypertension;
    private int historyFamilyHypertension;
    private int historySmoking;
    private int exerciseGroup;
    private int ageGroup;
}
