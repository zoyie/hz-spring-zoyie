package com.hzvtc.service;

import com.hzvtc.domain.Job;

import java.util.List;

public interface JobService {
    
    // 查询所有职位
    List<Job> findAllSJJ024();
    
    // 查询活跃职位
    List<Job> findActiveJobsSJJ024();
    
    // 根据ID查询职位
    Job findByIdSJJ024(Long id);
    
    // 添加职位
    void saveSJJ024(Job job);
    
    // 更新职位信息
    void updateSJJ024(Job job);
    
    // 删除职位
    void deleteSJJ024(Long id);
    
    // 根据条件查询职位
    List<Job> findByConditionSJJ024(String title, String department, String status);
    
    // 统计职位总数
    int countSJJ024();
    
    // 统计活跃职位数
    int countActiveSJJ024();
}
