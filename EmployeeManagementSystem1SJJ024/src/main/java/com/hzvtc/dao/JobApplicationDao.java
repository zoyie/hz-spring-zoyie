package com.hzvtc.dao;

import com.hzvtc.domain.JobApplication;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface JobApplicationDao {
    
    // 查询所有申请
    List<JobApplication> findAllSJJ024();
    
    // 根据ID查询申请
    JobApplication findByIdSJJ024(Long id);
    
    // 根据用户ID查询申请
    List<JobApplication> findByUserIdSJJ024(Long userId);
    
    // 根据职位ID查询申请
    List<JobApplication> findByJobIdSJJ024(Long jobId);
    
    // 插入申请
    void insertSJJ024(JobApplication jobApplication);
    
    // 更新申请状态
    int updateStatusSJJ024(@Param("id") Long id, @Param("status") String status, @Param("feedback") String feedback);
    
    // 删除申请
    int deleteSJJ024(Long id);

    
    // 统计申请总数
    int countSJJ024();
    
    // 统计待处理申请数
    int countPendingSJJ024();

    void deleteByJobIdSJJ024(Long jobId);


}
