package com.hzvtc.service.impl;

import com.hzvtc.dao.JobApplicationDao;
import com.hzvtc.domain.Employee;
import com.hzvtc.domain.Job;
import com.hzvtc.domain.JobApplication;
import com.hzvtc.domain.User;
import com.hzvtc.service.JobApplicationService;
import com.hzvtc.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class JobApplicationServiceImpl implements JobApplicationService {
    
    @Autowired
    private JobApplicationDao jobApplicationDao;

    @Autowired
    private JobService jobService;
    
    @Override
    public List<JobApplication> findAllSJJ024() {
        return jobApplicationDao.findAllSJJ024();
    }
    
    @Override
    public JobApplication findByIdSJJ024(Long id) {
        return jobApplicationDao.findByIdSJJ024(id);
    }
    
    @Override
    public List<JobApplication> findByUserIdSJJ024(Long userId) {
        return jobApplicationDao.findByUserIdSJJ024(userId);
    }
    
    @Override
    public List<JobApplication> findByJobIdSJJ024(Long jobId) {
        return jobApplicationDao.findByJobIdSJJ024(jobId);
    }
    
    @Override
    public boolean applySJJ024(JobApplication jobApplication) {
        try {
            jobApplication.setStatus("pending");
            jobApplication.setApplyTime(new Date());
            jobApplicationDao.insertSJJ024(jobApplication);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    @Override
    public void processApplicationSJJ024(Long id, String status, String feedback) {
        jobApplicationDao.updateStatusSJJ024(id, status, feedback);
    }
    
    @Override
    public void deleteSJJ024(Long id) {
        jobApplicationDao.deleteSJJ024(id);
    }

    
    @Override
    public int countSJJ024() {
        return jobApplicationDao.countSJJ024();
    }
    
    @Override
    public int countPendingSJJ024() {
        return jobApplicationDao.countPendingSJJ024();
    }


}
