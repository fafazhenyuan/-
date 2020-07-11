package priv.yuan.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import priv.yuan.entity.Manager;
import priv.yuan.dao.ManagerDao;
import priv.yuan.entity.Test;
import priv.yuan.entity.User;
import priv.yuan.service.ManagerService;
import org.springframework.stereotype.Service;
import priv.yuan.vo.TestVo;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * (Manager)表服务实现类
 *
 * @author makejava
 * @since 2020-04-01 15:00:13
 */
@Service("managerService")
public class ManagerServiceImpl implements ManagerService {
    @Resource
    private ManagerDao managerDao;

    @Override
    public Map selectAll(Integer page, Integer limit) {
        PageHelper.startPage(page, limit);
        List<Manager> managers = managerDao.selectAll();
        PageInfo<Manager> pageInfo = new PageInfo<Manager>(managers);
        if(managers != null && managers.size() > 0){
            Map map = new HashMap<>();
            map.put("total", pageInfo.getTotal());
            map.put("managers", managers);
            return map;
        }
        return null;
    }




    /**
     * 通过ID查询单条数据
     *
     * @param managerId 主键
     * @return 实例对象
     */
    @Override
    public Manager queryById(Long managerId) {
        return this.managerDao.queryById(managerId);
    }

    /**
     * 管理员登录校验用户名与密码
     *
     * @param managerName 用户姓名
     * @return manager对象
     **/
    @Override
    public Manager queryByName(String managerName) {
        List<Manager> m = new ArrayList<>();
        m = managerDao.queryByName(managerName);
        if(m==null && m.size()<=0){
            return null;
        }else {
            Manager ma = m.get(0);
        return ma;}
    }


    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<Manager> queryAllByLimit(int offset, int limit) {
        return this.managerDao.queryAllByLimit(offset, limit);
    }

//    /**
//     * 新增数据
//     *
//     * @param
//     * @return 实例对象
//     */
//    @Override
//    public Integer insert(Manager manager) {
//        Manager m = this.queryByName(manager.getManagerName());
//        if(m==null){
////            int i = managerDao.insert(manager.getManagerName(),manager.getManagerPasswd());
//            int i=0;
//            if(i<0){
//                return -1;
//            }
//            return 0;
//        }else {
//            return -1;
//        }
//
//    }

    @Override
    public Integer add(Manager manager) {

            int i = managerDao.insert(manager);
            if(i<0){
                return -1;
            }
            return 0;

    }










    /**
     * 修改数据
     *
     * @param
     * @return 实例对象
     */
    @Override
    public Manager update(Long managerId,String managerName,String managerPasswd) {
        int update = this.managerDao.update(managerId, managerName,managerPasswd);
        if(update >0){
            return managerDao.queryById(managerId);
        }else {
            return null;
        }





    }

    /**
     * 通过主键删除数据
     *
     * @param managerId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Long managerId) {
        return this.managerDao.deleteById(managerId) > 0;
    }
}