package com.hzvtc.service;

import com.hzvtc.domain.User;

import java.util.List;

public interface UserService {
    
    // 用户登录验证
    User loginSJJ024(String username, String password);
    
    // 用户注册
    boolean registerSJJ024(User user);
    
    // 检查用户名是否存在
    boolean existsByUsernameSJJ024(String username);
    
    // 根据用户名查找用户
    User findByUsernameSJJ024(String username);
    
    // 根据ID查找用户
    User findByIdSJJ024(Long id);
    
    // 更新用户信息
    void updateSJJ024(User user);
    
    // 查询所有用户
    List<User> findAllSJJ024();
    
    // 统计用户总数
    int countSJJ024();
}
