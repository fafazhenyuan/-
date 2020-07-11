package priv.yuan.service.impl;

import cn.hutool.core.bean.BeanUtil;
import priv.yuan.entity.Manager;
import priv.yuan.entity.Test;
import priv.yuan.entity.User;
import priv.yuan.dao.UserDao;
import priv.yuan.service.UserService;
import org.springframework.stereotype.Service;
import priv.yuan.vo.TestVo;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * (User)表服务实现类
 *
 * @author makejava
 * @since 2020-04-01 15:00:13
 */
@Service("userService")
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userDao;

    /**
     * 修改数据
     *
     * @param user 实例对象
     * @return 实例对象
     */
    @Override
    public User updateAll(User user) {
        this.userDao.update(user);
        return this.queryById(user.getUserId());
    }


    /**
     * 用户修改地址、邮箱、电话信息
     *
     * @param userId
     * @param adress
     * @param email
     * @param phone
     * @return user对象
     **/
    @Override
    public Integer altInf(Long userId, int age,String adress, String email, String phone) {
        Integer i = userDao.altInf(userId,age,adress,email,phone);
        if(i>0){
            return 1;
        }
        return 0;

    }

    /**
     * 用户修改密码
     *
     * @param userId
     * @param userPasswd
     * @return
     **/
    @Override
    public Integer altPwd(Long userId, String userPasswd) {
        Integer i = userDao.altPwd(userId,userPasswd);
        if(i>0){
            return 1;
        }
        return 0;
    }

    /**
     * 用户登录校验用户名与密码
     *
     * @param userName 用户姓名 userPasswd 用户密码
     * @return user对象
     **/
    @Override
    public User queryByName(String userName) {
        return userDao.queryByName(userName);
    }

    /**
     * 查询所有用户
     *
     * @return list<User> 用户列表
     **/
    @Override
    public List<User> selectAll() {
        List<User> users = userDao.selectAll();
        if(users != null && users.size() > 0){
//            List<TestVo> testVos = new ArrayList<>();
//            for (Test t: tests) {
//                TestVo testVo = new TestVo();
//                BeanUtil.copyProperties(t,testVo);
//                testVos.add(testVo);
//            }
            return users;
        }
        return null;
    }

    /**
     * 通过ID查询单条数据
     *
     * @param userId 主键
     * @return 实例对象
     */
    @Override
    public User queryById(Long userId) {
        return this.userDao.queryById(userId);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<User> queryAllByLimit(int offset, int limit) {
        return this.userDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param user 实例对象
     * @return 实例对象
     */
    @Override
    public User insert(User user) {
        if(userDao.queryByName(user.getUserName())!=null){
            return null;
        }else {
            this.userDao.insert(user);
            return user;
        }

    }



    /**
     * 通过主键删除数据
     *
     * @param userId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Long userId) {
        return this.userDao.deleteById(userId) > 0;
    }
}