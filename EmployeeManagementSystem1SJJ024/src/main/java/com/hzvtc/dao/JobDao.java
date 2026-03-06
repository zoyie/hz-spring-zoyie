package com.hzvtc.dao;

import com.hzvtc.domain.Job;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface JobDao {
    
    // 查询所有职位
    List<Job> findAllSJJ024();
    
    // 查询活跃职位
    List<Job> findActiveJobsSJJ024();
    
    // 根据ID查询职位
    Job findByIdSJJ024(Long id);
    
    // 插入职位
    void insertSJJ024(Job job);
    
    // 更新职位信息
    int updateSJJ024(Job job);
    
    // 删除职位
    int deleteSJJ024(Long id);
    
    // 根据条件查询职位
    List<Job> findByConditionSJJ024(@Param("title") String title,
                             @Param("department") String department, 
                             @Param("status") String status);
    
    // 统计职位总数
    int countSJJ024();
    
    // 统计活跃职位数
    int countActiveSJJ024();
}
