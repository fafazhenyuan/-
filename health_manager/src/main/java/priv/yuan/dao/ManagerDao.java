package priv.yuan.dao;

import org.apache.ibatis.annotations.Options;
import priv.yuan.entity.Manager;
import org.apache.ibatis.annotations.Param;
import priv.yuan.entity.User;

import java.util.List;

/**
 * (Manager)表数据库访问层
 *
 * @author makejava
 * @since 2020-04-01 15:00:13
 */
public interface ManagerDao {

    /**
     * 通过ID查询单条数据
     *
     * @param managerId 主键
     * @return 实例对象
     */
    Manager queryById(Long managerId);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */

    /**
     *按姓名查找管理员
     *
     * @param managerName 管理员姓名
     * @return manager对象
     */
    List<Manager> queryByName(String managerName);


    List<Manager> selectAll();



    List<Manager> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param manager 实例对象
     * @return 对象列表
     */
    List<Manager> queryAll(Manager manager);

    /**
     * 新增数据
     *
     * @param
     */
//    @Options(useGeneratedKeys = true, keyProperty = "managerId")
    int insert(Manager manager);



    /**
     * 修改数据
     *
     * @param
     * @return 影响行数
     */
    int update(@Param("managerId") Long managerId,@Param("managerName") String managerName,@Param("managerPasswd") String managerPasswd);

    /**
     * 通过主键删除数据
     *
     * @param managerId 主键
     * @return 影响行数
     */
    int deleteById(@Param("managerId") Long managerId);

}