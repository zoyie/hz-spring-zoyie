package com.hzvtc.controller;

import com.hzvtc.domain.Employee;
import com.hzvtc.domain.Job;
import com.hzvtc.domain.JobApplication;
import com.hzvtc.domain.User;
import com.hzvtc.service.EmployeeService;
import com.hzvtc.service.JobApplicationService;
import com.hzvtc.service.JobService;
import com.hzvtc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    
    @Autowired
    private EmployeeService employeeService;
    
    @Autowired
    private JobService jobService;
    
    @Autowired
    private JobApplicationService jobApplicationService;
    
    @Autowired
    private UserService userService;
    
    // 管理员首页
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        // 检查管理员权限
        User user = (User) session.getAttribute("user");
        if (user == null || !"admin".equals(user.getRole())) {
            return "redirect:/auth/login?role=admin";
        }
        
        // 获取统计数据
        Integer totalEmployees = employeeService.countSJJ024();
        int totalJobs = jobService.countActiveSJJ024();
        int pendingApplications = jobApplicationService.countPendingSJJ024();
        int totalUsers = userService.countSJJ024();
        
        model.addAttribute("totalEmployees", totalEmployees);
        model.addAttribute("totalJobs", totalJobs);
        model.addAttribute("pendingApplications", pendingApplications);
        model.addAttribute("totalUsers", totalUsers);
        model.addAttribute("user", user);
        
        return "admin/dashboard";
    }
    
    // 员工管理页面
    @GetMapping("/employees")
    public String employees(HttpSession session, Model model) {
        // 检查管理员权限
        User user = (User) session.getAttribute("user");
        if (user == null || !"admin".equals(user.getRole())) {
            return "redirect:/auth/login?role=admin";
        }
        
        List<Employee> employees = employeeService.findAllSJJ024();
        model.addAttribute("employees", employees);
        return "admin/employees";
    }
    
    // 添加员工页面
    @GetMapping("/employees/add")
    public String addEmployeePage(HttpSession session, Model model) {
        // 检查管理员权限
        User user = (User) session.getAttribute("user");
        if (user == null || !"admin".equals(user.getRole())) {
            return "redirect:/auth/login?role=admin";
        }
        
        model.addAttribute("employee", new Employee());
        return "admin/employee-form";
    }
    
    // 保存员工
    @PostMapping("/employees/save")
    public String saveEmployee(@ModelAttribute Employee employee, HttpSession session) {
        // 检查管理员权限
        User user = (User) session.getAttribute("user");
        if (user == null || !"admin".equals(user.getRole())) {
            return "redirect:/auth/login?role=admin";
        }
        
        if (employee.getId() == null) {
            employeeService.saveSJJ024(employee);
        } else {
            employeeService.updateSJJ024(employee);
        }
        return "redirect:/admin/employees";
    }
    
    // 编辑员工页面
    @GetMapping("/employees/edit/{id}")
    public String editEmployeePage(@PathVariable Integer id, HttpSession session, Model model) {
        // 检查管理员权限
        User user = (User) session.getAttribute("user");
        if (user == null || !"admin".equals(user.getRole())) {
            return "redirect:/auth/login?role=admin";
        }
        
        Employee employee = employeeService.findByIdSJJ024(id);
        model.addAttribute("employee", employee);
        return "admin/employee-form";
    }

    // 查询单个员工
    @GetMapping("/employees/search")
    public String searchEmployee(@RequestParam Integer id, Model model, HttpSession session) {
        // 检查管理员权限
        User user = (User) session.getAttribute("user");
        if (user == null || !"admin".equals(user.getRole())) {
            return "redirect:/auth/login?role=admin";
        }

        Employee employee = employeeService.findByIdSJJ024(id);
        if (employee != null) {
            model.addAttribute("employees", Collections.singletonList(employee));
        } else {
            model.addAttribute("employees", new ArrayList<>());
        }

        return "admin/employees";
    }
    
    // 删除员工
    @GetMapping("/employees/delete/{id}")
    public String deleteEmployee(@PathVariable Integer id, HttpSession session) {
        // 检查管理员权限
        User user = (User) session.getAttribute("user");
        if (user == null || !"admin".equals(user.getRole())) {
            return "redirect:/auth/login?role=admin";
        }
        
        employeeService.deleteSJJ024(id);
        return "redirect:/admin/employees";
    }
    
    // 招聘管理页面
    @GetMapping("/recruitment")
    public String recruitment(HttpSession session, Model model) {
        // 检查管理员权限
        User user = (User) session.getAttribute("user");
        if (user == null || !"admin".equals(user.getRole())) {
            return "redirect:/auth/login?role=admin";
        }
        
        List<Job> jobs = jobService.findAllSJJ024();
        model.addAttribute("jobs", jobs);
        return "admin/recruitment";
    }
    
    // 添加职位页面
    @GetMapping("/jobs/add")
    public String addJobPage(HttpSession session, Model model) {
        // 检查管理员权限
        User user = (User) session.getAttribute("user");
        if (user == null || !"admin".equals(user.getRole())) {
            return "redirect:/auth/login?role=admin";
        }
        
        model.addAttribute("job", new Job());
        return "admin/job-form";
    }

    //处理编辑请求
    @PostMapping("/recruitment/save")
    public String saveJob(@ModelAttribute Job job, HttpSession session) {
        // 检查管理员权限
        User user = (User) session.getAttribute("user");
        if (user == null || !"admin".equals(user.getRole())) {
            return "redirect:/auth/login?role=admin";
        }

        if (job.getId() != null) {
            job.setUpdateTime(new Date());
            jobService.updateSJJ024(job);
        }
        return "redirect:/admin/recruitment";
    }
    //进入编辑页面
    @GetMapping("/recruitment/edit/{id}")
    public String editJob(@PathVariable Long id, HttpSession session, Model model) {
        // 检查管理员权限
        User user = (User) session.getAttribute("user");
        if (user == null || !"admin".equals(user.getRole())) {
            return "redirect:/auth/login?role=admin";
        }

        Job job = jobService.findByIdSJJ024(id);
        model.addAttribute("job", job);

        return "admin/job-edit";
    }
    
    // 编辑职位页面
    @GetMapping("/jobs/edit/{id}")
    public String editJobPage(@PathVariable Long id, HttpSession session, Model model) {
        // 检查管理员权限
        User user = (User) session.getAttribute("user");
        if (user == null || !"admin".equals(user.getRole())) {
            return "redirect:/auth/login?role=admin";
        }
        
        Job job = jobService.findByIdSJJ024(id);
        model.addAttribute("job", job);
        return "admin/job-form";
    }
    // 求职申请管理页面
    @GetMapping("/applications")
    public String applications(HttpSession session, Model model) {
        // 检查管理员权限
        User user = (User) session.getAttribute("user");
        if (user == null || !"admin".equals(user.getRole())) {
            return "redirect:/auth/login?role=admin";
        }
        
        List<JobApplication> applications = jobApplicationService.findAllSJJ024();
        model.addAttribute("applications", applications);
        return "admin/applications";
    }
    
    // 处理申请
    @PostMapping("/applications/process")
    public String processApplication(@RequestParam Long id,
                                   @RequestParam String status,
                                   @RequestParam(required = false) String feedback,
                                   HttpSession session) {
        // 检查管理员权限
        User user = (User) session.getAttribute("user");
        if (user == null || !"admin".equals(user.getRole())) {
            return "redirect:/auth/login?role=admin";
        }
        
        jobApplicationService.processApplicationSJJ024(id, status, feedback);
        return "redirect:/admin/applications";
    }

    @GetMapping("/recruitment/applications/{jobId}")
    public String viewJobApplications(@PathVariable Long jobId, HttpSession session, Model model) {
        // 检查管理员权限
        User user = (User) session.getAttribute("user");
        if (user == null || !"admin".equals(user.getRole())) {
            return "redirect:/auth/login?role=admin";
        }

        Job job = jobService.findByIdSJJ024(jobId);
        List<JobApplication> applications = jobApplicationService.findByJobIdSJJ024(jobId);

        model.addAttribute("job", job);
        model.addAttribute("applications", applications);
        model.addAttribute("user", user);

        return "admin/job-applications";
    }

    @PostMapping("/recruitment/applications/process")
    public String processApplication(@RequestParam Long id,
                                     @RequestParam Long jobId,
                                     @RequestParam String status,
                                     @RequestParam(required = false) String feedback,
                                     HttpSession session) {
        // 检查管理员权限
        User user = (User) session.getAttribute("user");
        if (user == null || !"admin".equals(user.getRole())) {
            return "redirect:/auth/login?role=admin";
        }

        jobApplicationService.processApplicationSJJ024(id, status, feedback);
        return "redirect:/admin/recruitment/applications/" + jobId;
    }
}
