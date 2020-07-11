package priv.yuan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import priv.yuan.service.SickService;
import priv.yuan.vo.SickVo;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * @author yuanyuan
 * @version 1.0
 * @date 2020/5/8 16:34
 */
@Controller
@RequestMapping("sick")
public class SickController {
    @Resource
    private SickService sickService;

    @RequestMapping(value = "evaluate", method = RequestMethod.POST)
    @ResponseBody
    public Map sickEva(SickVo sickVo){
        double v = sickService.sickEva(sickVo);
        Map m = new HashMap();
        m.put("v",v*100+"%");
        if(v>=0.5){
            m.put("tips",true);
        }
        return m;
    }
}
