package com.hzvtc.service.impl;

import com.hzvtc.dao.UserDao;
import com.hzvtc.domain.User;
import com.hzvtc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    
    @Autowired
    private UserDao userDao;
    
    @Override
    public User loginSJJ024(String username, String password) {
        return userDao.findByUsernameAndPasswordSJJ024(username, password);
    }
    
    @Override
    public boolean registerSJJ024(User user) {
        try {
            // 检查用户名是否已存在
            if (existsByUsernameSJJ024(user.getUsername())) {
                return false;
            }
            
            // 设置默认值
            if (user.getRole() == null || user.getRole().isEmpty()) {
                user.setRole("employee");
            }
            if (user.getStatus() == null || user.getStatus().isEmpty()) {
                user.setStatus("active");
            }
            user.setCreateTime(new Date());
            user.setUpdateTime(new Date());
            
            userDao.insertSJJ024(user);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    @Override
    public boolean existsByUsernameSJJ024(String username) {
        return userDao.existsByUsernameSJJ024(username);
    }
    
    @Override
    public User findByUsernameSJJ024(String username) {
        return userDao.findByUsernameSJJ024(username);
    }
    
    @Override
    public User findByIdSJJ024(Long id) {
        return userDao.findByIdSJJ024(id);
    }
    
    @Override
    public void updateSJJ024(User user) {
        user.setUpdateTime(new Date());
        userDao.updateSJJ024(user);
    }
    
    @Override
    public List<User> findAllSJJ024() {
        return userDao.findAllSJJ024();
    }
    
    @Override
    public int countSJJ024() {
        return userDao.countSJJ024();
    }
}
