package com.hzvtc.service;

import com.hzvtc.domain.JobApplication;

import java.util.List;

public interface JobApplicationService {
    
    // 查询所有申请
    List<JobApplication> findAllSJJ024();
    
    // 根据ID查询申请
    JobApplication findByIdSJJ024(Long id);
    
    // 根据用户ID查询申请
    List<JobApplication> findByUserIdSJJ024(Long userId);
    
    // 根据职位ID查询申请
    List<JobApplication> findByJobIdSJJ024(Long jobId);
    
    // 提交申请
    boolean applySJJ024(JobApplication jobApplication);
    
    // 处理申请（通过/拒绝）
    void processApplicationSJJ024(Long id, String status, String feedback);
    
    // 删除申请
    void deleteSJJ024(Long id);

    
    // 统计申请总数
    int countSJJ024();
    
    // 统计待处理申请数
    int countPendingSJJ024();

}
