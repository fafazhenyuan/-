package priv.yuan.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import priv.yuan.entity.Food;
import priv.yuan.dao.FoodDao;
import priv.yuan.entity.Manager;
import priv.yuan.entity.Test;
import priv.yuan.service.FoodService;
import org.springframework.stereotype.Service;
import priv.yuan.vo.TestVo;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Random;

/**
 * (Food)表服务实现类
 *
 * @author makejava
 * @since 2020-04-01 15:00:08
 */
@Service("foodService")
public class FoodServiceImpl implements FoodService {
    @Resource
    private FoodDao foodDao;


    @Override
    public Map selectAll(int page,int limit) {
        PageHelper.startPage(page, limit);
        List<Food> foods = foodDao.selectAll();
        PageInfo<Food> pageInfo = new PageInfo<Food>(foods);
        if(foods != null && foods.size() > 0){

            Map map = new HashMap<>();
            map.put("total", pageInfo.getTotal());
            map.put("foods", foods);
            return map;
        }
        return null;
    }



    @Override
    public List<Food> breakfast(Double heat) {
        Random r = new Random();
        //计算早餐所需热量
        Double h = heat * 0.3;
        //从数据库中查出所有type为10的食物，放进列表l1
        List<Food> l1 = foodDao.queryByType(10);
        //从数据库中查出所有type为11的食物，放进列表l2
        List<Food> l2 = foodDao.queryByType(11);
        //从数据库中查出所有type为12的食物，放进列表l3
        List<Food> l3 = foodDao.queryByType(12);
        //从三个列表中分别取一个食物，组成一套早餐  重复n次，得出n种早餐方案，放进n个列表
        List<Food> n1 = new ArrayList<>();
        List<Food> n2 = new ArrayList<>();
        List<Food> n3 = new ArrayList<>();
        int len1 = l1.size();
        int len2 = l2.size();
        int len3 = l3.size();
        n1.add(l1.get(r.nextInt(len1)));
        n1.add(l2.get(r.nextInt(len2)));
        n1.add(l3.get(r.nextInt(len3)));
        n2.add(l1.get(r.nextInt(len1)));
        n2.add(l2.get(r.nextInt(len2)));
        n2.add(l3.get(r.nextInt(len3)));
        n3.add(l1.get(r.nextInt(len1)));
        n3.add(l2.get(r.nextInt(len2)));
        n3.add(l3.get(r.nextInt(len3)));
        //计算n种早餐方案对应的热量值
        double h1 = n1.get(0).getHeat() + n2.get(0).getHeat() + n3.get(0).getHeat();
        double h2 = n1.get(1).getHeat() + n2.get(1).getHeat() + n3.get(1).getHeat();
        double h3 = n1.get(2).getHeat() + n2.get(2).getHeat() + n3.get(2).getHeat();
        //n种热量值分别与所需热量值做差，比较差的绝对值,返回热量值差最小的早餐列表
        double cha1 = Math.abs(h1 - h);
        double cha2 = Math.abs(h2 - h);
        double cha3 = Math.abs(h3 - h);
        List<Food> re = new ArrayList<>();
        if (cha1 > cha2) {
            if (cha2 > cha3) {
                return n3;
            }else {
                return n2;
            }
        }else {
            if (cha1 < cha3) {
                return n1;
            }
            return n3;
        }
    }

    @Override
    public List<Food> lunch(Double heat) {
        Random r = new Random();
        //计算午餐所需热量
        Double h = heat * 0.4;
        //从数据库中查出所有type为20的食物，放进列表l1
        List<Food> l1 = foodDao.queryByType(20);
        //从数据库中查出所有type为21的食物，放进列表l2
        List<Food> l2 = foodDao.queryByType(21);
        //从数据库中查出所有type为22的食物，放进列表l3
        List<Food> l3 = foodDao.queryByType(22);
        //从三个列表中分别取一个食物，组成一套早餐  重复n次，得出n种午餐方案，放进n个列表
        List<Food> n1 = new ArrayList<>();
        List<Food> n2 = new ArrayList<>();
        List<Food> n3 = new ArrayList<>();
        int len1 = l1.size();
        int len2 = l2.size();
        int len3 = l3.size();

        n1.add(l1.get(r.nextInt(len1)));
        n1.add(l2.get(r.nextInt(len2)));
        n1.add(l3.get(r.nextInt(len3)));


        n2.add(l1.get(r.nextInt(len1)));
        n2.add(l2.get(r.nextInt(len2)));
        n2.add(l3.get(r.nextInt(len3)));


        n3.add(l1.get(r.nextInt(len1)));
        n3.add(l2.get(r.nextInt(len2)));
        n3.add(l3.get(r.nextInt(len3)));

        //计算n种早餐方案对应的热量值
        double h1 = n1.get(0).getHeat() + n2.get(0).getHeat() + n3.get(0).getHeat();
        double h2 = n1.get(1).getHeat() + n2.get(1).getHeat() + n3.get(1).getHeat();
        double h3 = n1.get(2).getHeat() + n2.get(2).getHeat() + n3.get(2).getHeat();
        //n种热量值分别与所需热量值做差，比较差的绝对值
        double cha1 = Math.abs(h1 - h);
        double cha2 = Math.abs(h2 - h);
        double cha3 = Math.abs(h3 - h);

        List<Food> re = new ArrayList<>();
        if (cha1 > cha2) {
            if (cha2 > cha3) {
                return n3;
            }else {
                return n2;
            }


        }else {
            if (cha1 < cha3) {
                return n1;
            }
            return n3;

        }
    }

    @Override
    public List<Food> dinner(Double heat) {
        Random r = new Random();
        //计算早餐所需热量
        Double h = heat * 0.3;
        //从数据库中查出所有type为30的食物，放进列表l1
        List<Food> l1 = foodDao.queryByType(30);
        //从数据库中查出所有type为31的食物，放进列表l2
        List<Food> l2 = foodDao.queryByType(31);
        //从数据库中查出所有type为32的食物，放进列表l3
        List<Food> l3 = foodDao.queryByType(32);
        //从三个列表中分别取一个食物，组成一套晚餐  重复n次，得出n种晚餐方案，放进n个列表
        List<Food> n1 = new ArrayList<>();
        List<Food> n2 = new ArrayList<>();
        List<Food> n3 = new ArrayList<>();
        int len1 = l1.size();
        int len2 = l2.size();
        int len3 = l3.size();
        n1.add(l1.get(r.nextInt(len1)));
        n1.add(l2.get(r.nextInt(len2)));
        n1.add(l3.get(r.nextInt(len3)));


        n2.add(l1.get(r.nextInt(len1)));
        n2.add(l2.get(r.nextInt(len2)));
        n2.add(l3.get(r.nextInt(len3)));


        n3.add(l1.get(r.nextInt(len1)));
        n3.add(l2.get(r.nextInt(len2)));
        n3.add(l3.get(r.nextInt(len3)));

        //计算n种早餐方案对应的热量值
        double h1 = n1.get(0).getHeat() + n2.get(0).getHeat() + n3.get(0).getHeat();
        double h2 = n1.get(1).getHeat() + n2.get(1).getHeat() + n3.get(1).getHeat();
        double h3 = n1.get(2).getHeat() + n2.get(2).getHeat() + n3.get(2).getHeat();
        //n种热量值分别与所需热量值做差，比较差的绝对值
        double cha1 = Math.abs(h1 - h);
        double cha2 = Math.abs(h2 - h);
        double cha3 = Math.abs(h3 - h);

        List<Food> re = new ArrayList<>();
        if (cha1 > cha2) {
            if (cha2 > cha3) {
                return n3;
            }else {
                return n2;
            }
        }else {
            if (cha1 < cha3) {
                return n1;
            }
            return n3;
        }
    }


    /**
         * 通过ID查询单条数据
         *
         * @param foodId 主键
         * @return 实例对象
         */
        @Override
        public Food queryById (Long foodId){
            return this.foodDao.queryById(foodId);
        }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<Food> queryAllByLimit(int offset, int limit) {
        return this.foodDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param food 实例对象
     * @return 实例对象
     */
    @Override
    public Food insert(Food food) {
        this.foodDao.insert(food);
        return food;
    }

    /**
     * 修改数据
     *
     * @param food 实例对象
     * @return 实例对象
     */
    @Override
    public Food update(Food food) {
        this.foodDao.update(food);
        return this.queryById(food.getFoodId());
    }

    /**
     * 通过主键删除数据
     *
     * @param foodId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Long foodId) {
        return this.foodDao.deleteById(foodId) > 0;
    }
}