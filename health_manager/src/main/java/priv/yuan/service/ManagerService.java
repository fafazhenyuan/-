package priv.yuan.service;

import priv.yuan.entity.Manager;
import priv.yuan.entity.User;

import java.util.List;
import java.util.Map;

/**
 * (Manager)表服务接口
 *
 * @author makejava
 * @since 2020-04-01 15:00:13
 */
public interface ManagerService {

    Map selectAll(Integer page, Integer limit);


    /**
     * 通过ID查询单条数据
     *
     * @param managerId 主键
     * @return 实例对象
     */
    Manager queryById(Long managerId);


    /**
     *管理员登录校验用户名与密码
     *
     * @param managerName 用户姓名
     * @return manager对象
     **/
    Manager queryByName(String managerName);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<Manager> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param manager 实例对象
     * @return 实例对象
     */
//    Integer insert(Manager manager);
    Integer add(Manager manager);

    /**
     * 修改数据
     *
     * @param
     * @return 实例对象
     */
    Manager update(Long managerId,String managerName,String managerPasswd);

    /**
     * 通过主键删除数据
     *
     * @param managerId 主键
     * @return 是否成功
     */
    boolean deleteById(Long managerId);

}