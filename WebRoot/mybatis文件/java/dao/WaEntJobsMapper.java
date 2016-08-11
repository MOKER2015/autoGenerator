package dao;

import model.WaEntJobs;

public interface WaEntJobsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(WaEntJobs record);

    int insertSelective(WaEntJobs record);

    WaEntJobs selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(WaEntJobs record);

    int updateByPrimaryKey(WaEntJobs record);
}