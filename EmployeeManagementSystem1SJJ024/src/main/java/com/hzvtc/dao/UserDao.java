package com.hzvtc.dao;

import com.hzvtc.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    
    // 根据用户名和密码查找用户
    User findByUsernameAndPasswordSJJ024(@Param("username") String username, @Param("password") String password);
    
    // 根据用户名查找用户
    User findByUsernameSJJ024(String username);
    
    // 检查用户名是否存在
    boolean existsByUsernameSJJ024(String username);
    
    // 插入新用户
    void insertSJJ024(User user);
    
    // 更新用户信息
    int updateSJJ024(User user);
    
    // 删除用户
    int deleteSJJ024(Long id);
    
    // 根据ID查找用户
    User findByIdSJJ024(Long id);
    
    // 查询所有用户
    List<User> findAllSJJ024();
    
    // 统计用户总数
    int countSJJ024();
}
