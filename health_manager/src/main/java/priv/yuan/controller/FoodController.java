package priv.yuan.controller;

import org.springframework.stereotype.Controller;
import priv.yuan.entity.Food;
import priv.yuan.entity.Manager;
import priv.yuan.service.FoodService;
import org.springframework.web.bind.annotation.*;
import priv.yuan.service.HeatService;
import priv.yuan.vo.HeatVo;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * (Food)表控制层
 *
 * @author makejava
 * @since 2020-04-01 15:00:09
 */
@Controller
@RequestMapping("food")
public class FoodController {
    /**
     * 服务对象
     */
    @Resource
    private FoodService foodService;
    @Resource
    private HeatService heatService;



    @ResponseBody
    @RequestMapping(value = "del", method = RequestMethod.POST)
    public String del(@RequestParam String foodId){
        long l = Long.parseLong(foodId);
        boolean b = foodService.deleteById(l);
        if(b == false){
            return "error";
        }
        return "success";
    }

    @ResponseBody
    @RequestMapping(value = "update")
    public Food update(Food food){
        Food f = foodService.update(food);
        if(f != null){
            return f;
        }
        return null;
    }

    @RequestMapping(value = "foods")
    @ResponseBody
    public Map<String,Object> listAll(@RequestParam(defaultValue="1")int page,
                                      @RequestParam(defaultValue="5")int limit){
        Map m = foodService.selectAll(page,limit);
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",m.get("total"));
        map.put("data",m.get("foods"));
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "add", method = RequestMethod.POST)
    public boolean add(Food food){
        Food f  = foodService.insert(food);
        if(f == null){
            return false;
        }
        return true;
    }











//    @RequestParam Double weight,@RequestParam int age,@RequestParam int sex,@RequestParam int ex
    @ResponseBody
    @RequestMapping(value = "cal",method = RequestMethod.POST)
    public Map<String,Object> cal(HeatVo heatVo){
        Double c = heatService.cal(heatVo);
        List<Food> breakfast = new ArrayList<>();
        List<Food> lunch = new ArrayList<>();
        List<Food> dinner = new ArrayList<>();
        breakfast = foodService.breakfast(c);
        lunch = foodService.lunch(c);
        dinner = foodService.dinner(c);



        Map<String,Object> map = new HashMap<>();
        map.put("heat",c);
        map.put("breakfast",breakfast);
        map.put("lunch",lunch);
        map.put("dinner",dinner);


        return map;
    }



    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public Food selectOne(Long id) {
        return this.foodService.queryById(id);
    }

}