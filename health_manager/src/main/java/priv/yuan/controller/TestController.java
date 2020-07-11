package priv.yuan.controller;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.http.server.HttpServerRequest;
import cn.hutool.json.JSON;
import cn.hutool.json.JSONArray;
import com.github.pagehelper.PageInfo;
import com.mysql.cj.xdevapi.JsonArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.request.SessionScope;
import priv.yuan.entity.Manager;
import priv.yuan.entity.Test;
import priv.yuan.entity.User;
import priv.yuan.service.TestService;
import org.springframework.web.bind.annotation.*;
import priv.yuan.utils.Highcharts;
import priv.yuan.vo.TestVo;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * (Test)表控制层
 *
 * @author makejava
 * @since 2020-04-01 15:00:13
 */
@Controller
@RequestMapping("test")
public class TestController {
    /**
     * 服务对象
     */
    @Resource
    private TestService testService;


    @ResponseBody
    @RequestMapping(value = "del", method = RequestMethod.POST)
    public String del(@RequestParam String testId){
        long l = Long.parseLong(testId);
        boolean b = testService.deleteById(l);
        if(b == false){
            return "error";
        }
        return "success";
    }

    @ResponseBody
    @RequestMapping(value = "update")
    public Test update(Test test){
        Test t = testService.update(test);
        if(t != null){
            return t;
        }
        return null;
    }

    @ResponseBody
    @RequestMapping(value = "add",method = RequestMethod.POST)
    public String add(Test test){
        Test t  =testService.insert(test);
        if(t == null){
            return "fail";
        }
        return "success";
    }

    @RequestMapping(value = "teststable")
    @ResponseBody
    public Map<String,Object> queryAll(){
        List<Test> tests = testService.queryAll();
        Map<String, Object> map = new HashMap<>();
        if(tests != null && tests.size() > 0){
            map.put("code",0);
            map.put("msg","");
            map.put("count",tests.size());
            map.put("data",tests);
            return map;
        }
        return null;
    }

    @RequestMapping(value = "tests")
    @ResponseBody
    public Map<String,Object> listAll(@RequestParam(defaultValue="1")int page,
                                      @RequestParam(defaultValue="5")int limit,
                                      HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("usersession");
        Long userId = user.getUserId();
        Map map1 = testService.selectAll(userId, page, limit);
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",map1.get("total"));
        map.put("data",map1.get("tests"));
        return map;
    }

    @RequestMapping(value = "t")
    @ResponseBody
    public List<TestVo> listAll(@RequestParam("userId") long userId)
    {
        List<TestVo> t= testService.queryById(userId);
        return t;
    }


    @GetMapping(value = "show")
    @ResponseBody
    public String show(){

         return null;
    }





}