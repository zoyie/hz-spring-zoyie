package com.hzvtc.service.impl;

import com.hzvtc.dao.EmployeeDao;
import com.hzvtc.domain.Employee;
import com.hzvtc.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService {
    
    @Autowired
    private EmployeeDao employeeDao;
    
    @Override
    public List<Employee> findAllSJJ024() {
        return employeeDao.findAllSJJ024();
    }
    
    @Override
    public Employee findByIdSJJ024(Integer id) {
        return employeeDao.findByIdSJJ024(id);
    }
    
    @Override
    public void saveSJJ024(Employee employee) {
        employeeDao.insertSJJ024(employee);
    }
    
    @Override
    public void updateSJJ024(Employee employee) {
        employeeDao.updateSJJ024(employee);
    }
    
    @Override
    public void deleteSJJ024(Integer id) {
        employeeDao.deleteSJJ024(id);
    }

    @Override
    public List<Employee> findByConditionSJJ024(String name, String gender, String position) {
        return employeeDao.findByConditionSJJ024(name, gender, position);
    }

    @Override
    public Integer countSJJ024() {
        return employeeDao.countSJJ024();
    }
}
