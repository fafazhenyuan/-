package priv.yuan.controller;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.context.request.WebRequest;
import priv.yuan.entity.Log;
import priv.yuan.entity.User;
import priv.yuan.service.LogService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * (Log)表控制层
 *
 * @author makejava
 * @since 2020-04-01 15:00:13
 */
@Controller
@RequestMapping("log")
public class LogController {
    /**
     * 服务对象
     */
    @Resource
    private LogService logService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public Log selectOne(Long id) {
        return this.logService.queryById(id);
    }


    @ResponseBody
    @RequestMapping(value = "addlog",method = RequestMethod.POST)
    public boolean addLog(@RequestParam String logData,
                    @RequestParam String text,
                    @RequestParam Double sleephour,
                    @RequestParam String mood,
                    @RequestParam int  cigrette,
                    @RequestParam Double weight,
                    @RequestParam String pressure,
                    @RequestParam Double bphigh,
                    @RequestParam Double bplow,
                    @RequestParam Double bs,
                    @RequestParam Long userId){
        Integer i = logService.addLog(logData,text,sleephour,mood,cigrette,weight,pressure,bphigh,bplow,bs,userId);
        if(i == 0){ return false; }else { return true; } }

    @ResponseBody
    @RequestMapping(value = "selelog")
    public Map<String,Object> seleLog(HttpSession session,@RequestParam String logData, @RequestParam Long userId) throws ParseException {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = simpleDateFormat.parse(logData);
        Log log = logService.seleLog(date,userId);

        Map<String, Object> map = new HashMap<>();
        if(log != null){
            session.setAttribute("logsession", log);
            map.put("text",log.getText());
            map.put("sleephour",log.getSleephour());
            map.put("mood",log.getMood());
            map.put("cigrette",log.getCigrette());
            map.put("weight",log.getWeight());
            map.put("pressure",log.getPressure());
            map.put("bphigh",log.getBphigh());
            map.put("bplow",log.getBplow());
            map.put("bs",log.getBs());
            return map;
        }else {
            return null;
        }
    }


}