package priv.yuan.dao;

import priv.yuan.entity.Food;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (Food)表数据库访问层
 *
 * @author makejava
 * @since 2020-04-01 15:00:03
 */
public interface FoodDao {

    List<Food> queryByType(int type);

    List<Food> selectAll();



    /**
     * 通过ID查询单条数据
     *
     * @param foodId 主键
     * @return 实例对象
     */
    Food queryById(Long foodId);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<Food> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param food 实例对象
     * @return 对象列表
     */
    List<Food> queryAll(Food food);

    /**
     * 新增数据
     *
     * @param food 实例对象
     * @return 影响行数
     */
    int insert(Food food);

    /**
     * 修改数据
     *
     * @param food 实例对象
     * @return 影响行数
     */
    int update(Food food);

    /**
     * 通过主键删除数据
     *
     * @param foodId 主键
     * @return 影响行数
     */
    int deleteById(Long foodId);

}