package priv.yuan.dao;

import priv.yuan.entity.User;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (User)表数据库访问层
 *
 * @author makejava
 * @since 2020-04-01 15:00:13
 */
public interface UserDao {

    /**
     * 用户修改地址、邮箱、电话信息
     *
     * @param userId
     * @param adress
     * @param email
     * @param phone
     * @return
     **/
    Integer altInf(@Param("userId") Long userId,@Param("age") int age,@Param("adress") String adress,@Param("email") String email,@Param("phone") String phone);

    /**
     * 用户修改密码
     * @param userId
     * @param userPasswd
     * @return
     **/
    Integer altPwd(@Param("userId") Long userId,@Param("userPasswd") String userPasswd);


    /**
     *查询全部用户
     * @return List<User> 用户列表
     */
    List<User> selectAll();

    /**
     *按姓名查找用户
     *
     * @param userName 用户姓名
     * @return user对象
     */
    User queryByName(String userName);

    /**
     * 通过ID查询单条数据
     *
     * @param userId 主键
     * @return 实例对象
     */
    User queryById(Long userId);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<User> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param user 实例对象
     * @return 对象列表
     */
    List<User> queryAll(User user);

    /**
     * 新增数据
     *
     * @param user 实例对象
     * @return 影响行数
     */
    int insert(User user);

    /**
     * 修改数据
     *
     * @param user 实例对象
     * @return 影响行数
     */
    int update(User user);

    /**
     * 通过主键删除数据
     *
     * @param userId 主键
     * @return 影响行数
     */
    int deleteById(Long userId);

}