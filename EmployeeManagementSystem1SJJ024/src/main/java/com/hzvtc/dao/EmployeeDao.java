package com.hzvtc.dao;

import com.hzvtc.domain.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeDao {
    
    // 查询所有员工
    List<Employee> findAllSJJ024();
    
    // 根据ID查询员工
    Employee findByIdSJJ024(Integer id);
    
    // 插入员工
    void insertSJJ024(Employee employee);
    
    // 更新员工信息
    int updateSJJ024(Employee employee);
    
    // 删除员工
    int deleteSJJ024(Integer id);
    
    // 根据条件查询员工
    List<Employee> findByConditionSJJ024(@Param("name") String name,
                                  @Param("gender") String gender,
                                  @Param("position") String position);
    
    // 统计员工总数
    Integer countSJJ024();
}
