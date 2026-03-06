package com.hzvtc.service;

import com.hzvtc.domain.Employee;

import java.util.List;

public interface EmployeeService {
    
    // 查询所有员工
    List<Employee> findAllSJJ024();
    
    // 根据ID查询员工
    Employee findByIdSJJ024(Integer id);
    
    // 添加员工
    void saveSJJ024(Employee employee);
    
    // 更新员工信息
    void updateSJJ024(Employee employee);
    
    // 删除员工
    void deleteSJJ024(Integer id);

    // 根据条件查询员工
    List<Employee> findByConditionSJJ024(String name, String gender, String position);
    
    // 统计员工总数
    Integer countSJJ024();


}
