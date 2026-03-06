package com.hzvtc.domain;

import java.util.Date;

public class JobApplication {
    private Long id;
    private Long jobId;
    private Long userId;
    private String resume;
    private String coverLetter;
    private String status; // pending, approved, rejected
    private String feedback;
    private Date applyTime;
    private Date processTime;
    
    // 关联对象
    private Job job;
    private User user;

    // 构造函数
    public JobApplication() {}

    public JobApplication(Long jobId, Long userId, String resume, String coverLetter) {
        this.jobId = jobId;
        this.userId = userId;
        this.resume = resume;
        this.coverLetter = coverLetter;
        this.status = "pending";
        this.applyTime = new Date();
    }

    // Getter和Setter方法
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getJobId() {
        return jobId;
    }

    public void setJobId(Long jobId) {
        this.jobId = jobId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getResume() {
        return resume;
    }

    public void setResume(String resume) {
        this.resume = resume;
    }

    public String getCoverLetter() {
        return coverLetter;
    }

    public void setCoverLetter(String coverLetter) {
        this.coverLetter = coverLetter;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public Date getApplyTime() {
        return applyTime;
    }

    public void setApplyTime(Date applyTime) {
        this.applyTime = applyTime;
    }

    public Date getProcessTime() {
        return processTime;
    }

    public void setProcessTime(Date processTime) {
        this.processTime = processTime;
    }

    public Job getJob() {
        return job;
    }

    public void setJob(Job job) {
        this.job = job;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "JobApplication{" +
                "id=" + id +
                ", jobId=" + jobId +
                ", userId=" + userId +
                ", status='" + status + '\'' +
                ", applyTime=" + applyTime +
                '}';
    }
}
