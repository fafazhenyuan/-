package priv.yuan.service;

import priv.yuan.entity.Food;
import priv.yuan.entity.Manager;
import priv.yuan.vo.HeatVo;

import java.util.List;
import java.util.Map;

/**
 * (Food)表服务接口
 *
 * @author makejava
 * @since 2020-04-01 15:00:07
 */
public interface FoodService {



    List<Food> breakfast(Double heat);
    List<Food> lunch(Double heat);
    List<Food> dinner(Double heat);
    Map selectAll(int page, int limit);

    /**
     * 通过ID查询单条数据
     *
     * @param foodId 主键
     * @return 实例对象
     */
    Food queryById(Long foodId);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<Food> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param food 实例对象
     * @return 实例对象
     */
    Food insert(Food food);

    /**
     * 修改数据
     *
     * @param food 实例对象
     * @return 实例对象
     */
    Food update(Food food);

    /**
     * 通过主键删除数据
     *
     * @param foodId 主键
     * @return 是否成功
     */
    boolean deleteById(Long foodId);

}