package priv.yuan.service;

import priv.yuan.entity.Manager;
import priv.yuan.entity.User;
import java.util.List;

/**
 * (User)表服务接口
 *
 * @author makejava
 * @since 2020-04-01 15:00:13
 */
public interface UserService {


    User updateAll(User u);

    /**
     *用户修改地址、邮箱、电话信息
     * @param userId,adress,phone,email
     * @return
     **/
    Integer altInf(Long userId,int age,String adress,String email,String phone);

    /**
     *用户修改密码
     * @param userId,userPasswd
     * @return
     **/
    Integer altPwd(Long userId,String userPasswd);



    /**
     *用户登录校验用户名与密码
     *
     * @param userName 用户姓名
     * @return user对象
     **/
    User queryByName(String userName);


    /**
     *查询所有用户
     * @return list<User> 用户列表
     **/
    List<User> selectAll();




    /**
     * 通过ID查询单条数据
     *
     * @param userId 主键
     * @return 实例对象
     */
    User queryById(Long userId);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<User> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param user 实例对象
     * @return 实例对象
     */
    User insert(User user);



    /**
     * 通过主键删除数据
     *
     * @param userId 主键
     * @return 是否成功
     */
    boolean deleteById(Long userId);

}