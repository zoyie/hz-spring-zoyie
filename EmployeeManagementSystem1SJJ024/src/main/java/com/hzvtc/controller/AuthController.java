package com.hzvtc.controller;

import com.hzvtc.domain.User;
import com.hzvtc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/auth")
public class AuthController {
    
    @Autowired
    private UserService userService;
    
    // 显示登录页面
    @GetMapping("/login")
    public String loginPage(@RequestParam(required = false) String role, Model model) {
        model.addAttribute("role", role != null ? role : "employee");
        return "login";
    }
    
    // 处理登录请求
    @PostMapping("/login")
    public String login(@RequestParam String username,
                       @RequestParam String password,
                       @RequestParam(required = false) String role,
                       HttpSession session,
                       Model model) {
        
        User user = userService.loginSJJ024(username, password);
        
        if (user != null) {
            // 验证角色
            if (role != null && !role.equals(user.getRole())) {
                model.addAttribute("error", "角色不匹配，请选择正确的登录入口");
                model.addAttribute("role", role);
                return "login";
            }
            
            session.setAttribute("user", user);
            
            // 根据角色跳转
            if ("admin".equals(user.getRole())) {
                return "redirect:/admin/dashboard";
            } else {
                return "redirect:/employee/dashboard";
            }
        } else {
            model.addAttribute("error", "用户名或密码错误");
            model.addAttribute("role", role);
            return "login";
        }
    }
    
    // 显示注册页面
    @GetMapping("/register")
    public String registerPage(@RequestParam(required = false) String role, Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("roles", new String[]{"admin", "employee"});
        return "register";
    }
    
    // 处理注册请求
    @PostMapping("/register")
    public String register(@ModelAttribute User user, @RequestParam String role, Model model) {
        // 验证用户名是否已存在
        if (userService.existsByUsernameSJJ024(user.getUsername())) {
            model.addAttribute("error", "用户名已存在，请选择其他用户名");
            model.addAttribute("user", user);
            model.addAttribute("roles", new String[]{"admin", "employee"});
            return "register";
        }

        // 注册用户
        user.setRole(role);
        boolean success = userService.registerSJJ024(user);

        if (success) {
            return "redirect:/auth/login?role=" + role;
        } else {
            model.addAttribute("error", "注册失败，请重试");
            model.addAttribute("user", user);
            model.addAttribute("roles", new String[]{"admin", "employee"});
            return "register";
        }
    }


    // 退出登录
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
