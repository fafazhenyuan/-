package priv.yuan.service;

import org.springframework.web.bind.annotation.RequestParam;
import priv.yuan.entity.Log;

import java.util.Date;
import java.util.List;

/**
 * (Log)表服务接口
 *
 * @author makejava
 * @since 2020-04-01 15:00:12
 */
public interface LogService {


    public Log seleLog(Date logData, Long userId);


    Integer addLog(String logData, String text, Double sleephour, String mood, Integer cigrette, double weight, String pressure, Double bphigh, Double bplow, Double bs, Long userId);


    /**
     * 通过ID查询单条数据
     *
     * @param logId 主键
     * @return 实例对象
     */
    Log queryById(Long logId);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<Log> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param log 实例对象
     * @return 实例对象
     */
    Log insert(Log log);

    /**
     * 修改数据
     *
     * @param log 实例对象
     * @return 实例对象
     */
    Log update(Log log);

    /**
     * 通过主键删除数据
     *
     * @param logId 主键
     * @return 是否成功
     */
    boolean deleteById(Long logId);

}