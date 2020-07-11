package priv.yuan.service;

import priv.yuan.vo.SickVo;

/**
 * @author yuanyuan
 * @version 1.0
 * @date 2020/5/8 17:34
 */
public interface SickService {


    /**
     *预测疾病
     * @param sickVo 对象
     * @return 返回患病概率
     */
    public double sickEva(SickVo sickVo);
}
