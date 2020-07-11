package priv.yuan.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import priv.yuan.service.HeatService;
import priv.yuan.vo.HeatVo;

import java.text.DecimalFormat;

/**
 * @author yuanyuan
 * @version 1.0
 * @date 2020/5/13 0:33
 */
@Service("heatService")
public class HeatServiceImpl implements HeatService {

    @Autowired
    private HeatVo heatVo;

    @Override
    public Double cal(HeatVo heatVo) {
        Double h;
        if(heatVo.getSex() == 0){
            if(heatVo.getAge() == 0){
                if(heatVo.getEx()==0){
                    h =(15.2*heatVo.getWeight()+680)*1.2;
                }else if(heatVo.getEx()==1){
                    h =(15.2*heatVo.getWeight()+680)*1.3;
                }else if(heatVo.getEx()==2){
                    h =(15.2*heatVo.getWeight()+680)*1.5;
                }else {
                    h =(15.2*heatVo.getWeight()+680)*2.0;
                }
            }else if(heatVo.getAge() == 1){
                if(heatVo.getEx() == 0){
                    h =(11.5*heatVo.getWeight()+830)*1.2;
                }else if(heatVo.getEx()==1){
                    h =(11.5*heatVo.getWeight()+830)*1.3;
                }else if(heatVo.getEx()==2){
                    h =(11.5*heatVo.getWeight()+830)*1.5;
                }else {
                    h =(11.5*heatVo.getWeight()+830)*2.0;
                }
            }else{
                if(heatVo.getEx() == 0){
                    h =(13.4*heatVo.getWeight()+490)*1.2;
                }else if(heatVo.getEx()==1){
                    h =(13.4*heatVo.getWeight()+490)*1.3;
                }else if(heatVo.getEx()==2){
                    h =(13.4*heatVo.getWeight()+490)*1.5;
                }else {
                    h =(13.4*heatVo.getWeight()+490)*2.0;
                }
            }
        }else {
            if(heatVo.getAge() == 0){
                if(heatVo.getEx()==0){
                    h =(14.6*heatVo.getWeight()+450)*1.2;
                }else if(heatVo.getEx()==1){
                    h =(14.6*heatVo.getWeight()+450)*1.3;
                }else if(heatVo.getEx()==2){
                    h =(14.6*heatVo.getWeight()+450)*1.5;
                }else {
                    h =(14.6*heatVo.getWeight()+450)*2.0;
                }
            }else if(heatVo.getAge() == 1){
                if(heatVo.getEx() == 0){
                    h =(8.6*heatVo.getWeight()+830)*1.2;
                }else if(heatVo.getEx()==1){
                    h =(8.6*heatVo.getWeight()+830)*1.3;
                }else if(heatVo.getEx()==2){
                    h =(8.6*heatVo.getWeight()+830)*1.5;
                }else {
                    h =(8.6*heatVo.getWeight()+830)*2.0;
                }
            }else{
                if(heatVo.getEx() == 0){
                    h =(10.4*heatVo.getWeight()+600)*1.2;
                }else if(heatVo.getEx()==1){
                    h =(10.4*heatVo.getWeight()+600)*1.3;
                }else if(heatVo.getEx()==2){
                    h =(10.4*heatVo.getWeight()+600)*1.5;
                }else {
                    h =(10.4*heatVo.getWeight()+600)*2.0;
                }
            }
        }



        DecimalFormat df = new DecimalFormat("#.00");
        return Double.parseDouble(df.format(h));
    }
}
