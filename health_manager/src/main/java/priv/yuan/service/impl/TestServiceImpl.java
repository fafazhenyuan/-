package priv.yuan.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.val;
import priv.yuan.entity.Test;
import priv.yuan.dao.TestDao;
import priv.yuan.service.TestService;
import org.springframework.stereotype.Service;
import priv.yuan.vo.TestVo;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * (Test)表服务实现类
 *
 * @author makejava
 * @since 2020-04-01 15:00:13
 */
@Service("testService")
public class TestServiceImpl implements TestService {
    @Resource
    private TestDao testDao;

    /**
     * 通过ID查询单条数据
     * @param userId 用户id
     * @return 实例对象
     */
    @Override
    public List<TestVo> queryById(Long userId) {
        List<Test> tests = testDao.queryByuserId(userId);
        List<TestVo> testVos = new ArrayList<>();
        if(tests != null && tests.size() > 0) {
            for (Test t : tests) {
                TestVo testVo = new TestVo();
                BeanUtil.copyProperties(t, testVo);
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                String timeText=format.format(t.getData());
                testVo.setData1(timeText);
                testVos.add(testVo);
            }
        }
         return testVos;
    }



    @Override
    public List<Test> queryAll(){
        List<Test> tests = testDao.queryAll();
//        List<Test>  t = new ArrayList<>();
//        for(Test test:tests){
//            Test tt = new Test();
//            BeanUtil.copyProperties(t,tt);
//            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//            tt.setData(new SimpleDateFormat(format.format(test.getData())));
//
//            Date newDate= format.parse(test.getData());
//            formatter = new SimpleDateFormat("yyyy-MM-dd");
//            return formatter.format(newDate);
        return tests;
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<Test> queryAllByLimit(int offset, int limit) {
        return this.testDao.queryAllByLimit(offset, limit);
    }

    /**
     * 查询全部数据
     *
     * @return 对象列表
     */
    //查询特定用户
    @Override
    public Map selectAll(Long id, Integer page, Integer limit) {
        PageHelper.startPage(page, limit);
        List<Test> tests = testDao.queryByUserId(id);
        PageInfo<Test> pageInfo = new PageInfo<Test>(tests);
        if(tests != null && tests.size() > 0){
            List<TestVo> testVos = new ArrayList<>();
            for (Test t: pageInfo.getList()) {
                TestVo testVo = new TestVo();
                BeanUtil.copyProperties(t,testVo);
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                String timeText=format.format(t.getData());
                testVo.setData1(timeText);
                testVos.add(testVo);
            }
            Map map = new HashMap<>();
            map.put("total", pageInfo.getTotal());
            map.put("tests", testVos);
            return map;
        }
        return null;
    }





    /**
     * 新增数据
     *
     * @param test 实例对象
     * @return 实例对象
     */
    @Override
    public Test insert(Test test) {
        this.testDao.insert(test);
        return test;
    }

    /**
     * 修改数据
     *
     * @param test 实例对象
     * @return 实例对象
     */
    @Override
    public Test update(Test test) {
        this.testDao.update(test);
        return testDao.queryById(test.getTestId());
    }

    /**
     * 通过主键删除数据
     *
     * @param testId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Long testId) {
        return this.testDao.deleteById(testId) > 0;
    }
}