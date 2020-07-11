package priv.yuan.service.impl;

import priv.yuan.entity.Log;
import priv.yuan.dao.LogDao;
import priv.yuan.service.LogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * (Log)表服务实现类
 *
 * @author makejava
 * @since 2020-04-01 15:00:12
 */
@Service("logService")
public class LogServiceImpl implements LogService {
    @Resource
    private LogDao logDao;


    @Override
    public Log seleLog(Date logData, Long userId){
        Log log = logDao.seleLog(logData,userId);
        if(log != null){
            return log;
        }else {
            return null;
        }
    };


    @Override
    public Integer addLog(String logData, String text, Double sleephour, String mood, Integer cigrette, double weight, String pressure, Double bphigh, Double bplow, Double bs,Long userId) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date date = new java.util.Date();
        Log log = logDao.seleLog(date,userId);
        if(log != null){
            return 0;
        }else {
            Integer  i = logDao.addLog(date,text,sleephour,mood,cigrette,weight,pressure,bphigh,bplow,bs,userId);
            if (i<0){
                return 0;
            }else {
                return 1;
            }
        }



    }

    /**
     * 通过ID查询单条数据
     *
     * @param logId 主键
     * @return 实例对象
     */
    @Override
    public Log queryById(Long logId) {
        return this.logDao.queryById(logId);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<Log> queryAllByLimit(int offset, int limit) {
        return this.logDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param log 实例对象
     * @return 实例对象
     */
    @Override
    public Log insert(Log log) {
        this.logDao.insert(log);
        return log;
    }

    /**
     * 修改数据
     *
     * @param log 实例对象
     * @return 实例对象
     */
    @Override
    public Log update(Log log) {
        this.logDao.update(log);
        return this.queryById(log.getLogId());
    }

    /**
     * 通过主键删除数据
     *
     * @param logId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Long logId) {
        return this.logDao.deleteById(logId) > 0;
    }
}