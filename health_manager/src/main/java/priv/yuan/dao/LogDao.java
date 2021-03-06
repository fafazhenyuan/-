package priv.yuan.dao;

import priv.yuan.entity.Log;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * (Log)表数据库访问层
 *
 * @author makejava
 * @since 2020-04-01 15:00:12
 */
public interface LogDao {



    public Log seleLog(@Param("logData") Date logData, @Param("userId") Long userId);



    Integer addLog(@Param("logData") java.util.Date logData, @Param("text") String text, @Param("sleephour") Double sleephour, @Param("mood") String mood, @Param("cigrette") Integer cigrette, @Param("weight") double weight, @Param("pressure") String pressure, @Param("bphigh") Double bphigh, @Param("bplow") Double bplow, @Param("bs") Double bs, @Param("userId") Long userId);

    /**
     * 通过ID查询单条数据
     *
     * @param logId 主键
     * @return 实例对象
     */
    Log queryById(Long logId);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<Log> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param log 实例对象
     * @return 对象列表
     */
    List<Log> queryAll(Log log);

    /**
     * 新增数据
     *
     * @param log 实例对象
     * @return 影响行数
     */
    int insert(Log log);

    /**
     * 修改数据
     *
     * @param log 实例对象
     * @return 影响行数
     */
    int update(Log log);

    /**
     * 通过主键删除数据
     *
     * @param logId 主键
     * @return 影响行数
     */
    int deleteById(Long logId);

}