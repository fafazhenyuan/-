package priv.yuan.controller;

import cn.hutool.json.JSONArray;
import lombok.val;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import priv.yuan.entity.Manager;
import priv.yuan.entity.Test;
import priv.yuan.entity.User;
import priv.yuan.service.UserService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * (User)表控制层
 *
 * @author makejava
 * @since 2020-04-01 15:00:13
 */
@Controller
@RequestMapping("user")
public class UserController {

    /**
     * 服务对象
     */
    @Resource
    private UserService userService;

    @ResponseBody
    @RequestMapping(value = "del", method = RequestMethod.POST)
    public String del(@RequestParam String userId){
        long l = Long.parseLong(userId);
        boolean b = userService.deleteById(l);
        if(b == false){
            return "error";
        }
        return "success";
    }

    @ResponseBody
    @RequestMapping(value = "update")
    public User updateAll(User user){
        User u = userService.updateAll(user);
        if(u != null){
            return u;
        }
        return null;
    }


    @RequestMapping(value = "users")
    @ResponseBody
    public Map<String,Object> listAll(){
        List<User> users = userService.selectAll();
        Map<String, Object> map = new HashMap<>();
        if(users != null && users.size() > 0){
            map.put("code",0);
            map.put("msg","");
            map.put("count",users.size());
            map.put("data",users);
            return map;
        }
        return null;
    }

    @RequestMapping(value = "add",method = RequestMethod.POST)
    @ResponseBody
    public String add(User user){
        User u = userService.insert(user);
        if(u == null){
            return "fail";
        }else {
            return "success";
        }
    }

    @ResponseBody
    @RequestMapping(value = "alt", method = RequestMethod.POST)
    public String alter(@RequestParam int age,@RequestParam String phone,@RequestParam String adress,@RequestParam String email,@RequestParam Long userId){
        Integer i = userService.altInf(userId,age,adress,email,phone);
        if(i<0){
            return "fail";
        }else {
            return "success";
        }
    }

    @ResponseBody
    @RequestMapping(value = "altPwd", method = RequestMethod.POST)
    public String alterPwd(@RequestParam String userPasswd,@RequestParam Long userId){
        Integer i = userService.altPwd(userId,userPasswd);
        if(i<0){
            return "fail";
        }else {
            return "success";
        }
    }

    @ResponseBody
    @RequestMapping(value = "clear", method = RequestMethod.POST)
    public String removeSessionAttributr(HttpServletRequest request){
        Enumeration em = request.getSession().getAttributeNames();
        while (em.hasMoreElements()) {
          request.getSession().removeAttribute(em.nextElement().toString());
        }
        return null;
    }


    @ResponseBody
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(@RequestParam String username, @RequestParam String password, HttpSession session) {
        ModelAndView model = new ModelAndView();
        User user = userService.queryByName(username);
        if (user != null) {
            if (user.getUserPasswd().equals(password)) {
                session.setAttribute("usersession", user);
                model.addObject("message", "登录成功");
                return "success";
            } else {
                model.addObject("message", "密码错误");
                return "error";
            }
        } else {
            model.addObject("message", "不存在此用户");
            return "error";
        }
    }

    @RequestMapping(value="validate",method = RequestMethod.POST)
    @ResponseBody
    public boolean validate(@RequestParam String name) {
        User user=userService.queryByName(name);
        if(user != null) {
            return true;
        }
        return false;
    }



    @RequestMapping(value="validaterepeat",method = RequestMethod.POST)
    @ResponseBody
    public  boolean validaterepeat(@RequestParam String name) {
        User user=userService.queryByName(name);
        if(null!=user) {
            return false;
        }
        else {
            return true;
        }
    }

   /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @RequestMapping(value = "selectOne", method = RequestMethod.GET)
    public User selectOne(Long id) {
        return this.userService.queryById(id);
    }
}