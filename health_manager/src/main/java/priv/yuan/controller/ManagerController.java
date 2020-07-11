package priv.yuan.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import priv.yuan.entity.Manager;
import priv.yuan.entity.User;
import priv.yuan.service.ManagerService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * (Manager)表控制层
 *
 * @author makejava
 * @since 2020-04-01 15:00:13
 */
@Controller
@RequestMapping("manager")
public class ManagerController {
    /**
     * 服务对象
     */
    @Resource
    private ManagerService managerService;

    @ResponseBody
    @RequestMapping(value = "del", method = RequestMethod.POST)
    public String del(@RequestParam String managerId){
        long l = Long.parseLong(managerId);
        boolean b = managerService.deleteById(l);
        if(b == false){
            return "error";
        }
        return "success";
    }

    @ResponseBody
    @RequestMapping(value = "update")
    public boolean update(@RequestParam("managerId") Long managerId,@RequestParam("managerName") String managerName,@RequestParam("managerPasswd") String managerPasswd){
        Manager m = managerService.update(managerId,managerName,managerPasswd);
        if(m != null){
            return true;
        }
        return false;
    }

    @ResponseBody
    @RequestMapping(value = "add")
    public boolean add(Manager manager){

        int i  = managerService.add(manager);
        if(i < 0){
            return false;
        }
        return true;
    }

    @RequestMapping(value = "managers")
    @ResponseBody
    public Map<String,Object> listAll(@RequestParam(defaultValue="1")int page,
                                      @RequestParam(defaultValue="5")int limit){
        Map m = managerService.selectAll(page,limit);
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",m.get("total"));
        map.put("data",m.get("managers"));
        return map;

    }





    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public Manager selectOne(Long id) {
        return this.managerService.queryById(id);
    }






    @ResponseBody
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(@RequestParam String username, @RequestParam String password, Model model, HttpSession session) {
        Manager manager = managerService.queryByName(username);
        if (manager != null) {
            if (manager.getManagerPasswd().equals(password)) {

                session.setAttribute("managersession",manager);
                return "success";
            } else {
                model.addAttribute("message", "密码错误");
                return "error";
            }
        } else {
            model.addAttribute("message", "不存在此用户");
            return "error";
        }
    }

    @RequestMapping(value="validate",method = RequestMethod.POST)
    @ResponseBody
    public  boolean validate(@RequestParam String username) {
        Manager manager=managerService.queryByName(username);
        if(null!=manager) {
            return true;
        }
        else {
            return false;
        }
    }

}