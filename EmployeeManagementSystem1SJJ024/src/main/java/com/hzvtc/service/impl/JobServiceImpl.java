package com.hzvtc.service.impl;

import com.hzvtc.dao.JobDao;
import com.hzvtc.domain.Job;
import com.hzvtc.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class JobServiceImpl implements JobService {
    
    @Autowired
    private JobDao jobDao;
    
    @Override
    public List<Job> findAllSJJ024() {
        return jobDao.findAllSJJ024();
    }
    
    @Override
    public List<Job> findActiveJobsSJJ024() {
        return jobDao.findActiveJobsSJJ024();
    }
    
    @Override
    public Job findByIdSJJ024(Long id) {
        return jobDao.findByIdSJJ024(id);
    }
    
    @Override
    public void saveSJJ024(Job job) {
        if (job.getStatus() == null || job.getStatus().isEmpty()) {
            job.setStatus("active");
        }
        if (job.getJobType() == null || job.getJobType().isEmpty()) {
            job.setJobType("full-time");
        }
        job.setCreateTime(new Date());
        job.setUpdateTime(new Date());
        jobDao.insertSJJ024(job);
    }
    
    @Override
    public void updateSJJ024(Job job) {
        job.setUpdateTime(new Date());
        jobDao.updateSJJ024(job);
    }
    
    @Override
    public void deleteSJJ024(Long id) {
        jobDao.deleteSJJ024(id);
    }
    
    @Override
    public List<Job> findByConditionSJJ024(String title, String department, String status) {
        return jobDao.findByConditionSJJ024(title, department, status);
    }
    
    @Override
    public int countSJJ024() {
        return jobDao.countSJJ024();
    }
    
    @Override
    public int countActiveSJJ024() {
        return jobDao.countActiveSJJ024();
    }
}
