package priv.yuan.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import priv.yuan.service.SickService;
import priv.yuan.vo.SickVo;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.text.DecimalFormat;

/**
 * @author yuanyuan
 * @version 1.0
 * @date 2020/5/8 17:39
 */
@Service("sickService")
public class SickServiceImpl implements SickService {

    @Autowired
    private SickVo sickVo;


    /**
     * 预测疾病
     *
     * @param sickVo 对象
     * @return 返回患病概率
     */
    @Override
    public double sickEva(SickVo sickVo){
        Double sum = 0.00;
        int age = sickVo.getAgeGroup();
        int fam = sickVo.getHistoryFamilyHypertension();
        double hig = sickVo.getBpHigh();
        double bs = sickVo.getBs();
        int his = sickVo.getHistoryHypertension();
        int ex = sickVo.getExerciseGroup();
        int smo = sickVo.getHistorySmoking();
        double low= sickVo.getBpLow();
        if(age==0){
            sum+=0;
        }else if (age==1){
            sum+=0.08;
        }else if (age==2){
            sum+=0.15;
        }else if (age==3) {
            sum += 0.2;
        }

        if(fam==1){
            sum+=0.2;
        }else {
            sum+=0;
        }

        if(hig>140){
            sum+=0.15;
        }else {
            sum+=0;
        }

        if(bs>80){
            sum+=0.15;
        }else {
            sum+=0;
        }

        if(his==1){
            sum+=0.1;
        }else {
            sum+=0;
        }
        if(ex==0){
            sum+=0.1;
        }else {
            sum+=0;
        }
        if(smo==1){
            sum+=0.05;
        }else {
            sum+=0;
        }
        if(low>90){
            sum+=0.05;
        }else {
            sum+=0;
        }


        DecimalFormat df = new DecimalFormat("#.00");
        double s = Double.parseDouble(df.format(sum));

        return s;
    }
}
