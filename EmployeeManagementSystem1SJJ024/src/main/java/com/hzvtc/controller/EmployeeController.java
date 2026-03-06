package com.hzvtc.controller;

import com.hzvtc.domain.Employee;
import com.hzvtc.domain.Job;
import com.hzvtc.domain.JobApplication;
import com.hzvtc.domain.User;
import com.hzvtc.service.EmployeeService;
import com.hzvtc.service.JobApplicationService;
import com.hzvtc.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
    
    @Autowired
    private EmployeeService employeeService;
    
    @Autowired
    private JobService jobService;
    
    @Autowired
    private JobApplicationService jobApplicationService;

    // 用户/员工首页
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        // 检查登录状态
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/auth/login?role=employee";
        }
        
        model.addAttribute("user", user);
        return "employee/dashboard";
    }
    
    // 员工列表页面
    @GetMapping("/employees")
    public String employees(HttpSession session, Model model) {
        // 检查登录状态
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/auth/login?role=employee";
        }
        
        List<Employee> employees = employeeService.findAllSJJ024();
        model.addAttribute("employees", employees);
        return "employee/employees";
    }
    
    // 求职页面
    @GetMapping("/jobs")
    public String jobs(HttpSession session, Model model) {
        // 检查登录状态
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/auth/login?role=employee";
        }
        
        List<Job> jobs = jobService.findActiveJobsSJJ024();
        model.addAttribute("jobs", jobs);
        model.addAttribute("user", user);
        return "employee/jobs";
    }
    
    // 申请职位页面
    @GetMapping("/jobs/{id}/apply")
    public String applyJobPage(@PathVariable Long id, HttpSession session, Model model) {
        // 检查登录状态
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/auth/login?role=employee";
        }
        
        Job job = jobService.findByIdSJJ024(id);

        model.addAttribute("job", job);
        model.addAttribute("application", new JobApplication());
        return "employee/apply-job";
    }
    
    // 我的申请页面
    @GetMapping("/applications")
    public String myApplications(HttpSession session, Model model) {
        // 检查登录状态
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/auth/login?role=employee";
        }
        
        List<JobApplication> applications = jobApplicationService.findByUserIdSJJ024(user.getId());
        model.addAttribute("applications", applications);
        return "employee/applications";
    }

    // 撤销申请
    @GetMapping("/applications/cancel/{id}")
    public String cancelApplication(@PathVariable Long id, HttpSession session) {
        // 检查登录状态
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/auth/login?role=employee";
        }

        jobApplicationService.deleteSJJ024(id);
        return "redirect:/employee/applications";
    }

    @PostMapping("/jobs/{id}/apply")
    public String applyJob(@PathVariable Long id,
                           @ModelAttribute JobApplication application,
                           HttpSession session,
                           Model model) {
        // 检查登录状态
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/auth/login?role=employee";
        }

        application.setJobId(id);
        application.setUserId(user.getId());
        application.setStatus("pending");
        application.setApplyTime(new Date());

        boolean success = jobApplicationService.applySJJ024(application);

        if (success) {
            return "redirect:/employee/applications?success=applied";
        } else {
            model.addAttribute("error", "申请失败");
            Job job = jobService.findByIdSJJ024(id);
            model.addAttribute("job", job);
            model.addAttribute("application", application);
            return "employee/apply-job";
        }
    }
}
